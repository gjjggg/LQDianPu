//
//  TongRootViewController.m
//  LQDIANPU
//
//  Created by 郭洪安 on 2017/5/17.
//  Copyright © 2017年 UIViewCon. All rights reserved.
//

#import "TongRootViewController.h"
#import "UIView+Frame.h"
#define LZSMargin 10
#define LZSTitlesViewHeight 40
#define LZSNavMaxY 64
#define LZSTitleButtonMargin 30
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
@interface TongRootViewController ()<UIScrollViewDelegate>
@property (strong, nonatomic) UIScrollView *scrollView;
///选中按钮
@property (nonatomic, weak) UIButton *selectedButton;
///下划线
@property (nonatomic, strong) UIView *underline;
@property (nonatomic,strong)UIScrollView * smallescrollView;
@property (strong, nonatomic) NSMutableArray *titleBtns;
///顶部容器View的最大高度
@property (assign, nonatomic) CGFloat topViewHeight;
///添加过得View
@property (nonatomic, strong) NSMutableArray *childScrollViews;
@property (nonatomic, strong) UIScrollView * showView;
@end

@implementation TongRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.selectTitleColor = [UIColor orangeColor];
    self.normalTitleColor = [UIColor grayColor];
    self.underlineColor = self.selectTitleColor;
    self.titleButtonFont = [UIFont systemFontOfSize:16];
    [self topScrollView];
     [self.view addSubview:self.scrollView];
    _scrollView.frame = CGRectMake(0,64+LZSTitlesViewHeight - self.underline.lzs_height+3
                                  , SCREEN_WIDTH, SCREEN_HEIGHT);
}
- (void)viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:animated];
    if (self.childViewControllers.count && !self.childScrollViews.count) {
//        //默认添加第一个视图
        [self addChildViewToScrollView:0];
        //添加标题栏
        [self setupUnderline];
    }
    
}
-(void)topScrollView{
   
    _smallescrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0,64, SCREEN_WIDTH,LZSTitlesViewHeight - self.underline.lzs_height+5)];
    _smallescrollView.backgroundColor = [UIColor cyanColor];
    _smallescrollView.userInteractionEnabled = YES;
    _smallescrollView.pagingEnabled = YES;
    _smallescrollView.bounces = NO;
    _smallescrollView.showsHorizontalScrollIndicator = NO;
    _smallescrollView.showsVerticalScrollIndicator   = NO;
    [self.view addSubview:_smallescrollView];
    
    

}

- (void)setupTitlesButton
{
    NSInteger count = self.childViewControllers.count;
    
    CGFloat titleButtonW = SCREEN_WIDTH / count;
    CGFloat contentSizeW = 0;
    
    UIButton *titleButton = nil;
    
    for (int i = 0; i < count; i++) {
        
        NSInteger titlesCount = self.titleBtns.count;
        if (titlesCount >= i + 1) {
            
            titleButton = self.titleBtns[i];
            
        } else {
            
            UIViewController *vc = self.childViewControllers[i];
            if ([vc.navigationItem.titleView isKindOfClass:[UIButton class]]) {
                
                titleButton = (UIButton *)vc.navigationItem.titleView;
                
                
            } else {
                titleButton = [UIButton buttonWithType:UIButtonTypeCustom];
                [titleButton setTitle:vc.title forState:UIControlStateNormal];
            }
            [titleButton setTitleColor:self.normalTitleColor forState:UIControlStateNormal];
            [titleButton setTitleColor:self.selectTitleColor forState:UIControlStateSelected];
            
            titleButton.titleLabel.font = self.titleButtonFont;
            [titleButton addTarget:self action:@selector(clickTitleButton:) forControlEvents:UIControlEventTouchUpInside];
            
            
            [self.titleBtns addObject:titleButton];
        }
        
        titleButton.tag = i;
        [titleButton sizeToFit];
        
        titleButton.lzs_x = contentSizeW + LZSTitleButtonMargin;
            
       
        
        titleButton.lzs_height = LZSTitlesViewHeight;
        [_smallescrollView addSubview:titleButton];
        
        contentSizeW += titleButton.lzs_width + LZSTitleButtonMargin;
        
        
        
    }
    

        //设置标题栏的滚动范围
        contentSizeW += LZSTitleButtonMargin;
        self.smallescrollView.contentSize = CGSizeMake(contentSizeW, 0);
   
}

