
//  TTTLongPressIndicatorView.h
//  TTTLongPressIndicatorView
//
//  Created by an_ttt on 2015/12/06.
//  Copyright (c) 2015年 GSD. All rights reserved.
//

#import "TTTLongPressIndicatorMaskView.h"

@interface TTTLongPressIndicatorView : UIView

@property (nonatomic, assign) CGFloat progress;
@property (nonatomic, copy) void(^successBlock)();


- (void)setCenterImage:(UIImage *)image;

- (void) startProgressWithParent:(UIView *) parentView;
- (void) cancelProgress;


@end
