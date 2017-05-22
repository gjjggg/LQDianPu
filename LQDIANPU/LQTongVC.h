//
//  LQTongVC.h
//  LQDIANPU
//
//  Created by 郭洪安 on 2017/5/17.
//  Copyright © 2017年 UIViewCon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LQTongVC : UIView<UIScrollViewDelegate>
@property(nonatomic,strong)UIScrollView * smallescrollView ;
@property(nonatomic,strong)UIScrollView * bigscrollView;

-(void)Frame:(CGRect)frame andsmallScrollView:(CGRect)screframe  andTitleArray:(NSArray *)titles andVCArray:(NSArray *)VCs;
@end

