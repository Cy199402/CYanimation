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
@property (nonatomic, strong) UIButton *testButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.testButton];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)changeButtonFrame {
    self.testButton.selected = !self.testButton.selected;
    if (self.testButton.selected) {
        UIImage *image = [UIImage imageNamed:@"room_musicBtn_bg"];
        // 设置端盖的值
        CGFloat top = image.size.height * 0.5;
        CGFloat left = image.size.width * 0.5;
        CGFloat bottom = image.size.height * 0.5;
        CGFloat right = image.size.width * 0.5;
        
        // 设置端盖的值
        UIEdgeInsets edgeInsets = UIEdgeInsetsMake(top, left, bottom, right);
        // 设置拉伸的模式
        UIImageResizingMode mode = UIImageResizingModeStretch;
        
        // 拉伸图片
        UIImage *newImage = [image resizableImageWithCapInsets:edgeInsets resizingMode:mode];
        
        // 设置按钮的背景图片
        [self.testButton setBackgroundImage:newImage forState:UIControlStateNormal];
        
        [UIView animateWithDuration:2.0f animations:^{
            self.testButton.frame = CGRectMake(100, self.testButton.frame.origin.y, 2 * image.size.width, image.size.height);
            [self.testButton layoutIfNeeded];
        }];
        
    } else {
        UIImage *image = [UIImage imageNamed:@"room_musicBtn_bg"];

        [UIView animateWithDuration:2.0f animations:^{
            self.testButton.frame = CGRectMake(100 + image.size.width, self.testButton.frame.origin.y, image.size.width, image.size.height);
        }];
    }

}

#pragma mark - setters and getters

- (MusicInOrderView *)infoView {
    if (!_infoView) {
        _infoView = [[MusicInOrderView alloc] init];
    }
    return _infoView;
}

- (UIButton *)testButton {
    if (!_testButton) {
        _testButton = [UIButton buttonWithType:UIButtonTypeCustom];
        UIImage *image = [UIImage imageNamed:@"room_musicBtn_bg"];
        _testButton.frame = CGRectMake(100 + image.size.width, 300, image.size.width, image.size.height);
        [_testButton setBackgroundImage:image forState:UIControlStateNormal];
        [_testButton addTarget:self action:@selector(changeButtonFrame) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _testButton;
}

@end
