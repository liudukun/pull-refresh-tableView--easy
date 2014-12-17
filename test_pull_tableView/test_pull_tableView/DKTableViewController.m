//
//  DKTableViewController.m
//  test_pull_tableView
//
//  Created by imac_ldk on 14-7-22.
//  Copyright (c) 2014年 ldk. All rights reserved.
//

#import "DKTableViewController.h"

#define EFFECTIVE_SCROLL_DISTANCE 10


@interface DKTableViewController ()
{
    NSMutableArray * arrProducts ;
    int start;
    DKTableView * dk_tableView;
}


@end

@implementation DKTableViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self refreshData];
    dk_tableView = [[DKTableView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:dk_tableView];
    dk_tableView.dk_delegate = self;


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)dk_tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return arrProducts.count;
}

-(UITableViewCell *)dk_tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"tasdasdldgkja"];
        if (cell == nil) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"tasdasdldgkja"];
        }
    
        cell.backgroundColor = arrProducts[indexPath.row ];
    
    
        return cell;
}

//加载更多数据
- (void)loadMoreData{
   // arrProducts = [NSMutableArray array];
    start += 20;
    for (int i=0;i<start; i++) {
        UIColor * ac = [UIColor colorWithRed:arc4random_uniform(100)*1.0/100 green:arc4random_uniform(100)*1.0/100 blue:arc4random_uniform(100)*1.0/100 alpha:arc4random_uniform(100)*1.0/100];
        [arrProducts addObject:ac];
    }
    
    
}


//刷新数据
-(void)refreshData{
    arrProducts = [NSMutableArray array];
    start = 20;
    for (int i=0;i<start; i++) {
        UIColor * ac = [UIColor colorWithRed:arc4random_uniform(100)*1.0/100 green:arc4random_uniform(100)*1.0/100 blue:arc4random_uniform(100)*1.0/100 alpha:arc4random_uniform(100)*1.0/100];
        [arrProducts addObject:ac];
    }
    
    
}

//加载动画开始
-(UIView*)setAnimationView{
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    indicator.center = dk_tableView.center;
    indicator.tintColor = [UIColor redColor];
    indicator.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.5];
    [ indicator  startAnimating];
    return indicator;
    
}


@end
