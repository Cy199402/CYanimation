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

#pragma mark - setters and getters
- (UIButton *)msgButton {
    if (!_msgButton) {
        _msgButton = [[UIButton alloc] init];
        [_msgButton setBackgroundImage:[self imageWithColor:[UIColor orangeColor]] forState:UIControlStateNormal];
        [_msgButton setBackgroundImage:[self imageWithColor:[UIColor blackColor]] forState:UIControlStateHighlighted];
    }
    return _msgButton;
}

- (UIButton *)onlineButton {
    if (!_onlineButton) {
        _onlineButton = [[UIButton alloc] init];
        [_onlineButton setBackgroundImage:[self imageWithColor:[UIColor orangeColor]] forState:UIControlStateNormal];
        [_onlineButton setBackgroundImage:[self imageWithColor:[UIColor blackColor]] forState:UIControlStateSelected];
    }
    return _onlineButton;
}

- (UIButton *)praiseButton {
    if (!_praiseButton) {
        _praiseButton = [[UIButton alloc] init];
        [_praiseButton setBackgroundImage:[self imageWithColor:[UIColor orangeColor]] forState:UIControlStateNormal];
        [_praiseButton setBackgroundImage:[self imageWithColor:[UIColor orangeColor]] forState:UIControlStateSelected];
    }
    return _praiseButton;
}

@end
