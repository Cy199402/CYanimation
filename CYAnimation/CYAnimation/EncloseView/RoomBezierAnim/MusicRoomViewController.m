//
//  MusicRoomViewController.m
//  CYAnimation
//
//  Created by ChengYing on 2/14/17.
//  Copyright © 2017 Yuwan Technology. All rights reserved.
//

#import "MusicRoomViewController.h"
#import "FlowerBezierView.h"
#import "Masonry.h"

@interface MusicRoomViewController ()

@property (nonatomic, strong) FlowerBezierView *bezierView;

@end

@implementation MusicRoomViewController

#pragma mark - life cycle
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.bezierView];
    [self.bezierView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.equalTo(self.view);
        make.width.equalTo(@(2 * self.bezierView.flowerView.image.size.width));
        make.height.equalTo(@(2 * self.bezierView.flowerView.image.size.height));
    }];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - setters and getters
- (FlowerBezierView *)bezierView {
    if (!_bezierView) {
        _bezierView = [[FlowerBezierView alloc] init];
    }
    return _bezierView;
}

@end
