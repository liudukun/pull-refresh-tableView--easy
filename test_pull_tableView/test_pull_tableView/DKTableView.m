//
//  DKTableView.m
//  test_pull_tableView
//
//  Created by liudukun on 14/12/16.
//  Copyright (c) 2014年 ldk. All rights reserved.
//

#import "DKTableView.h"


@interface DKTableView ()
{
    BOOL isRefreshing;
 
}
@end

@implementation DKTableView



- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.tableView = [[UITableView alloc]initWithFrame:self.frame];
        [self addSubview:self.tableView];
        self.tableView.delegate = self;
        self.tableView.dataSource= self;

    }
    return self;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.dk_delegate dk_tableView:tableView numberOfRowsInSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [self.dk_delegate dk_tableView:tableView cellForRowAtIndexPath:indexPath];
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView.contentSize.height >scrollView.frame.size.height&&scrollView.contentOffset.y+scrollView.frame.size.height - scrollView.contentSize.height>EFFECTIVE_SCROLL_DISTANCE&&isRefreshing ==NO) {
        //上拉更新数据
        [self refreshAnimationStart];
        [self.dk_delegate loadMoreData];
        isRefreshing = YES;
    }
    if(scrollView.contentOffset.y<EFFECTIVE_SCROLL_DISTANCE*(-1)&&isRefreshing==NO){
        //下拉刷新界面
        [self refreshAnimationStart];
        [self.dk_delegate refreshData];
        isRefreshing = YES;
    }
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    isRefreshing = NO;
    [self refreshAnimationEnd];
    [self.tableView reloadData];
}




//加载动画开始
-(void)refreshAnimationStart{
    self.animationView =  [self.dk_delegate setAnimationView];
    //
    [self addSubview:self.animationView];
}


//加载动画结束
-(void)refreshAnimationEnd{
    //
    [self.animationView removeFromSuperview];
}



@end
