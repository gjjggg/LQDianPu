//
//  JiaJuViewController.m
//  LQDIANPU
//
//  Created by 郭洪安 on 2017/5/17.
//  Copyright © 2017年 UIViewCon. All rights reserved.
//

#import "JiaJuViewController.h"

@interface JiaJuViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)NSMutableArray * soucedata;
@end

@implementation JiaJuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
//    _soucedata = [[NSMutableArray alloc]init];
//    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
//    _tableView.dataSource = self;
//    _tableView.delegate = self;
//    [self.view addSubview:_tableView];
    
    
   UIImageView * imgView = [[UIImageView alloc] init];
    imgView.frame = CGRectMake(100, 100, 50, 100);
   [self.view addSubview:imgView];
    imgView.backgroundColor = [UIColor yellowColor];
    
    //贝塞尔曲线路径
    UIBezierPath *movePath = [UIBezierPath bezierPath];
    [movePath moveToPoint:CGPointMake(10.0, 10.0)];
    [movePath addQuadCurveToPoint:CGPointMake(100, 300) controlPoint:CGPointMake(300, 100)];
    
    //以下必须导入QuartzCore包
   //关键帧动画（位置）, scaleAnim, opacityAnim
     CAKeyframeAnimation * posAnim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
     posAnim.path = movePath.CGPath;
     posAnim.removedOnCompletion = YES;
    
    
    //缩放动画
      CABasicAnimation *scaleAnim = [CABasicAnimation animationWithKeyPath:@"transform"];
     scaleAnim.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
     scaleAnim.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1, 0.1, 1.0)];
       scaleAnim.removedOnCompletion = YES;
    
    
    //透明动画
    CABasicAnimation *opacityAnim = [CABasicAnimation animationWithKeyPath:@"alpha"];
    opacityAnim.fromValue = [NSNumber numberWithFloat:1.0];
    opacityAnim.toValue = [NSNumber numberWithFloat:0.1];
    opacityAnim.removedOnCompletion = YES;
    
    CAAnimationGroup *animGroup = [CAAnimationGroup animation];
     animGroup.animations = [NSArray arrayWithObjects:posAnim,scaleAnim,opacityAnim, nil];
     animGroup.duration = 1;
   
      [imgView.layer addAnimation:animGroup forKey:nil];
    
    
}
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    
//    return 1;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    
//    return 100;
//}
//
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"firstcell"];
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"firstcell"];
//    }
//    
//    cell.textLabel.text = [NSString stringWithFormat:@"firstcell     %ld", indexPath.row];
//    
//    return cell;
//}
//
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    [self dismissViewControllerAnimated:YES completion:nil];
//}

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
