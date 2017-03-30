//
//  ViewController.m
//  计数器
//
//  Created by 王奥东 on 16/12/6.
//  Copyright © 2016年 王奥东. All rights reserved.
//

#import "ViewController.h"
#import "CountNumView.h"


@interface ViewController ()

@end

@implementation ViewController {
    int i;//最大值
    NSTimer *_timer;
    IBOutlet CountNumView *_MenuNumView;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    i = 9999;
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(show) userInfo:nil repeats:YES];
    _MenuNumView.length = 4;
    [_MenuNumView showText:4];
    
}


-(void)show{
    i--;
    [_MenuNumView showText:_MenuNumView.number + 1];
    if (i==0) {
        [_timer invalidate];
    }
}

@end
