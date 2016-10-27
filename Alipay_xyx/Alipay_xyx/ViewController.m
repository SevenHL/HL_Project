//
//  ViewController.m
//  Alipay_xyx
//
//  Created by 罗浩林 on 16/10/27.
//  Copyright © 2016年 罗浩林. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //设置根视图的背景颜色 //  25	27	47
    self.view.backgroundColor = [UIColor colorWithRed:25/255.0 green:27/255.0 blue:47/255.0 alpha:1];
    
    //创建一个支付宝图片的button
    [self getButton];
    
}

/**
 *  创建按钮
 */
- (void)getButton{
    
    //创建button对象
    UIButton * button = [UIButton new];
    
    //设置图片
    [button setImage:[UIImage imageNamed:@"alipay_msp_op_success"] forState:UIControlStateNormal];
    
    //设置尺寸自适应
    [button sizeToFit];
    
    //设置位置在中间
    button.center = self.view.center;
    
    //存放到根视图
    [self.view addSubview:button];
    
    
    //创建的圆形子视图
    UIView * vi = [self getView];
    
    //存放到在根视图,并置于button下.
    [self.view insertSubview:vi belowSubview:button];
    
    //给按钮添加触发事件
    [button addTarget:self action:@selector(touchCircle:) forControlEvents:
     UIControlEventTouchUpInside];
    
    
}


/**
 *  创建一个圆形子视图
 *
 *  @return 返回一个子视图对象
 */
- (UIView *)getView{
    
    //创建UIView对象
    UIView * v = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    
    //设置位置
    v.center = self.view.center;
    
    //设置颜色,使用测色计取出对应颜色.//47	167	244
    v.backgroundColor = [UIColor colorWithRed:47/255.0 green:167/255.0 blue:244/255.0 alpha:1];
    
    //倒圆
    v.layer.cornerRadius = 50;
    
    
    //返回对象
    return  v;
    
}

/**
 *  按钮的触发事件
 */
- (void)touchCircle:(UIButton *)sender{
    
    //禁用点击按钮
    //    sender.enabled = NO;
    
    //循环执行
    for (int i = 1; i<10; i++) {
        
        //创建圆形子视图
        UIView * vi = [self getView];
        
        //添加到父容器时,置于最下方
        [self.view insertSubview:vi atIndex:0];
        
        //需要放大的倍数
        CGFloat fl = 8;
        
        //block动画,参数1,动画的时间  参数2,延迟执行的时间  参数4,执行的代码,参数5,完成后的执行的代码
        [UIView animateWithDuration:1.8 delay:i * 0.5 options:0 animations:^{
            
            //放大8倍
            vi.transform = CGAffineTransformMakeScale(fl,fl);
            
            //渲染效果,逐渐透明
            vi.alpha = 0;
            
            //颜色逐渐淡化成父视图背景颜色
            vi.backgroundColor = self.view.backgroundColor;
            
        } completion:^(BOOL finished) {
            
            //执行完删除这个子视图
            [vi removeFromSuperview];
        }];
        
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
