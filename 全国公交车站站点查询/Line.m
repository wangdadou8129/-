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
-(instancetype)initWithCompany:(NSString*)tn
                  andFrontName:(NSString*)fn
                     andName:(NSString*)na
                    andKeyName:(NSString*)kn
                  andStartTime:(NSString*)st
                    andEndTime:(NSString*)et
                     andLength:(NSString*)len{

    if (self = [super init]) {
        _company = tn;
        _front_name = fn;
        _name = na;
        _key_name = kn;
        _start_time = st;
        _end_time = et;
        _length = len;
        _stations = [[NSMutableArray alloc]init];
    }
    return self;
}
//添加站点
-(void)addStation:(Station *)newStation{
    
    [_stations addObject:newStation];
    //NSLog(@"添加站点成功");
    
}

//根据下标添加站点
-(void)addStation:(Station *)newStation withIndex:(int)index{
    if (index <[_stations count] && index>=0) {
        [_stations insertObject:newStation atIndex:index];
        //NSLog(@"添加站点成功");
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
    Station * modify = [_stations objectAtIndex:index];
    if (modify !=nil) {
        //站台编号
        char code[20];
        //公交线路序号
        char stationNum[20];
        //站台名称
        char name[50];
        //站台坐标
        char xy[50];
        NSLog(@"原始站台编号:%@,请输入新站台编号:",modify.code);
        scanf("%s",code);
        NSLog(@"原始站台序号:%@,请输入新站台序号",modify.stationNum);
        scanf("%s",stationNum);
        NSLog(@"原始站台序号:%@,请输入新站台名称",modify.name);
        scanf("%s",name);
        NSLog(@"原始站台序号:%@,请输入新站台坐标",modify.xy);
        scanf("%s",xy);
        modify.code = [NSString stringWithUTF8String:code];
        modify.stationNum = [NSString stringWithUTF8String:stationNum];
        modify.name = [NSString stringWithUTF8String:name];
        modify.xy = [NSString stringWithUTF8String:xy];
        NSLog(@"站台更新成功");
    }else{
        NSLog(@"位置错误，站台更新失败");
    }
}

//重写显示
-(NSString*)description{
    NSLog(@"%@",[NSString stringWithFormat:@"路线:%@,首班时间:%@,末班时间:%@",_name, _start_time , _end_time]);
    NSLog(@"--------------------------");
    for (Station * temp in _stations) {
        NSLog(@"%@",temp);
    }
    return @"--------------------------";
}

@end
