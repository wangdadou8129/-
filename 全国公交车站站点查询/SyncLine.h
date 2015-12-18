//
//  SyncLine.h
//  全国公交车站站点查询
//
//  Created by WangLi on 15/12/14.
//  Copyright © 2015年 王莉. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Line.h"
#import "CityCodeManager.h"

/* 同步线路 */
@interface SyncLine : NSObject

//网络JSON的URL写在配置文件
@property NSString * urlpath;
//要查询的城市的编码
@property NSString * code;
//要查询的路线
@property NSString * line;
//查询的路线信息
@property NSData * data;

-(instancetype)initWithCity:(NSString*)city andLineNum:(NSString *)line;

//下载路线，如果下载不成功，就使用离线路线，如果离线路线也没有就无法查询
-(NSData*)downLoadLine;
//设定连接的路径
-(bool)setUrlpath;
//下载字典到文件
-(void)downLoadDic;

@end
