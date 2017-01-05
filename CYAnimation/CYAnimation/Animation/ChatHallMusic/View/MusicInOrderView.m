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

@end

@implementation MusicInOrderView
#pragma mark - init methods
- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

#pragma mark - setters and getters
- (UIView *)detailView {
    if (!_detailView) {
        _detailView = [[UIView alloc] init];
    }
    return _detailView;
}

@end
