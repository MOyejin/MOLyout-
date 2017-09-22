//
//  MOThreeViewController.m
//  SDAutoLayout(高度自适应学习)
//
//  Created by 莫莫 on 2017/9/20.
//  Copyright © 2017年 MO. All rights reserved.
//

#import "MOThreeViewController.h"

@interface MOThreeViewController ()

{
    UIButton *_centerButton;
    UIView *_autoWidthViewsContainer;
    UIView *_autoMarginViewsContainer;
}


@end

@implementation MOThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置自定义图片和label位置的button
    [self setupCustomButton];
    
    // 设置一排固定间距自动宽度子view
    [self setupAutoWidthViewsWithCount:5 margin:10];
    
    // 设置一排固定宽度自动间距子view
    [self setupAutoMarginViewsWithCount:10 itemWidth:60];
}

- (void)setupCustomButton{
  
    _centerButton = [UIButton new];
    _centerButton.backgroundColor = [UIColor orangeColor];
    [_centerButton setTitle:@"自定义Button" forState:UIControlStateNormal];
    [_centerButton setImage:[UIImage imageNamed:@"8"] forState:UIControlStateNormal];
    _centerButton.titleLabel.backgroundColor = [UIColor lightGrayColor];
    _centerButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    _centerButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:_centerButton];
    
    
    _centerButton.sd_layout
    .centerXEqualToView(self.view)
    .topSpaceToView(self.view, 74)
    .widthRatioToView(self.view, 0.5)
    .heightIs(120);
    
    //设置button的图片约束
    _centerButton.imageView.sd_layout
    .widthRatioToView(_centerButton, 0.8)
    .topSpaceToView(_centerButton, 10)
    .centerXEqualToView(_centerButton)
    .heightRatioToView(_centerButton, 0.6);
    
    //设置button的文字的约束
    _centerButton.titleLabel.sd_layout
    .topSpaceToView(_centerButton.imageView, 10)
    .leftEqualToView(_centerButton.imageView)
    .rightEqualToView(_centerButton.imageView)
    .bottomSpaceToView(_centerButton, 10);
 
}

// 设置一排固定间距自动宽度子view
- (void)setupAutoWidthViewsWithCount:(NSInteger)count margin:(CGFloat)margin
{
    _autoWidthViewsContainer = [UIView new];
    _autoWidthViewsContainer.backgroundColor = [UIColor greenColor];
    [self.view addSubview:_autoWidthViewsContainer];
    
    NSMutableArray *temp = [NSMutableArray new];
    for (int i = 0; i < count; i++) {
        UIView *view = [UIView new];
        view.backgroundColor = [UIColor orangeColor];
        [_autoWidthViewsContainer addSubview:view];
        view.sd_layout.autoHeightRatio(0.4); // 设置高度约束 (长 / 宽)
        [temp addObject:view];
    }
    
    _autoWidthViewsContainer.sd_layout
    .leftSpaceToView(self.view, 10)
    .rightSpaceToView(self.view, 10)
    .topSpaceToView(_centerButton, 10);
    
    // 此步设置之后_autoWidthViewsContainer的高度可以根据子view自适应
    /*
     horizontalMargin : view之间的间隙
     horizontalEdgeInset: 左右两边的间隙
     verticalEdgeInset: 上下两边的间隙
     */
    [_autoWidthViewsContainer setupAutoWidthFlowItems:[temp copy] withPerRowItemsCount:temp.count verticalMargin:margin horizontalMargin:margin verticalEdgeInset:5 horizontalEdgeInset:margin];
}

// 设置一排固定宽度自动间距子view
- (void)setupAutoMarginViewsWithCount:(NSInteger)count itemWidth:(CGFloat)itemWidth
{
    _autoMarginViewsContainer = [UIView new];
    _autoMarginViewsContainer.backgroundColor = [UIColor blueColor];
    [self.view addSubview:_autoMarginViewsContainer];
    
    NSMutableArray *temp = [NSMutableArray new];
    for (int i = 0; i < count; i++) {
        UIView *view = [UIView new];
        view.backgroundColor = [UIColor orangeColor];
        [_autoMarginViewsContainer addSubview:view];
        view.sd_layout.autoHeightRatio(0.5); // 设置高度约束
        [temp addObject:view];
    }
    
    /*
     withPerRowItemsCount :一行排多少个
     itemWidth : 宽度
     verticalMargin: 距离父View上下的间隙
     verticalEdgeInset: 左右View的间隙
     horizontalEdgeInset : 距离父view左右的间隙
     */
    [_autoMarginViewsContainer setupAutoMarginFlowItems:[temp copy] withPerRowItemsCount:3 itemWidth:itemWidth verticalMargin:10 verticalEdgeInset:3 horizontalEdgeInset:10];
    
    _autoMarginViewsContainer.sd_layout
    .leftSpaceToView(self.view, 10)
    .rightSpaceToView(self.view, 10)
    .topSpaceToView(_autoWidthViewsContainer, 10);

    
}


@end
