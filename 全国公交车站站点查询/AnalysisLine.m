//
//  AnalysisLine.m
//  全国公交车站站点查询
//
//  Created by WangLi on 15/12/17.
//  Copyright © 2015年 王莉. All rights reserved.
//

#import "AnalysisLine.h"

@implementation AnalysisLine

-(instancetype)initWithCity:(NSString*)city andLineNum:(NSString *)line
{
    if (self == [super init]) {
        //先从网络下载
        SyncLine * sl = [[SyncLine alloc]initWithCity:city andLineNum:line];
        if (sl!=nil) {
            _data = sl.data;
            [self analysisJSON];
        }else{
            NSLog(@"现在进行本地线路分析");
            LocaleLine * ll = [[LocaleLine alloc]initWithCity:city andLineNum:line];
            if (ll!=nil) {
                _data = ll.data;
                [self analysisJSON];
            }else{
                return nil;
            }
        }
    }
    return self;
}


//解析JSON
-(void)analysisJSON{
    NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:_data options:NSJSONReadingMutableContainers error:nil];
    //取得路线信息数组
    NSArray * array = [dic objectForKey:@"result"];
    if(array == nil){
        NSLog(@"解析失败，可能是线路问题");
        return;
    }
    //取得路线信息
    NSDictionary * dicOfLine = array[0];
    if(dicOfLine == nil){
        NSLog(@"解析失败，可能是线路问题");
        return;
    }
        
    Line * line = [[Line alloc]initWithCompany:
                   [dicOfLine objectForKey:@"company"]
                    andFrontName:[dicOfLine objectForKey:@"front_name"]
                    andName:[dicOfLine objectForKey:@"name"]
                    andKeyName:[dicOfLine objectForKey:@"key_name"]
                    andStartTime:[dicOfLine objectForKey:@"start_time"]
                    andEndTime:[dicOfLine objectForKey:@"end_time"]
                    andLength:[dicOfLine objectForKey:@"length"]];
    
    //获取站台数组
    NSArray * stations = [dicOfLine objectForKey:@"stationdes"];
    for (int i=0; i< [stations count]; i++) {
        NSDictionary * eachStationDic = stations[i];
        Station * eachStation = [[Station alloc]initWithCode:[eachStationDic objectForKey:@"code"] andStationNum:[eachStationDic objectForKey:@"stationNum"] andName:[eachStationDic objectForKey:@"name"] andXY:[eachStationDic objectForKey:@"xy"]];
        //把每个站点都添加到线路中
        [line addStation:eachStation];
    }
    
    NSLog(@"%@",line);
    
}


@end
