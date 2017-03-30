//
//  CountNumView.h
//  计数器
//
//  Created by 王奥东 on 16/12/6.
//  Copyright © 2016年 王奥东. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CountNumView : UIView

@property(nonatomic, assign)int length;
@property(nonatomic, assign)BOOL isInit;
@property(nonatomic, assign)int number;

-(void)showText:(int)number;

@end
