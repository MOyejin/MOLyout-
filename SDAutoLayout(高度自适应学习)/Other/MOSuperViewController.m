//
//  MOSuperViewController.m
//  SDAutoLayout(高度自适应学习)
//
//  Created by 莫莫 on 2017/9/20.
//  Copyright © 2017年 MO. All rights reserved.
//

#import "MOSuperViewController.h"

@interface MOSuperViewController ()

@end

@implementation MOSuperViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupDemoViews];
    
}

- (void)setupDemoViews
{
    UIView *view0 = [UIView new];
    view0.backgroundColor = [UIColor redColor];
    self.view0 = view0;
    
    UIView *view1 = [UIView new];
    view1.backgroundColor = [UIColor grayColor];
    self.view1 = view1;
    
    UIView *view2 = [UIView new];
    view2.backgroundColor = [UIColor brownColor];
    self.view2 = view2;
    
    UIView *view3 = [UIView new];
    view3.backgroundColor = [UIColor orangeColor];
    self.view3 = view3;
    
    UIView *view4 = [UIView new];
    view4.backgroundColor = [UIColor purpleColor];
    self.view4 = view4;
    
    UIView *view5 = [UIView new];
    view5.backgroundColor = [UIColor yellowColor];
    self.view5 = view5;
    
    UIView *view6 = [UIView new];
    view6.backgroundColor = [UIColor cyanColor];
    self.view6 = view6;
    
    UIView *view7 = [UIView new];
    view7.backgroundColor = [UIColor magentaColor];
    self.view7 = view7;
    
    UIView *view8 = [UIView new];
    view8.backgroundColor = [UIColor blackColor];
    self.view8 = view8;
    
    [self.view sd_addSubviews:@[view0, view1, view2, view3, view4, view5, view6, view7, view8]];
}


@end
