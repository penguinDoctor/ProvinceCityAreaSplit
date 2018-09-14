//
//  LoadCityTool.m
//  SplitDemo
//
//  Created by 智富360 on 2018/9/13.
//  Copyright © 2018年 飞翔. All rights reserved.
//

#import "LoadCityTool.h"

@implementation LoadCityTool

+ (NSArray*)loadCity{
    
    NSString * bundlePath =[[NSBundle mainBundle] pathForResource:@"Address.plist" ofType:nil];
    NSDictionary * cityDict =[NSDictionary dictionaryWithContentsOfFile:bundlePath];
    
    NSMutableArray * provinceArray =[NSMutableArray arrayWithCapacity:0];
    NSMutableArray* cityArray =[NSMutableArray arrayWithCapacity:0];
    NSMutableArray * areaAry =[NSMutableArray arrayWithCapacity:0];
    
    for (NSString * key in cityDict) {
        //获得省
        [provinceArray addObject:key];
        
        NSArray * cityAry = cityDict[key]; //省数组
       
        NSMutableArray * everyProvinceCityAry =[NSMutableArray arrayWithCapacity:0]; //市
        
        for (NSInteger index = 0; index < cityAry.count; ++index) {
            
            NSDictionary * subCityDict = cityAry[index];
        
            [everyProvinceCityAry addObject:subCityDict];
            
            [cityArray addObject:everyProvinceCityAry];
         
            for (NSInteger areaIndex =0; areaIndex < cityArray.count; ++areaIndex) {
                
                NSArray * subAreaArray = cityArray[areaIndex];
                
 
                NSMutableArray * everyAreaArray =[NSMutableArray arrayWithCapacity:0];
                
                for (NSInteger everyAreaIndex=0; everyAreaIndex < subAreaArray.count; everyAreaIndex++) {
 
                    NSDictionary * areaDict = subAreaArray[everyAreaIndex];
                    
                    for (NSString * key in areaDict) {
                        NSArray * thirdSubAreaArray = areaDict[key];
                        [everyAreaArray addObject:thirdSubAreaArray];
                    }
                }
                [areaAry addObject:everyAreaArray];
            }
        }
    }
    
    NSMutableArray * totalAry =[NSMutableArray arrayWithCapacity:0];
    [totalAry addObject:provinceArray];
    [totalAry addObject:cityArray];
    [totalAry addObject:areaAry];
    
    return  totalAry;
}

@end
