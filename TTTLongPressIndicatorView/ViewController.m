//
//  ViewController.m
//  TTTLongPressIndicatorView
//
//  Created by an_ttt on 16/5/16.
//  Copyright © 2016年 an_ttt. All rights reserved.
//

#import "ViewController.h"
#import "TTTLongPressIndicatorView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *LongPressMenu;
@property (strong, nonatomic) TTTLongPressIndicatorView *pieView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    UILongPressGestureRecognizer *longPressGR =
    [[UILongPressGestureRecognizer alloc] initWithTarget:self
                                                  action:@selector(didLongPressNavigationLeftItem:)];
    longPressGR.allowableMovement = NO;
    longPressGR.minimumPressDuration = 0.2;

    [self.LongPressMenu addGestureRecognizer:longPressGR];
}

- (TTTLongPressIndicatorView *)pieView
{
    if (!_pieView) {
        CGFloat width = 100;
        CGFloat height = width;
        CGSize size = self.view.frame.size;
        CGPoint origin = self.view.frame.origin;
        
        _pieView = [[TTTLongPressIndicatorView alloc] initWithFrame:(CGRectMake(origin.x + size.width / 2 - width / 2, origin.y + size.height / 2 - height / 2, width, height))];

        UIImage* image = [UIImage imageNamed:@"Close_Indicator"];
        [_pieView setCenterImage:image];
        _pieView.successBlock = ^() {

           
        };
    }
    
    return _pieView;
}

- (void)didLongPressNavigationLeftItem:(UILongPressGestureRecognizer *)gesture
{
    if(gesture.state == UIGestureRecognizerStateBegan) {
        
        [self.pieView startProgressWithParent:self.view];
        return;
    }
    
    if(gesture.state == UIGestureRecognizerStateEnded){
        [self.pieView cancelProgress];
        return;
    }
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
