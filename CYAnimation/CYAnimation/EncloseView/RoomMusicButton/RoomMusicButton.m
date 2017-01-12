//
//  RoomMusicButton.m
//  CYAnimation
//
//  Created by ChengYing on 1/12/17.
//  Copyright © 2017 Yuwan Technology. All rights reserved.
//

#import "RoomMusicButton.h"
#import "Masonry.h"

@interface RoomMusicButton ()

@property (nonatomic, strong) UIImageView *bgView;

@end

@implementation RoomMusicButton

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
    [self addSubview:self.bgView];
}

- (void)autoLayout {
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.equalTo(self);
    }];
}

#pragma mark - setters and getters
- (UIImageView *)bgView {
    if (!_bgView) {
        _bgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"room_musicBtn_bg"]];
    }
    return _bgView;
}

@end
