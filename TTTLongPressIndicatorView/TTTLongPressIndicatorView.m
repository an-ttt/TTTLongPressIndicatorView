
//  TTTLongPressIndicatorView.h
//  TTTLongPressIndicatorView
//
//  Created by an_ttt on 2015/12/06.
//  Copyright (c) 2015年 GSD. All rights reserved.
//

#import "TTTLongPressIndicatorView.h"

@interface TTTLongPressIndicatorView ()

@property (strong, nonatomic) NSTimer *timer;
@property (strong, nonatomic) TTTLongPressIndicatorMaskView *maskView;

@end

@implementation TTTLongPressIndicatorView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.layer.cornerRadius = 5;
        self.clipsToBounds = YES;
        
        _maskView = [[TTTLongPressIndicatorMaskView alloc]initWithFrame:CGRectMake(0.0, 0.0, frame.size.width, frame.size.height)];
        _maskView.progress = 0.0;
        [self addSubview:_maskView];
        [self bringSubviewToFront:_maskView];
    }
    return self;
}

- (void)setProgress:(CGFloat)progress
{
    _maskView.progress = progress;
}

- (CGFloat)progress
{
    return _maskView.progress;
}

- (void)setCenterImage:(UIImage *)image
{
    CGFloat halfLength = MIN(self.frame.size.width * 0.5, self.frame.size.height * 0.5) - TTTLongPressIndicatorMaskViewItemMargin * 3;
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, halfLength * 2, halfLength * 2)];
    [imageView setImage:image];
    imageView.layer.anchorPoint = CGPointMake(0.5, 0.5);
    imageView.layer.position = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2);
    imageView.layer.cornerRadius = 5;
    
    [self addSubview:imageView];
    [self sendSubviewToBack:imageView];
    
}

- (void) startProgressWithParent:(UIView *) parentView
{
    if (!_timer) {
        self.progress = 0.0;
        self.alpha = 1.0;
        self.transform = CGAffineTransformMakeScale(1.0, 1.0);
        _timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(doingProgress) userInfo:self repeats:YES];
        
        [parentView addSubview:self];
    }
}

- (void)doingProgress
{
    CGFloat progress = self.progress;
    if (progress == 0.0) {
        progress = 0.01;
    }
    
    progress += 0.07 * self.progress / 1.0;
    if (progress > 1.0) {
        progress = 1.0;
    }
    

    if (progress >= 1.0 && self.progress >= 1.0) {
        [self finishProgress: NO];
        return;
    }
    
    self.progress = progress;
}

- (void) finishProgress:(BOOL) isCancel
{
    if (_timer) {
        [_timer invalidate];
        _timer = nil;
    }
    
    if (!isCancel) {
        [UIView animateWithDuration:1.0 animations:^{
            self.alpha = 0.0;
            self.transform = CGAffineTransformMakeScale(2.0, 2.0);

        } completion:^(BOOL finished) {
            [self removeFromSuperview];
            assert(_successBlock);
            
            if (_successBlock) {
                _successBlock();
            }
        }];
    }
    else {
        [self removeFromSuperview];
    }
    
}

- (void) cancelProgress
{
    if (_timer) {
        [_timer invalidate];
        
        _timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(cancelingProgress) userInfo:self repeats:YES];
    }}

- (void) cancelingProgress
{
    CGFloat progress = self.progress;
    
    progress -= 0.1;
    
    // 循环
    if (progress <= 0.0) {
        [self finishProgress: YES];
    }
    
    self.progress = progress;
}

@end
