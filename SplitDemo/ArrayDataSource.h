//
//  ArrayDataSource.h
//  SplitDemo
//
//  Created by 智富360 on 2018/9/12.
//  Copyright © 2018年 飞翔. All rights reserved.
//

#import <UIKit/UIKit.h>
//拆分出来的负责tableView的dataSource

//显示cell的block
typedef void(^CellBlock)(UITableViewCell* cell,id item);

// 页面跳转的block
typedef void(^SKipBlock)(id item);

@interface ArrayDataSource : NSObject<UITableViewDataSource,UITableViewDelegate>

-(instancetype)initWithItems:(NSArray*)items identifer:(NSString*)identider cellBlock:(CellBlock)block skip:(SKipBlock)skipBlock;

@end
