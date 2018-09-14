//
//  PickViewSource.m
//  SplitDemo
//
//  Created by 智富360 on 2018/9/13.
//  Copyright © 2018年 飞翔. All rights reserved.
//

#import "PickViewSource.h"

@interface PickViewSource()

@property(nonatomic,strong)CityPickerView *pickerView;
//总的数组
@property(nonatomic,copy)NSArray *totalAry;
//省
@property(nonatomic,copy)NSArray *provinceAry;
//市
@property(nonatomic,copy)NSArray *cityAry;
//区
@property(nonatomic,copy)NSArray *areaAry;
//记录选中的省的下标
@property(nonatomic,assign) NSInteger selectProvinceIndex;
//记录选中的市的下标
@property(nonatomic,assign) NSInteger selectCityIndex;

@end

@implementation PickViewSource

-(instancetype)initWithItem:(NSArray *)item pickerView:(CityPickerView *)pickerView{
    
    PickViewSource * source =[[PickViewSource alloc]init];
    
    source.totalAry = item;
    source.provinceAry = source.totalAry.firstObject;
    source.cityAry = source.totalAry[1];
    source.areaAry = source.totalAry.lastObject;
    
    source.pickerView = pickerView;
    
    return  source;
}

#pragma mark - UIPickerViewDataSource
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    return  self.totalAry.count;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{

    if (component==0) {
        return  [self.totalAry.firstObject count];
    }else if (component==1){
        
     NSArray * cityAry = [self getAryWithComponent:component selectIndex:self.selectProvinceIndex];
     return [cityAry.firstObject count];
       
    }else{
        NSArray * areaAry = [self getAryWithComponent:1 selectIndex:self.selectProvinceIndex];
        NSDictionary * dict = areaAry.firstObject;
        NSString * stringKey = dict.allKeys[self.selectCityIndex];
    
        return  [dict[stringKey] count];
    }
}

-(UIView*)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    
    if (component==0) {
        NSString * titleString  = self.totalAry.firstObject[row];
        return  [self labelWithAttributeString:titleString];
        
    }else if(component==1){
        
        NSArray * cityAry = [self getAryWithComponent:component selectIndex:self.selectProvinceIndex];
        NSDictionary * dict = cityAry.firstObject;
        NSString * titleString = dict.allKeys[row];
        return  [self labelWithAttributeString:titleString];
        
    }else{
        
        NSArray * areaAry = [self getAryWithComponent:1 selectIndex:self.selectProvinceIndex];
        NSDictionary * dict = areaAry.firstObject;
        NSString * stringKey = dict.allKeys[self.selectCityIndex];
        NSString * titleString = dict[stringKey][row];
        return  [self labelWithAttributeString:titleString];
    }
}

 -(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    if (component==0) {
        
        self.selectProvinceIndex = [pickerView selectedRowInComponent:0];
        self.selectCityIndex = 0;
        [pickerView selectRow:0 inComponent:1 animated:YES];
        [pickerView selectRow:0 inComponent:2 animated:YES];
        [pickerView reloadAllComponents];
        
    }else if (component==1){
        
        self.selectCityIndex =[pickerView selectedRowInComponent:1];
        [pickerView selectRow:0 inComponent:2 animated:YES];
        [pickerView reloadAllComponents];
    }
}

#pragma mark - private method

-(NSArray*)getAryWithComponent:(NSInteger)component selectIndex:(NSInteger)selectIndex{
    
    return  self.totalAry[component][selectIndex];;
}

-(NSMutableAttributedString*)getAttributeStringWithString:(NSString*)titleString{
  
    NSMutableAttributedString * firstAttributeString = [[NSMutableAttributedString alloc]initWithString:titleString];
    [firstAttributeString addAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12.f]} range:NSMakeRange(0, titleString.length)];
    return  firstAttributeString;
}

-(UILabel*)labelWithAttributeString:(NSString*)attributeString{
    
    UILabel * label =[[UILabel alloc]init];
    label.attributedText =[self getAttributeStringWithString: attributeString];
    label.textAlignment = NSTextAlignmentCenter;
    return  label;
}

@end
