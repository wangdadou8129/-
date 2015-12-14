//
//  InitCityCodePlist.m
//  全国公交车站站点查询
//
//  Created by WangLi on 15/12/14.
//  Copyright © 2015年 王莉. All rights reserved.
//

#import "InitCityCodePlist.h"
#define FILE_RTF @"/Users/wangli/Desktop/全国公交车站站点查询/全国公交车站站点查询/cityCode.txt"
#define FILE_PLIST @"/Users/wangli/Desktop/全国公交车站站点查询/全国公交车站站点查询/cityCode.plist"

@implementation InitCityCodePlist

-(instancetype)init{
    if (self = [super init]) {
       //把文件内容写入cityCode.plist文件中
        NSString * str = [[NSString alloc]initWithContentsOfFile:FILE_RTF encoding:NSUTF8StringEncoding error:nil];
        
        NSArray * citys = [str componentsSeparatedByString:@"\n"];
        
        NSMutableDictionary * dic = [[NSMutableDictionary alloc]init];
        
        for (int i=0; i< [citys count]; i+=2) {
            CityCode * temp = [[CityCode alloc]initWithName:citys[i] andCode:citys[i+1]];
            //往plist中写入
            [dic setObject:temp.city_name forKey:temp.city_code];
        }
        [dic writeToFile:FILE_PLIST atomically:NO];
    }
    return self;
}
@end




