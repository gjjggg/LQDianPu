//
//  LQHuaDongViewController.m
//  LQDIANPU
//
//  Created by 郭洪安 on 2017/2/17.
//  Copyright © 2017年 UIViewCon. All rights reserved.
//

#import "LQHuaDongViewController.h"
#import "FirstTableViewController.h"
#import "SecondTableViewController.h"
#import "ThirdTableViewController.h"
#import "SDCycleScrollView.h"
@interface LQHuaDongViewController ()<SDCycleScrollViewDelegate>

@end

@implementation LQHuaDongViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupAllChildVc];
    self.hasNavigationBar = YES;
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0,self.view.frame.size.width, 200)];
    imageView.contentMode = UIViewContentModeScaleToFill;
    imageView.backgroundColor  =[UIColor yellowColor];
    
    SDCycleScrollView *_scrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, self.view.frame.size.width,200) delegate:self placeholderImage:nil];
    
    NSMutableArray *imageArr=[[NSMutableArray alloc]initWithArray:@[@"https://img.shunliandongli.com/attachment/images/2016/12/KIdI2JUbu11d1xi8qLjz5JXGxQ8g8B.jpg_750x10000.jpg?75",@"https://img.shunliandongli.com/attachment/images/2016/12/KIdI2JUbu11d1xi8qLjz5JXGxQ8g8B.jpg_750x10000.jpg?75",@"https://img.shunliandongli.com/attachment/images/2016/12/KIdI2JUbu11d1xi8qLjz5JXGxQ8g8B.jpg_750x10000.jpg?75"]];
    
 
    _scrollView.imageURLStringsGroup =imageArr;
    _scrollView.pageControlStyle = SDCycleScrollViewPageContolStyleClassic;
  //  [_headView addSubview:_scrollView];
    
    self.headerView = _scrollView;
    self.headerViewStyle = LQHeaderViewStyleBottom;
    //
    
}
- (void)setupAllChildVc
{
    
    UIViewController *first = [[FirstTableViewController alloc] init];
    first.title = @"赛况播报";
    
    [self addChildViewController:first];
    
    UIViewController *second = [[SecondTableViewController alloc] init];
    second.title = @"我的赛况";
    [self addChildViewController:second];
    
    UIViewController *third = [[ThirdTableViewController alloc] init];
    third.title = @"大赛规则";
    [self addChildViewController:third];
    
    
    
}
#pragma mark - ----------图片点击-----------
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index;
{
    NSLog(@"图片点击");


}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
