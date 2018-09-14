//
//  DataModel.m
//  SplitDemo
//
//  Created by 智富360 on 2018/9/12.
//  Copyright © 2018年 飞翔. All rights reserved.
//

#import "DataModel.h"
#import "Student.h"

@implementation DataModel
+ (NSArray *)studentArray{
    
   NSArray* dataAry =
            @[@{@"name":@"Jack"},
              @{@"name":@"Rose"},
              @{@"name":@"Peter"},
              @{@"name":@"Lily"},
              @{@"name":@"John"},
              @{@"name":@"Kate"},
              @{@"name":@"David"},
              @{@"name":@"Kolien"}
            ];
    
    NSMutableArray * studentAry =[NSMutableArray arrayWithCapacity:0];
    
    for (NSInteger index = 0; index < dataAry.count; ++index) {
    
        NSDictionary * dict = dataAry[index];
        Student * stu =[[Student alloc]init];
        [stu setValuesForKeysWithDictionary:dict];
        [studentAry addObject:stu];
    }
    
    return  studentAry;
}

@end
