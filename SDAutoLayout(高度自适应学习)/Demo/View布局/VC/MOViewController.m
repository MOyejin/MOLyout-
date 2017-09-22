//
//  MOViewController.m
//  SDAutoLayout(高度自适应学习)
//
//  Created by 莫莫 on 2017/9/20.
//  Copyright © 2017年 MO. All rights reserved.
//

#import "MOViewController.h"
#define kTimeInterval 0.8

@interface MOViewController ()

{
    NSTimer *_timer;
    CGFloat _widthRatio;
}



@end

@implementation MOViewController


- (void)sd_lyout{
    
    
    self.view0.sd_layout
    .leftSpaceToView(self.view, 20)
    .topSpaceToView(self.view, 200)
    .heightIs(130)
    .widthRatioToView(self.view, _widthRatio);
    
    self.view1.sd_layout
    .leftSpaceToView(self.view0, 10)
    .topEqualToView(self.view0)
    .heightIs(60)
    .widthRatioToView(self.view0, 0.5);
    
    self.view2.sd_layout
    .leftSpaceToView(self.view1, 10)
    .topEqualToView(self.view1)
    .heightRatioToView(self.view1, 1);
    
    self.view3.sd_layout
    .leftEqualToView(self.view1)
    .topSpaceToView(self.view1, 10)
    .heightRatioToView(self.view1, 1)
    .widthRatioToView(self.view1, 1);
    
    self.view4.sd_layout
    .leftEqualToView(self.view2)
    .topEqualToView(self.view3)
    .heightRatioToView(self.view3, 1)
    .widthRatioToView(self.view2, 1);
    
    [self.view0 addSubview: self.view5];
    self.view5.sd_layout
    .centerYEqualToView(self.view0)
    .rightSpaceToView(self.view0, 10)
    .widthRatioToView(self.view0, 0.5)
    .heightIs(20);
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    _widthRatio = 0.4;
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:kTimeInterval target:self selector:@selector(animation) userInfo:nil repeats:YES];
    
    //在父类已经创建好View
    
    [self sd_lyout];//创建好才能布局
    
    
}

- (void)animation
{
    if (_widthRatio >= 0.4) {
        _widthRatio = 0.1;
    } else {
        _widthRatio = 0.4;
    }
    
    // 开启动画
    [UIView animateWithDuration:kTimeInterval animations:^{
        self.view0.sd_layout
        .widthRatioToView(self.view, _widthRatio);
        [self.view0 updateLayout]; // 调用此方法开启view0动画效果
        [self.view5 updateLayout]; // 调用此方法开启view5动画效果
//        /*
//         调用[self.view0 updateLayout]就可以实现view0和其它兄弟view一起动画，view0和view5是父子关系，如果view0需要动画要再主动调用一次[self.view5 updateLayout]
//         */
    }];
    
    
}

- (void)viewDidDisappear:(BOOL)animated
{
    [_timer invalidate];
    _timer = nil;
}


@end
