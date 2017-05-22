//
//  LQGenRenViewController.m
//  LQDIANPU
//
//  Created by 郭洪安 on 2017/5/17.
//  Copyright © 2017年 UIViewCon. All rights reserved.
//

#import "LQGenRenViewController.h"
#import "LQTongVC.h"
#import "JiaJuViewController.h"
#import "MeiZhuangViewController.h"
#import "FirstTableViewController.h"
#import "SecondTableViewController.h"
#import "UIColor+Extension.h"
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
@interface LQGenRenViewController ()

@end

@implementation LQGenRenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupAllChildVc];
    self.automaticallyAdjustsScrollViewInsets = NO;
   
    
    
}

- (void)setupAllChildVc
{
    
    UIViewController *first = [[JiaJuViewController alloc] init];
    first.title = @"赛况播报";
    
    [self addChildViewController:first];
    
    UIViewController *second = [[MeiZhuangViewController alloc] init];
    second.title = @"我的赛况";
    [self addChildViewController:second];
    
    UIViewController *third = [[JiaJuViewController alloc] init];
    third.title = @"大赛规则河涸海干湖广会馆";
    [self addChildViewController:third];
    
//    UIViewController *first = [[FirstTableViewController alloc] init];
//    first.title = @"赛况播报";
//    
//    [self addChildViewController:first];
//    
//    UIViewController *second = [[SecondTableViewController alloc] init];
//    second.title = @"我的赛况";
//    [self addChildViewController:second];
//    
//    UIViewController *third = [[FirstTableViewController alloc] init];
//    third.title = @"大赛规则河涸海干湖广会馆";
//    [self addChildViewController:third];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
