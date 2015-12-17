//
//  main.m
//  全国公交车站站点查询
//
//  Created by WangLi on 15/12/11.
//  Copyright © 2015年 王莉. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SyncLine.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        SyncLine * sl = [[SyncLine alloc]initWithCity:@"大连市" andLineNum:@"708"];
    }
    return 0;
}
