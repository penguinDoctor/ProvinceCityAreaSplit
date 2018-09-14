//
//  PickViewSource.h
//  SplitDemo
//
//  Created by 智富360 on 2018/9/13.
//  Copyright © 2018年 飞翔. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CityPickerView.h"
@interface PickViewSource : NSObject<UIPickerViewDataSource,UIPickerViewDelegate>

-(instancetype)initWithItem:(NSArray*)item pickerView:(CityPickerView*)pickerView;

@end
