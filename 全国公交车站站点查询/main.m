//
//  main.m
//  全国公交车站站点查询
//
//  Created by WangLi on 15/12/11.
//  Copyright © 2015年 王莉. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AnalysisLine.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        char city[100];
        char line[100];
        NSLog(@"欢迎使用全国公交车站站点查询系统");
        NSLog(@"请输入要查询的城市:(如:大连市)");
        scanf("%s",city);
        NSLog(@"请输入要查询的路线:(如:708)");
        scanf("%s",line);
        AnalysisLine * al = [[AnalysisLine alloc]initWithCity:[NSString stringWithUTF8String:city] andLineNum:[NSString stringWithUTF8String:line]];
    }
    return 0;
}






