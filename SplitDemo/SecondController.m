//
//  SecondController.m
//  SplitDemo
//
//  Created by 智富360 on 2018/9/12.
//  Copyright © 2018年 飞翔. All rights reserved.
//

#import "SecondController.h"
#import "CityPickerView.h"

@interface SecondController ()

@property(nonatomic,strong)CityPickerView *cityPickerView;

@end

@implementation SecondController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor =[UIColor whiteColor];
    self.navigationItem.title = @"测试城市关联选择";
    [self.view addSubview:self.cityPickerView];
}

#pragma mark - getter

-(CityPickerView *)cityPickerView{
    
    if (_cityPickerView==nil) {
        
        _cityPickerView =[[CityPickerView alloc]initWithFrame:CGRectMake(0, self.view.bounds.size.height-200, self.view.bounds.size.width,200)];
        
    }
    return  _cityPickerView;
}

@end
