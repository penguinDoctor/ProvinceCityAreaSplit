//
//  ArrayDataSource.m
//  SplitDemo
//
//  Created by 智富360 on 2018/9/12.
//  Copyright © 2018年 飞翔. All rights reserved.
//

#import "ArrayDataSource.h"
#import "Student.h"

@interface ArrayDataSource()

@property(nonatomic,copy)NSArray *dataAry;
@property(nonatomic,copy)NSString *identifer;
@property(nonatomic,copy)CellBlock block;
@property(nonatomic,copy)SKipBlock skipBlock;

@end

@implementation ArrayDataSource

-(instancetype)initWithItems:(NSArray *)items identifer:(NSString *)identider cellBlock:(CellBlock)block skip:(SKipBlock)skipBlock{
    
    ArrayDataSource   * dataSource =[[ArrayDataSource alloc]init];
    
    dataSource.dataAry = items;
    dataSource.identifer = identider;
    dataSource.block = block;
    dataSource.skipBlock = skipBlock;
    return  dataSource;
}

#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   
    return  self.dataAry.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell* tableViewCell =[tableView dequeueReusableCellWithIdentifier:self.identifer];
    
    if (tableViewCell==nil) {
        tableViewCell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:self.identifer];
        tableViewCell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    Student *  item = self.dataAry[indexPath.row];
    if (self.block) {
        self.block(tableViewCell, item);
    }
    return  tableViewCell;
}

#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    Student * student = self.dataAry[indexPath.row];
    
    if (self.skipBlock) {
        self.skipBlock(student);
    }
}
@end
