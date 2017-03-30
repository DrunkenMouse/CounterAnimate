//
//  CountNumView.m
//  计数器
//
//  Created by 王奥东 on 16/12/6.
//  Copyright © 2016年 王奥东. All rights reserved.
//

#import "CountNumView.h"

@implementation CountNumView

-(void)beginLode:(int)length {
    //初始化时先移除子类View
    for (UIView *view in [self subviews]) {
        [view removeFromSuperview];
    }
    
    CGRect rect = self.frame;
    
    for (int i = 0; i < length; i++) {
        //自身平均分成length份，每一份一个背景图
        UIImageView *backImg = [[UIImageView alloc] initWithFrame:CGRectMake(i * rect.size.width / _length, 0, rect.size.width / length, rect.size.height)];
        backImg.image = [UIImage imageNamed:@"1"];
        [self addSubview:backImg];
        //用于显示的imgView
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(i * rect.size.width/length, 0, rect.size.width / _length, rect.size.height)];
        imgView.tag = length - i;
        [self addSubview:imgView];
    }
    self.backgroundColor = [UIColor clearColor];
}

-(void)showText:(int)number {
    
    self.number = number;
    //数字长度最少为1
    int leng = self.length == 0 ? 1:self.length;
    //初始化。默认是NO，初始化后为YES
    if (self.isInit == NO) {
        self.isInit = YES;
        //移除旧的子视图，添加背景图，并添加用于显示的图片
        [self beginLode:leng];
    }
    //用于显示数字的图片
    for (int i = 1; i <= self.length; i++) {
        UIImageView *imageView = (UIImageView *)[self viewWithTag:i];
        imageView.hidden = YES;
    }
    
    for (int i = 1; i <= leng; i++) {
        
        if (i == 1) {//第一位
            int right = number %10;
            UIImageView *image = (UIImageView *)[self viewWithTag:i];
            image.hidden = NO;
            image.image = [self lodeImageForNumber:right];//获取图像
        }else {//第二位往上
            long long int JieCheng = 10;
            //进位 *10
            for (int j = 1; j < i - 1; j++) {
                JieCheng = JieCheng * 10;
            }
            long long int life = number/JieCheng%10;
            UIImageView *imgView = (UIImageView *)[self viewWithTag:i];
            //将数字转换成字符串来获取几位数
            if (i <= [[NSString stringWithFormat:@"%d",number] length]) {
                imgView.hidden = NO;
            }
            imgView.image = [self lodeImageForNumber:life];//获取图像

        }
    }
    
}
#pragma mark - 切割图片
-(UIImage *)lodeImageForNumber:(long long int)number {
    CGRect imageRect = CGRectMake(number * 36, 0, 36, 48);
    UIImage *image = [UIImage imageNamed:@"2"];
    CGImageRef imageRef = CGImageCreateWithImageInRect(image.CGImage, imageRect);
    return [[UIImage alloc] initWithCGImage:imageRef];
}


@end