- (void)setupUnderline
{
    //取出第一个按钮
    UIButton *firstButton = self.titleBtns[0];
    
    [_smallescrollView addSubview:self.underline];
    
    
    //初始化第一个按钮的状态
    firstButton.selected = YES;
    self.selectedButton = firstButton;
    //强制第一个按钮的文字计算自己的宽度
    [firstButton.titleLabel sizeToFit];
    
    //设置下划线的frame
    self.underline.lzs_height = 2;
    self.underline.lzs_width = firstButton.titleLabel.lzs_width + firstButton.imageView.lzs_width + LZSMargin;
    self.underline.lzs_centerX = firstButton.lzs_centerX;
    self.underline.lzs_y = LZSTitlesViewHeight - self.underline.lzs_height;
}
/**
 * 停止滚动的时候调用
 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //计算滚动到第几页
    CGFloat offsetX = scrollView.contentOffset.x;
    NSInteger page = offsetX / SCREEN_WIDTH;
    //取出对应页码的按钮
    UIButton *button = [self.titleBtns objectAtIndex:page];
    //调用按钮点击事件
    [self clickTitleButton:button];
}
- (void)scrollTitleScrollViewOffsetXWithIndex:(NSInteger)index
{
    UIButton *btn = self.titleBtns[index];
    //设置标题栏的偏移量
    CGFloat offsetX = btn.center.x - (SCREEN_WIDTH ) * 0.5;
    CGFloat offsetMax = self.smallescrollView.contentSize.width - (SCREEN_WIDTH);
    
    if (offsetX < 0) {
        offsetX = 0;
    }
    
    if (offsetMax >=0 && offsetX > offsetMax) {
        offsetX = offsetMax;
    }
    [self.smallescrollView setContentOffset:CGPointMake(offsetX, 0) animated:YES];
    
}
- (NSMutableArray *)titleBtns

{
    if (!_titleBtns) {
        _titleBtns = [NSMutableArray array];
    }
    return _titleBtns;
}
- (UIView *)underline
{
    if (!_underline) {
        //创建下划线
        _underline = [[UIView alloc] init];
        _underline.backgroundColor = self.underlineColor;
    }
    return _underline;
}
#pragma mark - ----------事件处理--------------
/**
 * 点击标题按钮
 */
- (void)clickTitleButton:(UIButton *)button animation:(BOOL)animation
{
    self.selectedButton.selected = NO;
    button.selected = YES;
    
    if (self.selectedButton == button) {
        
        //        [[NSNotificationCenter defaultCenter] postNotificationName:UIButtonDidRepeatClickNotification object:nil];
    }
    self.selectedButton = button;
    
    NSTimeInterval duration = animation?0.25:0;
    [UIView animateWithDuration:duration animations:^{
        //下划线移动到对应按钮的下方，设置下划线的frame
        self.underline.lzs_width = button.titleLabel.lzs_width + button.imageView.lzs_width + LZSMargin;
        self.underline.lzs_centerX = button.lzs_centerX;
        self.underline.lzs_y = LZSTitlesViewHeight - self.underline.lzs_height;
        self.underline.lzs_height = 2;
        //滚动到对应控制器View的位置
        self.scrollView.contentOffset = CGPointMake(button.tag * self.scrollView.lzs_width, self.scrollView.contentOffset.y);
        
    }];
    //添加控制器的View
    [self addChildViewToScrollView:button.tag];
    
 
        [self scrollTitleScrollViewOffsetXWithIndex:button.tag];
    
}
- (void)addChildViewToScrollView:(NSInteger)index
{
    
    UIViewController *vc = self.childViewControllers[index];
    
    self.topViewHeight = LZSTitlesViewHeight - self.underline.lzs_height+5;
    UIScrollView *scrollView = (UIScrollView *)vc.view;
    
    
    
    if (!scrollView.superview) { //添加子视图
        
        
        
//        UIEdgeInsets inset = scrollView.contentInset;
//        inset.top += self.topViewHeight + LZSNavMaxY;
//        scrollView.contentInset = inset;
        
        [self.scrollView addSubview:scrollView];
        
        [scrollView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
        [scrollView addObserver:self forKeyPath:@"contentSize" options:NSKeyValueObservingOptionNew context:nil];
        [scrollView addObserver:self forKeyPath:@"contentInset" options:NSKeyValueObservingOptionNew context:nil];
        [self.childScrollViews addObject:scrollView];
        
    }
    scrollView.frame = CGRectMake(index * SCREEN_WIDTH,0, SCREEN_WIDTH, SCREEN_HEIGHT);
    
    //CGFloat offsetY = scrollView.contentOffset.y;
    CGFloat hoverHeight = LZSTitlesViewHeight + LZSNavMaxY;
    
//    if (self.isHover) { //悬停状态
//        
//        if (offsetY <= -hoverHeight) {
//            offsetY = -hoverHeight;
//        }
//        
//    } else { //非悬停状态
       CGFloat offsetY  = -(self.topViewHeight  + LZSNavMaxY);
   // }
    
//    scrollView.contentOffset = CGPointMake(0, offsetY);
//    //当前屏幕上显示的View
//    _showView = scrollView;
//    
}

- (NSMutableArray *)childScrollViews
{
    if (!_childScrollViews) {
        _childScrollViews = [NSMutableArray array];
    }
    return _childScrollViews;
}

- (void)clickTitleButton:(UIButton *)button
{
    [self clickTitleButton:button animation:YES];
    
}

- (void)addChildViewController:(UIViewController *)childController
{
    [super addChildViewController:childController];
     self.scrollView.contentSize = CGSizeMake(SCREEN_WIDTH * self.childViewControllers.count, 0);
    [self setupTitlesButton];
    
}
- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.translatesAutoresizingMaskIntoConstraints = NO;
        _scrollView.backgroundColor = [UIColor clearColor];
        _scrollView.pagingEnabled = YES;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.delegate = self;
    }
    return _scrollView;
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(UIScrollView *)scrollView change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{



}
@end
