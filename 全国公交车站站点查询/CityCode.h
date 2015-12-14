//
//  CityCode.h
//  全国公交车站站点查询
//
//  Created by WangLi on 15/12/14.
//  Copyright © 2015年 王莉. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CityCode : NSObject

@property NSString * city_name;
@property NSString * city_code;

-(instancetype)initWithName:(NSString*)cn andCode:(NSString*)cc;
@end
