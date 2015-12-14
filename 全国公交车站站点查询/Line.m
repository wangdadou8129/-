//
//  Line.m
//  全国公交车站站点查询
//
//  Created by WangLi on 15/12/11.
//  Copyright © 2015年 王莉. All rights reserved.
//

#import "Line.h"

@implementation Line
//重写构造方法
-(instancetype)initWithTerminalName:(NSString*)tn
                      andFrontSpell:(NSString*)fs
                          andLineId:(NSString*)li
                         andKeyName:(NSString*)kn
                        andTimeDesc:(NSString*)td
                       andFrontName:(NSString*)fn{
    if (self = [super init]) {
        _terminal_name = tn;
        _front_spell = fs;
        _line_id = li;
        _key_name = kn;
        _time_desc = td;
        _front_name = fn;
        _stations = [[NSMutableArray alloc]init];
    }
    return self;
}
//添加站点
-(void)addStation:(Station *)newStation{
    
    [_stations addObject:newStation];
    NSLog(@"添加站点成功");
    
}

//根据下标添加站点
-(void)addStation:(Station *)newStation withIndex:(int)index{
    if (index <[_stations count] && index>=0) {
        [_stations insertObject:newStation atIndex:index];
        NSLog(@"添加站点成功");
    }else{
        NSLog(@"位置错误，添加站点失败");
    }
}

//移除站点
-(void)removeStationAtIndex:(int)index{
    Station * remove = [_stations objectAtIndex:index];
    if (remove !=nil) {
        [_stations removeObject:remove];
        NSLog(@"移除站点成功");
    }else{
        NSLog(@"位置错误，移除站点失败");
    }
}

//修改站点
-(void)modifyStationAtIndex:(int)index{
    
}

//重写显示
-(NSString*)description{
    return [NSString stringWithFormat:@""];
}


@end
