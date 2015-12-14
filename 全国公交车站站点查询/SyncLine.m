//
//  SyncLine.m
//  全国公交车站站点查询
//
//  Created by WangLi on 15/12/14.
//  Copyright © 2015年 王莉. All rights reserved.
//

#import "SyncLine.h"
//类别：同步使用

@interface SyncLine ()
//下载路线，如果下载不成功，就使用离线路线，如果离线路线也没有就无法查询
-(bool)downLoadLine;
//设定连接的路径
-(bool)setUrlpath;
//解析JSON后写到文件中
-(void)analysisJSON:(NSDictionary*)dic;
@end


@implementation SyncLine

-(instancetype)initWithCity:(NSString*)city andLineNum:(NSString *)line{
    if (self = [super init]) {
        _city = city;
        _line = line;
        _data = [[NSData alloc]init];
    }
    if ([self downLoadLine] == YES) {
        return self;
    }else
        return nil;
}

//下载路线的实现,写入文件中
-(bool)downLoadLine{
    
    if ([self setUrlpath]==NO) {
        return NO;
    }else{
        //解析JSON
        NSURL * url = [[NSURL alloc]initWithString:_urlpath];
        _data = [NSData dataWithContentsOfURL:url];
        if (_data==nil) {
            NSLog(@"资源加载失败");
            return NO;
        }else{
            NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:_data options:NSJSONReadingMutableContainers error:nil];
            if (dic == nil) {
                NSLog(@"资源解析失败");
                return NO;
            }else{
                //解析JSON
                [self analysisJSON:dic];
                return YES;
            }
        }
    }
}
//解析JSON后写到文件中
-(void)analysisJSON:(NSDictionary*)dic{
    //取得路线信息数组
    NSArray * array = [dic objectForKey:@"result"];
    //取得路线信息
    NSDictionary * dicOfLine = array[0];
    
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

//设定连接的路径
-(bool)setUrlpath{
    //从config.plist中读入URL
    NSDictionary *dic =[[NSDictionary alloc]initWithContentsOfFile:@"/Users/wangli/Desktop/全国公交车站站点查询/全国公交车站站点查询/config.plist"];
    
    if (dic==nil) {
        NSLog(@"资源文件打开失败");
        return NO;
    }else{
        NSString * url_first = [dic objectForKey:@"url"];
        //拼装路径
        self.urlpath = [[NSString alloc]initWithFormat:@"%@&city=%@&bus=%@",url_first,_city,_line];
        
        return YES;
    }
}

@end
