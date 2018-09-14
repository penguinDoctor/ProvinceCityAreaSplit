//
//  CityPickerView.m
//  SplitDemo
//
//  Created by 智富360 on 2018/9/13.
//  Copyright © 2018年 飞翔. All rights reserved.
//

#import "CityPickerView.h"
#import "LoadCityTool.h"
#import "PickViewSource.h"
@interface CityPickerView()
@property(nonatomic,strong)PickViewSource *source;
@end
@implementation CityPickerView

-(instancetype)initWithFrame:(CGRect)frame{
    
    self =[super initWithFrame:frame];
    
    if (self) {
        
        self.source =[[PickViewSource alloc]initWithItem:[LoadCityTool loadCity] pickerView:self];
        self.dataSource = self.source;
        self.delegate = self.source;
    }
    
    return self;
}

@end
