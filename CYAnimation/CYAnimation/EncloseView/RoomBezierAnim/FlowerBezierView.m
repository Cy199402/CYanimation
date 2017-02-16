//
//  FlowerBezierView.m
//  CYAnimation
//
//  Created by ChengYing on 2/16/17.
//  Copyright © 2017 Yuwan Technology. All rights reserved.
//

#import "FlowerBezierView.h"
#import "Masonry.h"

#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height

@interface FlowerBezierView () <UIGestureRecognizerDelegate, CAAnimationDelegate>

@end

@implementation FlowerBezierView

#pragma mark - init methods
- (instancetype)init {
    if (self = [super init]) {
        self.backgroundColor = [UIColor redColor];
        [self addSubviews];
        [self autoLayout];
    }
    return self;
}

- (void)addSubviews {
    [self addSubview:self.flowerView];
}

- (void)autoLayout {
    [self.flowerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(self);
    }];
}

#pragma mark - action methods
- (void)clickFlowerView {
    NSLog(@"-- clickFlowerView --");
    UIImageView *animView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"musicRoom_scatter_flower"]];
    [self addSubview:animView];
    
    CGPoint viewOrigin = animView.frame.origin;
    viewOrigin.y = viewOrigin.y + animView.frame.size.height / 2.0f;
    viewOrigin.x = viewOrigin.x + animView.frame.size.width / 2.0f;
    
    CAKeyframeAnimation *pathAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    pathAnimation.calculationMode = kCAAnimationLinear;
    pathAnimation.fillMode = kCAFillModeForwards;
    pathAnimation.removedOnCompletion = NO;
    
    CGPoint endPoint = CGPointMake(-SCREEN_WIDTH / 2 + animView.image.size.width, -SCREEN_HEIGHT / 2 + animView.image.size.height);

    CGMutablePathRef curvedPath = CGPathCreateMutable();
    CGPathMoveToPoint(curvedPath, NULL, viewOrigin.x, viewOrigin.y);
    
    int width = SCREEN_WIDTH;
    int height = SCREEN_HEIGHT;
    int tempX = arc4random() % width;
    int tempY = arc4random() % height;
    
    NSLog(@"tempX -- %d", tempX);
    NSLog(@"tempY -- %d", tempY);
    NSLog(@"width -- %u", width);
    NSLog(@"height -- %u", height);
    
    CGPoint tempPoint = CGPointMake(-tempX, -tempY);
    
    CGPathAddCurveToPoint(curvedPath, NULL, tempPoint.x, viewOrigin.y, tempPoint.x, viewOrigin.y, tempPoint.x, tempPoint.y);
    CGPathAddCurveToPoint(curvedPath, NULL, endPoint.x, tempPoint.y, endPoint.x, tempPoint.y, endPoint.x, endPoint.y);
    pathAnimation.path = curvedPath;
    CGPathRelease(curvedPath);
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.fillMode = kCAFillModeForwards;
    group.removedOnCompletion = NO;
    [group setAnimations:[NSArray arrayWithObjects:pathAnimation, nil]];
    group.duration = 4.0f;
    group.delegate = self;
    [group setValue:animView forKey:@"imageViewBeingAnimated"];
    [animView.layer addAnimation:group forKey:@"savingAnimation"];
}

#pragma mark - setters and getters
- (UIImageView *)flowerView {
    if (!_flowerView) {
        _flowerView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"musicRoom_scatter_flower"]];
        _flowerView.backgroundColor = [UIColor blueColor];
        _flowerView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickFlowerView)];
        tapGesture.delegate = self;
        [_flowerView addGestureRecognizer:tapGesture];
    }
    return _flowerView;
}
@end
