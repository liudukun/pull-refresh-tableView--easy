//
//  DKTableView.h
//  test_pull_tableView
//
//  Created by liudukun on 14/12/16.
//  Copyright (c) 2014年 ldk. All rights reserved.
//
/****************

 集成Table的下拉刷新,上拉加载更多
 
 作者:刘笃坤

****************/


#import <UIKit/UIKit.h>

/*上拉下拉刷新 的触发距离*/
#define EFFECTIVE_SCROLL_DISTANCE 10

@class DKTableView;

@protocol DKTableViewDelegate <NSObject>

@required


- (NSInteger)dk_tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;

- (UITableViewCell *)dk_tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;


//加载更多*/
- (void)loadMoreData;

//刷新数据*/
-(void)refreshData;

/*设置动画*/
-(UIView*)setAnimationView;



@end

@interface DKTableView : UIView<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) id<DKTableViewDelegate> dk_delegate;

@property (nonatomic,strong) UITableView * tableView;

@property (nonatomic,strong) UIView * animationView;


@end
