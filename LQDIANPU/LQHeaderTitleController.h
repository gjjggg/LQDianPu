//
//  LQHeaderTitleController.h
//  LQDIANPU
//
//  Created by 郭洪安 on 2017/2/17.
//  Copyright © 2017年 UIViewCon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+Frame.h"


#define LZSMargin 10
#define LZSTitlesViewHeight 40
#define LZSNavMaxY 64
#define LZSTitleButtonMargin 40

#define LZSScreenW [UIScreen mainScreen].bounds.size.width
#define LZSScreenH [UIScreen mainScreen].bounds.size.height

typedef NS_ENUM(NSInteger, LQHeaderViewStyle) {
    LQHeaderViewStyleCenter,
    LQHeaderViewStyleBottom
};
@interface LQHeaderTitleController : UIViewController

///顶部视图
@property (strong, nonatomic) UIView *headerView;
///顶部视图布局类型
@property (assign, nonatomic) LQHeaderViewStyle headerViewStyle;
///标题栏背景颜色
@property (strong, nonatomic) UIColor *titlesViewBackgroundColor;
///选中按钮的颜色
@property (strong, nonatomic) UIColor *selectTitleColor;
///默认按钮颜色
@property (strong, nonatomic) UIColor *normalTitleColor;
///标题按钮字体
@property (strong, nonatomic) UIFont *titleButtonFont;
///选中下划线颜色
@property (strong, nonatomic) UIColor *underlineColor;
///是否有导航栏
@property (assign, nonatomic) BOOL hasNavigationBar;


///标题栏是否可以滚动
@property (assign, nonatomic) BOOL titlesViewCanScroll;


@end

