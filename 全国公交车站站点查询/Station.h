//
//  Station.h
//  全国公交车站站点查询
//
//  Created by WangLi on 15/12/11.
//  Copyright © 2015年 王莉. All rights reserved.
//
#import <Cocoa/Cocoa.h>

/*站台*/
@interface Station : NSObject

//站台编号
@property NSString * code;
//公交线路序号
@property NSString * stationNum;
//站台名称
@property NSString * name;
//站台坐标
@property NSString * xy;

//构造方法重写
-(instancetype)initWithCode:(NSString*) code
              andStationNum:(NSString*) stationNum
                    andName:(NSString*) name
                      andXY:(NSString*) xy;

//重写输出
-(NSString*)description;
@end








