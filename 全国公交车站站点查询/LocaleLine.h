//
//  LocaleLine.h
//  全国公交车站站点查询
//
//  Created by WangLi on 15/12/17.
//  Copyright © 2015年 王莉. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CityCodeManager.h"
@interface LocaleLine : NSObject
//查询的路线信息
@property NSData * data;

-(instancetype)initWithCity:(NSString*)city andLineNum:(NSString *)line;

@end
