//
//  ViewController.m
//  CYAnimation
//
//  Created by ChengYing on 1/5/17.
//

#import "ViewController.h"
#import "Masonry.h"
#import "MusicInOrderView.h"

@interface ViewController ()

@property (nonatomic, strong) MusicInOrderView *infoView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.infoView];
    [self.infoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.centerY.equalTo(self.view.mas_centerY);
        make.width.equalTo(@100);
        make.height.equalTo(@200);
    }];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - setters and getters 

- (MusicInOrderView *)infoView {
    if (!_infoView) {
        _infoView = [[MusicInOrderView alloc] init];
    }
    return _infoView;
}

@end
