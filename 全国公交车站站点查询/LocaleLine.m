//
//  LocaleLine.m
//  全国公交车站站点查询
//
//  Created by WangLi on 15/12/17.
//  Copyright © 2015年 王莉. All rights reserved.
//

#import "LocaleLine.h"

@implementation LocaleLine

-(instancetype)initWithCity:(NSString*)city andLineNum:(NSString *)line{
    if (self = [super init]) {
        
        NSString * code = [CityCodeManager cityCode:city];
        
        if (code !=nil ) {
            //从文件中读取出来
            NSString * filePath = [NSString stringWithFormat:@"/Users/wangli/Desktop/全国公交车站站点查询/全国公交车站站点查询/%@_%@",code,line];
            
            if (filePath != nil) {
                
                _data = [[NSData alloc]initWithContentsOfFile:filePath];

            }else{
                NSLog(@"城市公交路线尚未下载，请联网再试");
                return nil;
            }
        }else{
            NSLog(@"您输入的城市错误");
            return nil;
        }
    }
    return self;
}

@end
