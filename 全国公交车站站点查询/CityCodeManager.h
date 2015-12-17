//
//  CityCodeManager.h
//  全国公交车站站点查询
//
//  Created by WangLi on 15/12/17.
//  Copyright © 2015年 王莉. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CityCode.h"
@interface CityCodeManager : NSObject

+(NSString*)cityCode:(NSString *)cityName;

@end
