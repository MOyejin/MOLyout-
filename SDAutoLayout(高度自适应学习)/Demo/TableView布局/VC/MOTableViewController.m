//
//  MOTableViewController.m
//  SDAutoLayout(高度自适应学习)
//
//  Created by 莫莫 on 2017/9/20.
//  Copyright © 2017年 MO. All rights reserved.
//

#import "MOTableViewController.h"
#import "MOTableViewCell.h"
#import "MOModel.h"

@interface MOTableViewController ()
{
    NSArray *_textArray;
    
}
@property (nonatomic,assign)NSInteger rowCount;

@end

@implementation MOTableViewController



- (void)viewDidLoad {
    [super viewDidLoad];

    _rowCount = (long)10;
    
    NSString *dataFilePath = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:dataFilePath];
    NSDictionary *rootDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    
    _textArray = rootDic[@"momo"];
    

    __weak typeof(self) weakSelf = self;
    
    
    MJRefreshBackNormalFooter *footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            weakSelf.rowCount += 10;
            [weakSelf.tableView reloadData];
            [weakSelf.tableView.mj_footer endRefreshing];
        });

    }];
    
    footer.arrowView.image = [UIImage imageNamed:@""];
    self.tableView.mj_footer = footer;
    
    

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _rowCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    int index = indexPath.row % 5;
    static NSString *key_id = @"MOTableViewCell";
    MOTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:key_id];
    if (!cell) {
        
        cell = [[MOTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:key_id];
    }
    cell.model = [MOModel mj_objectWithKeyValues:_textArray[index]];
    
    return cell;
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    int index = indexPath.row % 5;
    MOModel *model = [MOModel mj_objectWithKeyValues:_textArray[index]];
    
    // >>>>>>>>>>>>>>>>>>>>> * cell自适应步骤2 * >>>>>>>>>>>>>>>>>>>>>>>>
    /* model 为模型实例， keyPath 为 model 的属性名，通过 kvc 统一赋值接口 */
    return [self.tableView cellHeightForIndexPath:indexPath model:model keyPath:@"model" cellClass:[MOTableViewCell class] contentViewWidth:[self cellContentViewWith]];
    
}

- (CGFloat)cellContentViewWith
{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    
    // 适配ios7横屏
    if ([UIApplication sharedApplication].statusBarOrientation != UIInterfaceOrientationPortrait && [[UIDevice currentDevice].systemVersion floatValue] < 8) {
        width = [UIScreen mainScreen].bounds.size.height;
    }
    return width;
}

@end
