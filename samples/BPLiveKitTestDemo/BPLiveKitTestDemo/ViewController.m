//
//  ViewController.m
//  BPLiveKitTestDemo
//
//  Created by yizhong zhuang on 2017/2/10.
//  Copyright © 2017年 yizhong zhuang. All rights reserved.
//

#import "ViewController.h"
#import "LFLivePreview.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:[[LFLivePreview alloc] initWithFrame:self.view.bounds]];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return NO;
}

@end
