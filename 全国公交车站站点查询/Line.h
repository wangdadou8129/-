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

//终点站名称
@property NSString * terminal_name;
//起点站拼音名
@property NSString * front_spell;
//线路编号
@property NSString * line_id;
//线路名称
@property NSString * key_name;
//用文字来描述无特定发车规则
@property NSString * time_desc;
//首发站名称
@property NSString * front_name;
//站台列表
@property NSMutableArray * stations;

//重写构造方法
-(instancetype)initWithTerminalName:(NSString*)tn
                      andFrontSpell:(NSString*)fs
                          andLineId:(NSString*)li
                         andKeyName:(NSString*)kn
                        andTimeDesc:(NSString*)td
                       andFrontName:(NSString*)fn;
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


















