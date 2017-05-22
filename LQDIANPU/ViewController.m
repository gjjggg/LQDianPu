//
//  ViewController.m
//  LQDIANPU
//
//  Created by 郭洪安 on 2017/2/17.
//  Copyright © 2017年 UIViewCon. All rights reserved.
//

#import "ViewController.h"
#import "LQHuaDongViewController.h"
#import "LQGenRenViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame =CGRectMake(100, 100, 100, 100);
    btn.backgroundColor =[UIColor redColor];
    [self.view addSubview:btn];
    [btn setTitle:@"店铺" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton * btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.frame =CGRectMake(100, 250, 100, 100);
    btn1.backgroundColor =[UIColor redColor];
    [self.view addSubview:btn1];
    [btn1 setTitle:@"geren" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(addpress:) forControlEvents:UIControlEventTouchUpInside];
    
}
-(void)addpress:(UIButton *)btn{

    LQGenRenViewController * lq = [[LQGenRenViewController alloc]init];
    UINavigationController * nav =[[UINavigationController alloc]initWithRootViewController:lq];
    [self presentViewController:nav animated:YES completion:nil];



}
-(void)press:(UIButton *)btn{
    
    LQHuaDongViewController * lq = [[LQHuaDongViewController alloc]init];
    UINavigationController * nav =[[UINavigationController alloc]initWithRootViewController:lq];
    [self presentViewController:nav animated:YES completion:nil];
    
    
    
}


@end
