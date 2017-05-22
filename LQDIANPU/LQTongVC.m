//
//  LQTongVC.m
//  LQDIANPU
//
//  Created by 郭洪安 on 2017/5/17.
//  Copyright © 2017年 UIViewCon. All rights reserved.
//

#import "LQTongVC.h"
#import "UIColor+Extension.h"
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
@interface LQTongVC ()
@property (nonatomic,strong)NSMutableArray * titlesArr;
@property (nonatomic,strong)NSMutableArray * VCArr;
@property (nonatomic,strong)NSMutableArray * yiJiaZaiArr;
@property(nonatomic,strong) UILabel * xianlabel;
@property (nonatomic,assign)float   bigVcHieght;
@property(nonatomic,assign)float smallScrollHieght;
@end
@implementation LQTongVC


-(void)Frame:(CGRect)frame andsmallScrollView:(CGRect)screframe  andTitleArray:(NSArray *)titles andVCArray:(NSArray *)VCs{
    
 
        _bigVcHieght = SCREEN_HEIGHT-screframe.size.height;
        _titlesArr = [[NSMutableArray alloc]initWithArray:titles];
        _VCArr = [[NSMutableArray alloc]initWithArray:VCs];//www.kancloud.cn/axpwx/sldl-api/289720#
        _yiJiaZaiArr = [[NSMutableArray alloc]init];
        _smallescrollView = [[UIScrollView alloc] initWithFrame:screframe];
        _smallescrollView.backgroundColor = [UIColor whiteColor];
        _smallescrollView.userInteractionEnabled = YES;
        _smallescrollView.pagingEnabled = YES;
        _smallescrollView.bounces = NO;
        _smallescrollView.showsHorizontalScrollIndicator = NO;
        _smallescrollView.showsVerticalScrollIndicator   = NO;
        [self addSubview:_smallescrollView];
        [self createSmallescrollSuperWithFrame:screframe];
        
        _bigscrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0,frame.size.height, SCREEN_WIDTH, _bigVcHieght-49)];
        _bigscrollView.pagingEnabled = YES;
        _bigscrollView.delegate =self;
        _bigscrollView.bounces = NO;
        _bigscrollView.backgroundColor =[UIColor clearColor];
        _bigscrollView.contentSize = CGSizeMake(VCs.count*SCREEN_WIDTH, _bigVcHieght-49);
        _bigscrollView.bounces = NO;
        _bigscrollView.scrollEnabled = NO;
        _bigscrollView.showsHorizontalScrollIndicator = NO;
        _bigscrollView.showsVerticalScrollIndicator   = NO;
        
        UIViewController * ChildVC= VCs[0];
        [_bigscrollView addSubview:ChildVC.view];
        
        [_yiJiaZaiArr  addObject:VCs[0]];
        

}
-(void)createSmallescrollSuperWithFrame:(CGRect)frame{
    _smallScrollHieght = frame.size.width/_titlesArr.count;
    for (int i=0; i<_titlesArr.count; i++) {
        
        UIButton * leftBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        leftBtn.frame=CGRectMake( _smallScrollHieght*i, 0,_smallScrollHieght, frame.size.height);
        [leftBtn setTitle:_titlesArr[i] forState:UIControlStateNormal];
        leftBtn.titleLabel.numberOfLines =2;
        leftBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [leftBtn setTitleColor:[UIColor colorWithHex:@"#333333" alpha:1.0] forState:UIControlStateNormal];
        [leftBtn setTitleColor:[UIColor colorWithHex:@"#ed6d00" alpha:1.0] forState:UIControlStateSelected];
        leftBtn.backgroundColor=[UIColor clearColor];
        leftBtn.tag=1000+i;
        leftBtn.userInteractionEnabled =YES;
        leftBtn.titleLabel.font=[UIFont systemFontOfSize:14];
        [leftBtn addTarget:self action:@selector(scrrrrpressBtn:) forControlEvents:UIControlEventTouchUpInside];
        [_smallescrollView addSubview:leftBtn];
        if (i==0) {
            leftBtn.selected =YES;
            //            _xianlabel=[[UILabel alloc]initWithFrame:CGRectMake(13,28, 43, 3)];
            //            _xianlabel.backgroundColor=RTOrangeColor;
            //            [_smallescrollView addSubview:_xianlabel];
        }
        
    }
    _smallescrollView.contentSize = CGSizeMake( frame.size.width, 0);
    
}
-(void)scrrrrpressBtn:(UIButton *)btn{
    
    
    
    
    
    [self chageZhuangTai:(int)btn.tag-1000];
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{ if([scrollView isMemberOfClass:[UIScrollView class]])
{
    CGFloat index = scrollView.contentOffset.x / SCREEN_WIDTH;
    
    [self chageZhuangTai:index];
    
}
}

-(void)chageZhuangTai:(int)index{
    for (int i=0; i<_titlesArr.count; i++) {
        [UIView animateWithDuration:0.5 animations:^{
            UIButton * button =(UIButton *)[_smallescrollView viewWithTag:1000+i];
            if (button.tag == index+1000) {
                button.selected = YES;
            }
            else{
                button.selected = NO;
            }
            _xianlabel.frame = CGRectMake(_smallScrollHieght, 28, 43, 3);
            
        }];
        
    }
    int a=2;
    for (int i=0; i<_yiJiaZaiArr.count; i++) {
        if (_yiJiaZaiArr[i] == _VCArr[index]) {
            a=1;
            [UIView animateWithDuration:0.5 animations:^{
                
                _bigscrollView.contentOffset = CGPointMake(SCREEN_WIDTH*index, 0);
            }];
            return;
            
        }
        
    }
    if (a==2) {
        UIViewController * ChildVC= _VCArr[index];
        ChildVC.view.frame = CGRectMake(SCREEN_WIDTH*index, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        [_bigscrollView addSubview:ChildVC.view];
        [_yiJiaZaiArr addObject:_VCArr[index]];
        
        
        
        
        [UIView animateWithDuration:0.5 animations:^{
            
            _bigscrollView.contentOffset = CGPointMake(SCREEN_WIDTH*index, 0);
        }];
        
    }
    
    
    
}


@end
