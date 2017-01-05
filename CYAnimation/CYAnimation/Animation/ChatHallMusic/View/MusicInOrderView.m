//
//  MusicInOrderView.m
//  CYAnimation
//
//  Created by ChengYing on 1/5/17.
//  Copyright © 2017 Yuwan Technology. All rights reserved.
//

#import "MusicInOrderView.h"

@interface MusicInOrderView ()

@property (nonatomic, strong) UIView *detailView;
@property (nonatomic, strong) UIView *bgView;

@end

@implementation MusicInOrderView
#pragma mark - init methods
- (instancetype)init {
    self = [super init];
    if (self) {
        [self addSubviews];
        [self autoLayout];
    }
    return self;
}

#pragma mark - private methods
- (void)addSubviews {
    
}

- (void)autoLayout {

}

#pragma mark - setters and getters
- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [[UIView alloc] init];
        _bgView.backgroundColor = [UIColor grayColor];
    }
    return _bgView;
}

- (UIView *)detailView {
    if (!_detailView) {
        _detailView = [[UIView alloc] init];
    }
    return _detailView;
}

@end
