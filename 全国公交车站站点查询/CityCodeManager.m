//
//  CityCodeManager.m
//  全国公交车站站点查询
//
//  Created by WangLi on 15/12/17.
//  Copyright © 2015年 王莉. All rights reserved.
//

#import "CityCodeManager.h"
#define FILE_PLIST @"/Users/wangli/Desktop/全国公交车站站点查询/全国公交车站站点查询/cityCode.plist"
static NSMutableArray * cityCodes;

@interface CityCodeManager ()
+(void)initCityCodes;
@end

@implementation CityCodeManager

+(void)initCityCodes{
    
    cityCodes = [NSMutableArray array];
    //获得文件内容
    NSMutableDictionary * dic = [[NSMutableDictionary alloc]initWithContentsOfFile:FILE_PLIST];

    NSArray * keys = [dic allKeys];
    
    for (int i = 0; i< keys.count ; i++) {
        NSString * key = keys[i];
        NSString * value = [dic objectForKey:key];
        CityCode * temp = [[CityCode alloc]initWithName:value andCode:key];
        
        [cityCodes addObject:temp];
    }

}

+(NSString*)cityCode:(NSString *)cityName{
    //初始化数组
    [CityCodeManager initCityCodes];
    
    for (CityCode * temp in cityCodes) {
        if ([temp.city_name isEqualToString:cityName]) {
            return temp.city_code;
        }
    }
    return nil;
}

@end
