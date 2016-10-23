//
//  DownloaderOperation.m
//  HLWebImage
//
//  Created by 罗浩林 on 16/10/23.
//  Copyright © 2016年 罗浩林. All rights reserved.
//


#import "DownloaderOperation.h"

@implementation DownloaderOperation



/**
 操作开始会调用,然后会更新操作的状态. 确保操作能够正常执行,检测到操作被取消或结束,就不会去调用main方法.
 */
//-(void)start{
//    
//    
//}

/**
 队列调度了操作执行,会自动执行main方法.默认在子线程执行.
 重写操作的入口方法.
 */
-(void)main{
    
    NSLog(@"%@",[NSThread currentThread]);
    
    //图片下载
    NSURL * url  = [NSURL URLWithString:self.urlStr];
    
    NSData * data = [NSData dataWithContentsOfURL:url];
    
    UIImage * image = [UIImage imageWithData:data];
    
}

@end
