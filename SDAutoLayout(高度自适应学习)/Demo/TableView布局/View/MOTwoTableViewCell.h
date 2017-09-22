//
//  MOTwoTableViewCell.h
//  SDAutoLayout(高度自适应学习)
//
//  Created by 莫莫 on 2017/9/21.
//  Copyright © 2017年 MO. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MOTwoTableViewCellDelegate <NSObject>

/**
 * 点赞 和 评论 的代理
 */
- (void)didClickLikeButtonInCell:(UITableViewCell *)cell;
- (void)didClickcCommentButtonInCell:(UITableViewCell *)cell;

@end

@class SDTimeLineCellModel;

@interface MOTwoTableViewCell : UITableViewCell

@property (nonatomic, strong) SDTimeLineCellModel *model;

@property (nonatomic, strong) NSIndexPath *indexPath;

@property (nonatomic, copy) void (^moreButtonClickedBlock)(NSIndexPath *indexPath);

@property (nonatomic, weak) id<MOTwoTableViewCellDelegate> delegate;

@end
