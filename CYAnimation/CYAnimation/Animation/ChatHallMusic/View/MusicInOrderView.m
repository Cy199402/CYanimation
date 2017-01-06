//
//  MusicInOrderView.m
//  CYAnimation
//
//  Created by ChengYing on 1/5/17.
//

#import "MusicInOrderView.h"
#import "Masonry.h"

@interface MusicInOrderView ()

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) CAAnimationGroup *textAnimGroup;
@property (nonatomic, strong) CAAnimationGroup *imgAnimGroup;
@property (nonatomic, strong) UIView *albumView;
@property (nonatomic, strong) UILabel *textLabel;
@property (nonatomic, assign) uint32_t clickNum;

@end

@implementation MusicInOrderView
#pragma mark - init methods
- (instancetype)init {
    self = [super init];
    if (self) {
        self.clickNum = 0;
        [self addSubviews];
        [self autoLayout];
    }
    return self;
}

#pragma mark - private methods
- (void)addSubviews {
    [self addSubview:self.bgView];
    [self addSubview:self.albumView];
}

- (void)autoLayout {
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.equalTo(self);
    }];
    
    [self.albumView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.mas_bottom).with.offset(-10);
        make.left.equalTo(self.mas_left).with.offset(5);
        make.right.equalTo(self.mas_right).with.offset(-5);
        make.height.equalTo(@60);
    }];
}

#pragma mark - action methods
- (void)playAnimEffect {
    self.clickNum ++;
    if (self.clickNum % 5 == 0) {
        UILabel *textLabel = [[UILabel alloc] init];
        textLabel.text = @"没抢到";
        textLabel.layer.cornerRadius = 10.0f;
        textLabel.layer.borderColor = [UIColor purpleColor].CGColor;
        textLabel.layer.borderWidth = 2.0f;
        textLabel.layer.backgroundColor = [UIColor whiteColor].CGColor;
        textLabel.textAlignment = NSTextAlignmentCenter;
        [textLabel sizeToFit];
        [self addSubview:textLabel];
        
        textLabel.alpha = 1.0f;
        textLabel.frame = CGRectMake(5, 120, 90, 20);
        [UIView animateWithDuration:3.0f animations:^{
            textLabel.frame = CGRectMake(5, 0, 90, 20);
            textLabel.alpha = 0.0f;
        } completion:^(BOOL finished){
            if (finished) {
                [textLabel removeFromSuperview];
            }
        }];
    } else {
        uint16_t randomX = arc4random() % 50;
        UILabel *noteLabel = [[UILabel alloc] initWithFrame:CGRectMake(5 + randomX, 120, 90, 20)];
        noteLabel.text = @"hello";
        [self addSubview:noteLabel];
        [UIView animateWithDuration:3.0f animations:^{
            noteLabel.frame = CGRectMake(5 + randomX, 0, 90, 20);
            noteLabel.alpha = 0.0f;
        } completion:^(BOOL finished){
            if (finished) {
                [noteLabel removeFromSuperview];
            }
        }];
    }

}

#pragma mark - setters and getters
- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [[UIView alloc] init];
        _bgView.backgroundColor = [UIColor grayColor];
    }
    return _bgView;
}

- (CAAnimationGroup *)imgAnimGroup {
    if (!_imgAnimGroup) {
        CABasicAnimation *transformAnim = [CABasicAnimation animationWithKeyPath:@"position"];
        transformAnim.fillMode = kCAFillModeForwards;
        transformAnim.removedOnCompletion = YES;
        transformAnim.fromValue = [NSValue valueWithCGPoint:CGPointMake(self.albumView.frame.origin.x + self.albumView.frame.size.width / 2, self.albumView.frame.origin.y + self.albumView.frame.size.height)];
        transformAnim.fromValue = [NSValue valueWithCGPoint:CGPointMake(self.albumView.frame.origin.x + self.albumView.frame.size.width / 2, self.albumView.frame.origin.y + self.albumView.frame.size.height + 200)];
        
        CABasicAnimation *opacityAnim = [CABasicAnimation animationWithKeyPath:@"opacity"];
        opacityAnim.fromValue = @(1.0f);
        opacityAnim.toValue = @(0.0f);
        
        _imgAnimGroup = [CAAnimationGroup animation];
        _imgAnimGroup.duration = 3.0f;
        _imgAnimGroup.repeatCount = 1;
        _imgAnimGroup.animations = [NSArray arrayWithObjects:transformAnim, opacityAnim, nil];
    }
    return _imgAnimGroup;
}

- (UIView *)albumView {
    if (!_albumView) {
        _albumView = [[UIView alloc] init];
        _albumView.backgroundColor = [UIColor blueColor];
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(playAnimEffect)];
        [_albumView addGestureRecognizer:singleTap];
    }
    return _albumView;
}

@end
