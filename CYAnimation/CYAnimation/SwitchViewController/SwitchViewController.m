//
//  SwitchViewController.m
//  CYAnimation
//
//  Created by ChengYing on 2/4/17.
//  Copyright © 2017 Yuwan Technology. All rights reserved.
//

#import "SwitchViewController.h"
#import "Masonry.h"

@interface SwitchViewController ()

@property (nonatomic, strong) UIButton *msgButton;
@property (nonatomic, strong) UIButton *onlineButton;
@property (nonatomic, strong) UIButton *praiseButton;

@property (nonatomic, strong) UIView *msgView;
@property (nonatomic, strong) UIView *onlineView;
@property (nonatomic, strong) UIView *praiseView;

@end

@implementation SwitchViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor darkGrayColor];
    [self addSubviews];
    [self autoLayout];
    // Do any additional setup after loading the view.
}

#pragma mark - private methods
- (void)addSubviews {
    [self.view addSubview:self.msgButton];
    [self.view addSubview:self.onlineButton];
    [self.view addSubview:self.praiseButton];
    [self.view addSubview:self.msgView];
}

- (void)autoLayout {
    [self.msgButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.onlineButton.mas_left);
        make.centerY.equalTo(self.onlineButton.mas_centerY);
        make.width.equalTo(@60);
        make.height.equalTo(@44);
    }];
    
    [self.onlineButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.top.equalTo(self.view.mas_top).with.offset(20);
        make.width.equalTo(@60);
        make.height.equalTo(@44);
    }];
    
    [self.praiseButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.onlineButton.mas_right);
        make.centerY.equalTo(self.onlineButton.mas_centerY);
        make.width.equalTo(@60);
        make.height.equalTo(@44);
    }];
    
    [self.msgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(self.msgButton.mas_bottom).with.offset(20);
    }];
}

- (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

#pragma mark - action methods
- (void)changeToMsgView {
    NSLog(@"-- changeToMsgView --");
    self.msgButton.selected = YES;
    self.onlineButton.selected = NO;
    self.praiseButton.selected = NO;
    if ([self.onlineView superview]) {
        [self.onlineView removeFromSuperview];
    }
    if ([self.praiseView superview]) {
        [self.praiseView removeFromSuperview];
    }
}

- (void)changeToOnlineView {
    NSLog(@"-- changeToOnlineView --");
    self.msgButton.selected = NO;
    self.onlineButton.selected = YES;
    self.praiseButton.selected = NO;
    if ([self.praiseView superview]) {
        [self.praiseView removeFromSuperview];
    }
    if (![self.onlineView superview]) {
        [self.view addSubview:self.onlineView];
        [self.onlineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.top.equalTo(self.msgView);
        }];
    }
}

- (void)changeToPraiseView {
    NSLog(@"-- changeToPraiseView --");
    self.msgButton.selected = NO;
    self.onlineButton.selected = NO;
    self.praiseButton.selected = YES;
    if ([self.onlineView superview]) {
        [self.onlineView removeFromSuperview];
    }
    if (![self.praiseView superview]) {
        [self.view addSubview:self.praiseView];
        [self.praiseView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.top.equalTo(self.msgView);
        }];
    }
}

#pragma mark - setters and getters
- (UIButton *)msgButton {
    if (!_msgButton) {
        _msgButton = [[UIButton alloc] init];
        [_msgButton setBackgroundImage:[self imageWithColor:[UIColor orangeColor]] forState:UIControlStateNormal];
        [_msgButton setBackgroundImage:[self imageWithColor:[UIColor blackColor]] forState:UIControlStateSelected];
        [_msgButton addTarget:self action:@selector(changeToMsgView) forControlEvents:UIControlEventTouchUpInside];
    }
    return _msgButton;
}

- (UIButton *)onlineButton {
    if (!_onlineButton) {
        _onlineButton = [[UIButton alloc] init];
        [_onlineButton setBackgroundImage:[self imageWithColor:[UIColor orangeColor]] forState:UIControlStateNormal];
        [_onlineButton setBackgroundImage:[self imageWithColor:[UIColor blackColor]] forState:UIControlStateSelected];
        [_onlineButton addTarget:self action:@selector(changeToOnlineView) forControlEvents:UIControlEventTouchUpInside];
    }
    return _onlineButton;
}

- (UIButton *)praiseButton {
    if (!_praiseButton) {
        _praiseButton = [[UIButton alloc] init];
        [_praiseButton setBackgroundImage:[self imageWithColor:[UIColor orangeColor]] forState:UIControlStateNormal];
        [_praiseButton setBackgroundImage:[self imageWithColor:[UIColor blackColor]] forState:UIControlStateSelected];
        [_praiseButton addTarget:self action:@selector(changeToPraiseView) forControlEvents:UIControlEventTouchUpInside];
    }
    return _praiseButton;
}

- (UIView *)msgView {
    if (!_msgView) {
        _msgView = [[UIView alloc] init];
        _msgView.backgroundColor = [UIColor redColor];
    }
    return _msgView;
}

- (UIView *)onlineView {
    if (!_onlineView) {
        _onlineView = [[UIView alloc] init];
        _onlineView.backgroundColor = [UIColor greenColor];
    }
    return _onlineView;
}

- (UIView *)praiseView {
    if (!_praiseView) {
        _praiseView = [[UIView alloc] init];
        _praiseView.backgroundColor = [UIColor blueColor];
    }
    return _praiseView;
}

@end
