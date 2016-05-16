//
//  TTTLongPressIndicatorProgressVIew.h
//  TTTLongPressIndicatorProgressVIew
//
//  Created by an_ttt on 2015/12/06.
//  Copyright (c) 2015年 GSD. All rights reserved.
//

#import <UIKit/UIKit.h>

#define ColorMaker(r, g, b, a) [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:(a)]

#define TTTLongPressIndicatorMaskViewItemMargin 10

// 背景颜色
#define TTTLongPressIndicatorMaskViewBackgroundColor ColorMaker(240, 240, 240, 0.9)

@interface TTTLongPressIndicatorMaskView : UIView

@property (nonatomic, assign) CGFloat progress;

@end
