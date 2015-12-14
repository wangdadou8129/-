//
//  Line.h
//  全国公交车站站点查询
//
//  Created by WangLi on 15/12/11.
//  Copyright © 2015年 王莉. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Station.h"
//路线
@interface Line : NSObject

//公司名
@property NSString * company;
//起点站名字
@property NSString * front_name;
//线路名字
@property NSString * name;
//线路名称
@property NSString * key_name;
//早班车时间
@property NSString * start_time;
//晚班车时间
@property NSString * end_time;
//线路总长度
@property NSString * length;
//站台列表
@property NSMutableArray * stations;

//重写构造方法
-(instancetype)initWithCompany:(NSString*)tn
                      andFrontName:(NSString*)fn
                       andName:(NSString*)na
                         andKeyName:(NSString*)kn
                        andStartTime:(NSString*)st
                       andEndTime:(NSString*)et
                     andLength:(NSString*)len;
//添加站点
-(void)addStation:(Station *)newStation;

//根据下标添加站点
-(void)addStation:(Station *)newStation withIndex:(int)index;

//移除站点
-(void)removeStationAtIndex:(int)index;

//修改站点
-(void)modifyStationAtIndex:(int)index;

//重写显示
-(NSString*)description;

@end


















