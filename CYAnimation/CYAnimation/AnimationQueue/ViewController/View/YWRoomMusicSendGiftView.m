//
//  YWRoomMusicSendGiftView.m
//  CYAnimation
//
//  Created by ChengYing on 2/18/17.
//  Copyright © 2017 Yuwan Technology. All rights reserved.
//

#import "YWRoomMusicSendGiftView.h"
#import "Masonry.h"

@interface YWRoomMusicSendGiftView ()

@property (nonatomic, strong) UIView *avatarView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *detailLabel;
@property (nonatomic, strong) UIImageView *giftView;

@end

@implementation YWRoomMusicSendGiftView

#pragma mark - init methods
- (instancetype)init {
    if (self = [super init]) {
        NSLog(@"self.giftview.frame.size.width -- %f", self.giftView.frame.size.width);
        NSLog(@"self.giftview.frame.size.height -- %f", self.giftView.frame.size.height);
        [self addSubviews];
        [self autoLayout];
    }
    return self;
}

#pragma mark - private methods
- (void)addSubviews {
    [self addSubview:self.avatarView];
    [self addSubview:self.nameLabel];
    [self addSubview:self.detailLabel];
    [self addSubview:self.giftView];
}

- (void)autoLayout {
    [self.avatarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self.mas_left).with.offset(2);
        make.height.with.equalTo(@50);
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.avatarView.mas_left).with.offset(5);
        make.centerY.equalTo(self.mas_centerY).with.offset(-7.5);
        make.height.equalTo(@15);
    }];
    
    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLabel.mas_left);
        make.centerY.equalTo(self.mas_centerY).with.offset(7.5);
        make.height.equalTo(@15);
    }];
    
//    [self.giftView mas_makeConstraints:^(MASConstraintMaker *make) {
//        <#code#>
//    }]
}

#pragma mark - setters and getters
- (UIView *)avatarView {
    if (!_avatarView) {
        _avatarView = [[UIView alloc] init];
        _avatarView.backgroundColor = [UIColor redColor];
        _avatarView.layer.masksToBounds = YES;
        _avatarView.layer.cornerRadius = 25.0f;
    }
    return _avatarView;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.backgroundColor = [UIColor greenColor];
    }
    return _nameLabel;
}

- (UILabel *)detailLabel {
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc] init];
        _detailLabel.backgroundColor = [UIColor blueColor];
    }
    return _detailLabel;
}

- (UIImageView *)giftView {
    if (!_giftView) {
        _giftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"musicRoom_scatter_flower"]];
    }
    return _giftView;
}

@end
