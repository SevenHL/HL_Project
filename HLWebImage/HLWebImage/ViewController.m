//
//  ViewController.m
//  HLWebImage
//
//  Created by 罗浩林 on 16/10/23.
//  Copyright © 2016年 罗浩林. All rights reserved.
//

#import "ViewController.h"
#import "DownloaderOperation.h"

@interface ViewController ()

//队列
@property (nonatomic,strong) NSOperationQueue *queue;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //创建队列
    self.queue = [[NSOperationQueue alloc]init];
    
    //创建操作
    DownloaderOperation * op = [[DownloaderOperation alloc]init];
    
    op.urlStr = @"http://img3.duitang.com/uploads/item/201509/13/20150913020517_rXtfu.jpeg";
    
    //将操作放到队列中
    [self.queue addOperation:op];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
