//
//  AnalysisLine.h
//  全国公交车站站点查询
//
//  Created by WangLi on 15/12/17.
//  Copyright © 2015年 王莉. All rights reserved.
//

#import <Foundation/Foundation.h>
//网络解析
#import "SyncLine.h"
//本地解析
#import "LocaleLine.h"

@interface AnalysisLine : NSObject

@property NSData * data;

-(instancetype)initWithCity:(NSString*)city andLineNum:(NSString *)line;

@end
