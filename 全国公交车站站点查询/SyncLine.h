//
//  SyncLine.h
//  全国公交车站站点查询
//
//  Created by WangLi on 15/12/14.
//  Copyright © 2015年 王莉. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Line.h"
/* 同步线路 */
@interface SyncLine : NSObject

//网络JSON的URL写在配置文件
@property NSString * urlpath;
//要查询的城市
@property NSString * city;
//要查询的路线
@property NSString * line;
//查询的路线信息
@property NSData * data;

-(instancetype)initWithCity:(NSString*)city andLineNum:(NSString *)line;


@end
