//
//  CityCode.m
//  全国公交车站站点查询
//
//  Created by WangLi on 15/12/14.
//  Copyright © 2015年 王莉. All rights reserved.
//

#import "CityCode.h"

@implementation CityCode
-(instancetype)initWithName:(NSString*)cn andCode:(NSString*)cc{
    if (self = [super init]) {
        _city_code = cc;
        _city_name = cn;
    }
    return self;
}

-(NSString*)description{
    return [NSString stringWithFormat:@"城市:%@,区号:%@",_city_name,_city_code];
}
@end
