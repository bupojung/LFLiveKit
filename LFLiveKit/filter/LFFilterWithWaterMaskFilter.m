//
//  LFBeautyWithWaterMaskFilter.m
//  LFLiveKit
//
//  Created by yizhong zhuang on 2017/2/10.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "LFFilterWithWaterMaskFilter.h"

@interface LFFilterWithWaterMaskFilter ()
@property (nonatomic, strong) GPUImageAlphaBlendFilter *blendFilter;
@property (nonatomic, strong) GPUImageUIElement *uiElementInput;
@property (nonatomic, strong) UIView *waterMarkContentView;
@end

@implementation LFFilterWithWaterMaskFilter
- (instancetype)initWithWaterMaskView:(UIView *)waterMaskView filter:(GPUImageFilter *)filter {
    self = [super init];
    if (self) {
        self.warterMarkView = waterMaskView;
        self.filter = filter;
        self.videoSize = CGSizeZero;
    }
    return self;
}

- (instancetype)init {
    return [self initWithWaterMaskView:nil filter:nil];
}


- (void)reloadFilterChain {
    [self.filter removeAllTargets];
    [self.blendFilter removeAllTargets];
    [self.uiElementInput removeAllTargets];
    
    if (self.warterMarkView) {
        [self.filter addTarget:self.blendFilter];
        [self.uiElementInput addTarget:self.blendFilter];
        self.initialFilters = @[self.filter];
        self.terminalFilter = self.blendFilter;
    }else {
        self.initialFilters = @[self.filter];
        self.terminalFilter = self.filter;
    }
}
#pragma mark- getter & setter
- (GPUImageUIElement *)uiElementInput{
    if(!_uiElementInput){
        _uiElementInput = [[GPUImageUIElement alloc] initWithView:self.waterMarkContentView];
    }
    return _uiElementInput;
}


- (GPUImageAlphaBlendFilter *)blendFilter{
    if(!_blendFilter){
        _blendFilter = [[GPUImageAlphaBlendFilter alloc] init];
        _blendFilter.mix = 0.9;
        [_blendFilter disableSecondFrameCheck];
    }
    return _blendFilter;
}

- (UIView *)waterMarkContentView{
    if(!_waterMarkContentView){
        _waterMarkContentView = [UIView new];
        _waterMarkContentView.frame = CGRectMake(0, 0,self.videoSize.width, self.videoSize.height);
    }
    return _waterMarkContentView;
}

- (void)setWarterMarkView:(UIView *)warterMarkView{
    if(_warterMarkView && _warterMarkView.superview){
        [_warterMarkView removeFromSuperview];
        _warterMarkView = nil;
    }
    _warterMarkView = warterMarkView;
    self.blendFilter.mix = warterMarkView.alpha;
    [self.waterMarkContentView addSubview:_warterMarkView];
}

- (void)setVideoSize:(CGSize)videoSize {
    _videoSize = videoSize;
    _uiElementInput = nil;
    self.waterMarkContentView.frame = CGRectMake(0, 0,self.videoSize.width, self.videoSize.height);
    [self reloadFilterChain];
}


@end
