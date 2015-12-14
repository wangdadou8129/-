//
//  Station.m
//  全国公交车站站点查询
//
//  Created by WangLi on 15/12/11.
//  Copyright © 2015年 王莉. All rights reserved.
//

#import "Station.h"

@implementation Station
-(instancetype)initWithCode:(NSString*) code
              andStationNum:(NSString*) stationNum
                    andName:(NSString*) name
                      andXY:(NSString*) xy{
    if (self = [super init]) {
        _code = code;
        _stationNum = stationNum;
        _name = name;
        _xy = xy;
    }
    return self;
}
//打印输出站台信息
-(NSString*)description{
    return [NSString stringWithFormat:@"%@:%@",_stationNum,_name];
}

@end
