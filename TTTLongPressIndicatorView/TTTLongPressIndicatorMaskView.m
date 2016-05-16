//
//  TTTLongPressIndicatorProgressView.m
//  TTTLongPressIndicatorProgressView
//
//  Created by an_ttt on 2015/12/06.
//  Copyright (c) 2015年 GSD. All rights reserved.
//


#import "TTTLongPressIndicatorMaskView.h"

@implementation TTTLongPressIndicatorMaskView

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        self.alpha = 0.7;
        self.layer.cornerRadius = 5;
        self.clipsToBounds = YES;
        
        
    }
    return self;
}

- (void)setProgress:(CGFloat)progress
{
    _progress = progress;
    
    if (progress > 1.0) {
        //[self removeFromSuperview];
    } else {
        [self setNeedsDisplay];
    }
    
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGFloat xCenter = rect.size.width * 0.5;
    CGFloat yCenter = rect.size.height * 0.5;
    
    
    CGFloat radius = MIN(rect.size.width * 0.5, rect.size.height * 0.5) - TTTLongPressIndicatorMaskViewItemMargin;
    
    // 背景遮罩
    [TTTLongPressIndicatorMaskViewBackgroundColor set];
    CGFloat lineW = MAX(rect.size.width, rect.size.height) * 0.5;
    CGContextSetLineWidth(ctx, lineW);
    CGContextAddArc(ctx, xCenter, yCenter, radius + lineW * 0.5 + 5, 0, M_PI * 2, 1);
    CGContextStrokePath(ctx);
    
    // 进程圆
    //[SDColorMaker(0, 0, 0, 0.3) set];
    CGContextSetLineWidth(ctx, 1);
    CGContextMoveToPoint(ctx, xCenter, yCenter);
    CGContextAddLineToPoint(ctx, xCenter, 0);
    CGFloat to = - M_PI * 0.5 + _progress * M_PI * 2; // 初始值
    CGContextAddArc(ctx, xCenter, yCenter, radius, - M_PI * 0.5, to, 1);
    CGContextClosePath(ctx);
    
    CGContextFillPath(ctx);
}


@end
