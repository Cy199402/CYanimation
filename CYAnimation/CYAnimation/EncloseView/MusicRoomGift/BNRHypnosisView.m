//
//  BNRHypnosisView.m
//  CYAnimation
//
//  Created by ChengYing on 2/17/17.
//  Copyright © 2017 Yuwan Technology. All rights reserved.
//

#import "BNRHypnosisView.h"

@implementation BNRHypnosisView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // 设置 BNRHypnosisView 对象的背景颜色为透明
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
//    CGRect bounds = self.bounds;
//    CGPoint center;
//    center.x = bounds.origin.x + bounds.size.width / 2.0;
//    center.y = bounds.origin.y + bounds.size.height / 2.0;
//    
//    // 阴影效果
//    CGContextRef currentContext = UIGraphicsGetCurrentContext();
//    CGContextSaveGState(currentContext);
//    CGContextSetShadow(currentContext, CGSizeMake(4, 20), 2);
//    // 这里有阴影效果
//    
//    CGContextRestoreGState(currentContext);
//    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;
//    
//    // UIBezierPath 类用来绘制直线或曲线，从而绘制各种形状
//    UIBezierPath *path = [[UIBezierPath alloc] init];
//    
//    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20) {
//        [path moveToPoint:CGPointMake(center.x + currentRadius, center.y)]; //抬起画笔
//        
//        [path addArcWithCenter:center
//                        radius:currentRadius
//                    startAngle:0.0
//                      endAngle:M_PI * 2.0
//                     clockwise:YES];
//    }
//    
//    // 设置线条宽度为 10 点
//    path.lineWidth = 1;
//    
//    // 绘制路径
//    [path stroke];
    
    UIImage *logoImage = [UIImage imageNamed:@"musicRoom_scatter_flower"];
    [logoImage drawInRect:rect];
}

@end
