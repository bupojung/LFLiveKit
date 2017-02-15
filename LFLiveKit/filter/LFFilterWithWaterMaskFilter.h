//
//  LFBeautyWithWaterMaskFilter.h
//  LFLiveKit
//
//  Created by yizhong zhuang on 2017/2/10.
//  Copyright © 2017年 admin. All rights reserved.
//

#if __has_include(<GPUImage/GPUImageFramework.h>)
#import <GPUImage/GPUImageFramework.h>
#else
#import "GPUImage.h"
#endif

@interface LFFilterWithWaterMaskFilter : GPUImageFilterGroup
@property (nonatomic, strong) UIView *warterMarkView;
@property (nonatomic, strong) GPUImageFilter *filter;
@property (nonatomic, assign) CGSize videoSize;
- (instancetype)initWithWaterMaskView:(UIView *)waterMaskView filter:(GPUImageFilter *)filter;
@end
