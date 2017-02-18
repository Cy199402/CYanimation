//
//  YWRoomMusicSendGiftViewController.m
//  CYAnimation
//
//  Created by ChengYing on 2/18/17.
//  Copyright © 2017 Yuwan Technology. All rights reserved.
//

#import "YWRoomMusicSendGiftViewController.h"
#import "YWRoomMusicSendGiftView.h"
#import "Masonry.h"

#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height

@interface YWRoomMusicSendGiftViewController ()

@property (nonatomic, strong) YWRoomMusicSendGiftView *sendGiftView;

@end

@implementation YWRoomMusicSendGiftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.sendGiftView];
    [self.sendGiftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.view);
        make.left.equalTo(self.view.mas_left).with.offset(7);
        make.height.equalTo(@(SCREEN_WIDTH / 3));
    }];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - setters and getters
- (YWRoomMusicSendGiftView *)sendGiftView {
    if (!_sendGiftView) {
        _sendGiftView = [[YWRoomMusicSendGiftView alloc] init];
        _sendGiftView.backgroundColor = [UIColor blueColor];
    }
    return _sendGiftView;
}

@end
