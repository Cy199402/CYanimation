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

@property (nonatomic, assign) uint32_t flowerTag;
@property (nonatomic, strong) NSMutableArray <NSNumber *> *tags;
@property (nonatomic, strong) NSMutableArray <NSString *> *timingFunctions;

@end

@implementation FlowerBezierView

#pragma mark - init methods
- (instancetype)init {
    if (self = [super init]) {
        self.backgroundColor = [UIColor redColor];
        self.flowerTag = 0;
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
    self.flowerTag ++;
    UIImageView *animView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"musicRoom_scatter_flower"]];
    animView.tag = self.flowerTag;
    [self.tags addObject:@(self.flowerTag)];
    [self addSubview:animView];
    
    CGPoint viewOrigin = animView.frame.origin;
    viewOrigin.y = viewOrigin.y + animView.frame.size.height / 2.0f;
    viewOrigin.x = viewOrigin.x + animView.frame.size.width / 2.0f;
    
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.fromValue = @(0.7);
    scaleAnimation.toValue = @(1.5);
    scaleAnimation.autoreverses = YES;
    scaleAnimation.duration = 1.5;
    
    CABasicAnimation *alphaAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    alphaAnimation.toValue = @(0);
    alphaAnimation.beginTime = 1.0f;
    
    CAKeyframeAnimation *pathAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    pathAnimation.calculationMode = kCAAnimationLinear;
    
    CGPoint endPoint = CGPointMake(-SCREEN_WIDTH / 2 + animView.image.size.width, -SCREEN_HEIGHT / 2 + animView.image.size.height);

    CGMutablePathRef curvedPath = CGPathCreateMutable();
    CGPathMoveToPoint(curvedPath, NULL, viewOrigin.x, viewOrigin.y);
    
    int width = SCREEN_WIDTH;
    int height = SCREEN_HEIGHT;
    int tempX = arc4random() % width;
    int tempY = arc4random() % height;
    
    CGPoint tempPoint = CGPointMake(-tempX, -tempY);
    
    CGPathAddCurveToPoint(curvedPath, NULL, viewOrigin.x, viewOrigin.y, tempPoint.x, tempPoint.y, endPoint.x, endPoint.y);
    pathAnimation.path = curvedPath;
    CGPathRelease(curvedPath);
    
    int timingIndex = arc4random() % 5;
    
    NSLog(@"self.timingFunctions[timingIndex] -- %@", self.timingFunctions[timingIndex]);
    NSString *timing = self.timingFunctions[timingIndex];
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.timingFunction = [CAMediaTimingFunction functionWithName:timing];
    group.fillMode = kCAFillModeForwards;
    group.removedOnCompletion = NO;
    [group setAnimations:[NSArray arrayWithObjects:alphaAnimation, scaleAnimation, pathAnimation, nil]];
    group.duration = 2.0f;
    group.delegate = self;
    [group setValue:animView forKey:@"imageViewBeingAnimated"];
    [animView.layer addAnimation:group forKey:@"savingAnimation"];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    if (flag) {
        for (UIImageView *image in [self subviews]) {
            if (image.tag != 0 && [self.tags containsObject:@(image.tag)]) {
                [image removeFromSuperview];
                break;
            }
        }
    }
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

- (NSMutableArray <NSNumber *> *)tags {
    if (!_tags) {
        _tags = [[NSMutableArray alloc] init];
    }
    return _tags;
}

- (NSMutableArray <NSString *> *)timingFunctions {
    if (!_timingFunctions) {
        _timingFunctions = [[NSMutableArray alloc] initWithArray:@[kCAMediaTimingFunctionLinear,
                                                                   kCAMediaTimingFunctionEaseIn,
                                                                   kCAMediaTimingFunctionEaseOut,
                                                                   kCAMediaTimingFunctionEaseInEaseOut,
                                                                   kCAMediaTimingFunctionDefault]];
    }
    return _timingFunctions;
}
@end
