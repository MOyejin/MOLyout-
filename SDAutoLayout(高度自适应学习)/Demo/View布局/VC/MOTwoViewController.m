//
//  MOTwoViewController.m
//  SDAutoLayout(高度自适应学习)
//
//  Created by 莫莫 on 2017/9/20.
//  Copyright © 2017年 MO. All rights reserved.
//

#import "MOTwoViewController.h"

@interface MOTwoViewController ()

@end

@implementation MOTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    // demo1.内容自适应view
    [self setupAutoHeightView];
    
    // demo2.宽度自适应label
    [self setupAutoWidthLabel];
    
    // demo3.高度自适应label
    [self setupAutoHeightLabel];
    
    // demo4.设置button根据文字size自适应
    [self setupAutoSizeButton];
}

- (void)setupAutoHeightView{
    
    /*
     设置view1高度根据子view而自适应(在view1中加入两个子view(testLabel和testView)
     ，然后设置view1高度根据子view内容自适应)
     */
    UILabel *label = [UILabel new];
    label.text = @"这个紫色的label会根据这些文字内容高度自适应；而这个灰色的父view会根据紫色的label和橙色的view具体情况实现高度自适应。\nGot it! OH YAEH!";
    label.backgroundColor = [UIColor purpleColor];
    
    UIView *view_main = [UIView new];
    view_main.backgroundColor = [UIColor orangeColor];
    
    [self.view0 sd_addSubviews:@[label,view_main]];
    
    label.sd_layout
    .topSpaceToView(self.view0, 10)
    .leftSpaceToView(self.view0, 10)
    .rightSpaceToView(self.view0, 10)
    .autoHeightRatio(0);// 设置文本内容自适应，如果这里的参数为大于0的数值则会以此数值作为view的高宽比设置view的高度
    
    view_main.sd_layout
    .leftEqualToView(label)
    .topSpaceToView(label, 10)
    .widthRatioToView(label, 1)
    .heightIs(30);
    
    self.view0.sd_layout
    .leftSpaceToView(self.view, 10)
    .topSpaceToView(self.view, 80)
    .rightSpaceToView(self.view, 10);
    
    // view0高度根据子其内容自适应
    [self.view0 setupAutoHeightWithBottomView:view_main bottomMargin:10];
    
}

- (void)setupAutoWidthLabel{
    
    UILabel *autowidthlabel = [UILabel new];
    autowidthlabel.backgroundColor = [[UIColor orangeColor] colorWithAlphaComponent:0.5];
    autowidthlabel.font = [UIFont systemFontOfSize:12];
    autowidthlabel.text =  @"宽度自适应(距离父view右边距10)";
    [self.view addSubview:autowidthlabel];
    
    autowidthlabel.sd_layout
    .rightSpaceToView(self.view, 10)
    .heightIs(20)
    .bottomSpaceToView(self.view, 50);
    
    // 宽度自适应
    [autowidthlabel setSingleLineAutoResizeWithMaxWidth:0];
    
}

- (void)setupAutoHeightLabel{
    
    
    UILabel *autoHeightlabel = [UILabel new];
    autoHeightlabel.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.5];
    autoHeightlabel.font = [UIFont systemFontOfSize:12];
    autoHeightlabel.text = @"我最高我最高我最高我最高我最高我最高我最高我最高我最高我最高我最高我最高我最高,高度自适应(距离父view左边距10，底部和其右侧label相同，宽度为100)我最高";
    
    [self.view addSubview:autoHeightlabel];
    
    autoHeightlabel.sd_layout
    .bottomSpaceToView(self.view, 50)
    .leftSpaceToView(self.view, 10)
    .widthIs(100)
    .autoHeightRatio(0);

}

- (void)setupAutoSizeButton{
    
    UIButton *btn = [UIButton new];
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"button根据文字自适应,长一点长一点长一点" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    btn.titleLabel.font = [UIFont systemFontOfSize:12];
    
    btn.sd_layout
    .centerXEqualToView(self.view)
    .topSpaceToView(self.view0, 25);
    
    [btn setupAutoSizeWithHorizontalPadding:8 buttonHeight:20];
    
}

@end
