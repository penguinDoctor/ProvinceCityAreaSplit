//
//  ViewController.m
//  SplitDemo
//
//  Created by 智富360 on 2018/9/12.
//  Copyright © 2018年 飞翔. All rights reserved.
//

#import "ViewController.h"
#import "ArrayDataSource.h"
#import "DataModel.h"
#import "Student.h"
#import "SecondController.h"

@interface ViewController ()

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)ArrayDataSource *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    [self.view addSubview:self.tableView];
}

#pragma mark - getter

-(UITableView *)tableView{
    
    if (_tableView==nil) {
        _tableView =[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.dataSource =self.dataSource;
        _tableView.delegate = self.dataSource;
    }
    return  _tableView;
}

-(ArrayDataSource *)dataSource{
    
    if (_dataSource==nil) {
        
        _dataSource =[[ArrayDataSource alloc]initWithItems:[DataModel studentArray] identifer:@"cellID" cellBlock:^(UITableViewCell *cell, Student* item) {
            
            cell.textLabel.text = item.name;
            
        }skip:^(id item) {
            
            SecondController * secondVC =[[SecondController alloc]init];
            [self.navigationController pushViewController:secondVC animated:YES];
        }];
    }
    
    return  _dataSource;
}

@end
