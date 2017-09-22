//
//  MOFourViewController.m
//  SDAutoLayout(高度自适应学习)
//
//  Created by 莫莫 on 2017/9/20.
//  Copyright © 2017年 MO. All rights reserved.
//

#import "MOFourViewController.h"

@interface MOFourViewController ()

@end

@implementation MOFourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    UIScrollView *scrollView = [UIScrollView new];
    [self.view addSubview:scrollView];
    scrollView.sd_layout.spaceToSuperView(UIEdgeInsetsZero);
    
    NSString *text = @"前世，我是那株佛前的莲吗？梵音袅袅中，莲心自开。轻触时光，一些念，若尘；一些梦，幽幽。关于记忆，或深或浅；关于思念，亦浓亦淡。指尖的温度，滑过静好的岁月，任一剪相思，妖娆了心灵深处的晓月眉弯洇一笔漫漫时光，舞一阕水墨横斜，凭窗依栏，捻一则千年的经卷，隔着月光水岸，为你，立成一株瘦笺。前世，我是那株佛前的莲吗？梵音袅袅中，莲心自开。轻触时光，一些念，若尘；一些梦，幽幽。关于记忆，或深或浅；关于思念，亦浓亦淡。指尖的温度，滑过静好的岁月，任一剪相思，妖娆了心灵深处的晓月眉弯洇一笔漫漫时光，舞一阕水墨横斜，凭窗依栏，捻一则千年的经卷，隔着月光水岸，为你，立成一株瘦笺。前世，我是那株佛前的莲吗？梵音袅袅中，莲心自开。轻触时光，一些念，若尘；一些梦，幽幽。关于记忆，或深或浅；关于思念，亦浓亦淡。指尖的温度，滑过静好的岁月，任一剪相思，妖娆了心灵深处的晓月眉弯洇一笔漫漫时光，舞一阕水墨横斜，凭窗依栏，捻一则千年的经卷，隔着月光水岸，为你，立成一株瘦笺。前世，我是那株佛前的莲吗？梵音袅袅中，莲心自开。轻触时光，一些念，若尘；一些梦，幽幽。关于记忆，或深或浅；关于思念，亦浓亦淡。指尖的温度，滑过静好的岁月，任一剪相思，妖娆了心灵深处的晓月眉弯洇一笔漫漫时光，舞一阕水墨横斜，凭窗依栏，捻一则千年的经卷，隔着月光水岸，为你，立成一株瘦笺。前世，我是那株佛前的莲吗？梵音袅袅中，莲心自开。轻触时光，一些念，若尘；一些梦，幽幽。关于记忆，或深或浅；关于思念，亦浓亦淡。指尖的温度，滑过静好的岁月，任一剪相思，妖娆了心灵深处的晓月眉弯洇一笔漫漫时光，舞一阕水墨横斜，凭窗依栏，捻一则千年的经卷，隔着月光水岸，为你，立成一株瘦笺。";
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:8];
    UIColor *color = [UIColor blackColor];
    NSAttributedString *string = [[NSAttributedString alloc] initWithString:text attributes:@{NSForegroundColorAttributeName : color, NSParagraphStyleAttributeName: paragraphStyle}];
    
    
    UILabel *label = [UILabel new];
    label.font = [UIFont systemFontOfSize:12];
    label.attributedText = string;
    
    UIImageView *imageView = [UIImageView new];
    [imageView sd_setImageWithURL:[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1505993948635&di=1cbfb501f7c9907b961e654bd9f3d089&imgtype=0&src=http%3A%2F%2Fwww.zbjdyw.com%2Fqqwebhimgs%2Fuploads%2Fbd879912.jpg"]];
    
    [scrollView sd_addSubviews:@[label, self.view0, imageView]];
    
    
    label.sd_layout
    .leftSpaceToView(scrollView, 10)
    .rightSpaceToView(scrollView, 10)
    .topSpaceToView(scrollView, 70)
    .autoHeightRatio(0);
    
    // 标注lable的text为attributedString
    label.isAttributedContent = YES;
    
    
    self.view0.sd_layout
    .topSpaceToView(label, 10)
    .widthIs(100)
    .heightIs(100)
    .centerXEqualToView(scrollView);
    
    //设置圆角
    self.view0.sd_cornerRadiusFromWidthRatio = @(0.5);
    
    imageView.sd_layout
    .centerXEqualToView(self.view0)
    .topSpaceToView(self.view0, 10)
    .widthIs(100)
    .heightIs(100);

    [scrollView setupAutoHeightWithBottomView:imageView bottomMargin:10];
}


@end
