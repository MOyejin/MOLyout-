//
//  MOTableViewCell.m
//  SDAutoLayout(高度自适应学习)
//
//  Created by 莫莫 on 2017/9/20.
//  Copyright © 2017年 MO. All rights reserved.
//

#import "MOTableViewCell.h"
#import "MOModel.h"

@implementation MOTableViewCell
{
    UIImageView *_view0;
    UILabel *_view1;
    UILabel *_view2;
    UILabel *_view4;
    UILabel *_view5;
}

- (void)addViews{
    
    UIImageView *view0 = [UIImageView new];
    _view0 = view0;
    
    UILabel *view1 = [UILabel new];
    
    _view1 = view1;
    
    UILabel *view2 = [UILabel new];
    view2.font = [UIFont systemFontOfSize:13];
    _view2 = view2;
    
    
    UILabel *view4 = [UILabel new];
    view4.font = [UIFont systemFontOfSize:11];
    view4.textColor = [UIColor grayColor];
    _view4 = view4;
    
    UILabel *view5 = [UILabel new];
    view5.textAlignment = NSTextAlignmentRight;
    view5.font = [UIFont systemFontOfSize:11];
    view5.textColor = [UIColor grayColor];
    _view5 = view5;

    [self.contentView sd_addSubviews:@[view0,view1,view2,view4,view5]];
}

- (void)sd_Layout{
    
    CGFloat masage = 10;
    
    _view0.sd_layout
    .topSpaceToView(self.contentView, masage)
    .leftSpaceToView(self.contentView, masage)
    .widthIs(50)
    .heightEqualToWidth();
    
    _view1.sd_layout
    .topEqualToView(_view0)
    .leftSpaceToView(_view0, masage)
    .rightSpaceToView(self.contentView, masage)
    .heightIs(20);
    
    _view2.sd_layout
    .leftEqualToView(_view1)
    .rightSpaceToView(self.contentView, masage)
    .topSpaceToView(_view1, masage)
    .autoHeightRatio(0);
    
    _view4.sd_layout
    .leftEqualToView(_view1)
    .widthRatioToView(_view2, 0.5)
    .heightIs(30)
    .topSpaceToView(_view2, masage);
    
    _view5.sd_layout
    .rightEqualToView(_view1)
    .topEqualToView(_view4)
    .heightRatioToView(_view4, 1)
    .leftSpaceToView(_view4, masage);
    
    
      //MARK:**高度自适应cell设置步骤
    [self setupAutoHeightWithBottomView:_view5 bottomMargin:masage];
    
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self addViews];
        [self sd_Layout];
    }
    
    return self;
}

- (void)setModel:(MOModel *)model{
    _model = model;
    
    _view0.image = [UIImage imageNamed:model.imageName];
    _view2.text = model.content;
    _view1.text = model.title;
    _view4.text = model.username;
    _view5.text = model.time;
    
    
}


@end
