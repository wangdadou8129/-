//
//  SyncLine.m
//  全国公交车站站点查询
//
//  Created by WangLi on 15/12/14.
//  Copyright © 2015年 王莉. All rights reserved.
//

#import "SyncLine.h"

@implementation SyncLine
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
        self.urlpath = [[NSString alloc]initWithFormat:@"%@&city=%@&bus=%@",url_first,_code,_line];
        return YES;
    }
}

-(instancetype)initWithCity:(NSString*)city andLineNum:(NSString *)line{
    if (self = [super init]) {
        NSString * code = [CityCodeManager cityCode:city];
        
        if(code !=nil){
            _code = code;
            _line = line;
            _data = [[NSData alloc]init];
        }else {
            NSLog(@"您输入的城市错误");
            return nil;
        }
    }
    
    if ([self downLoadLine] != nil) {
        return self;
    }else
        return nil;
}

//下载路线的实现,写入文件中
-(NSData *)downLoadLine{
    
    if ([self setUrlpath]==NO) {
        return nil;
    }else{
        //解析JSON
        NSURL * url = [[NSURL alloc]initWithString:_urlpath];
        _data = [NSData dataWithContentsOfURL:url];
        if (_data==nil) {
            NSLog(@"网络加载失败");
            return nil;
        }else{
            [self downLoadDic];
            return _data;
        }
    }
}

-(void)downLoadDic{
    
    //写入文件中，以便离线查询使用
    NSString * filePath = [NSString stringWithFormat:@"/Users/wangli/Desktop/全国公交车站站点查询/全国公交车站站点查询/%@_%@",_code,_line];
    NSFileManager * fm = [NSFileManager defaultManager];
    if ([fm fileExistsAtPath:filePath]) {
        [fm removeItemAtPath:filePath error:nil];
    }else{
        [fm createFileAtPath:filePath contents:nil attributes:nil];
    }
    
    [_data writeToFile:filePath atomically:NO];

}


@end
