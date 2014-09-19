//
//  NXViewController.m
//  ViewPosition_conv
//
//  Created by CornerZhang on 14-9-5.
//  Copyright (c) 2014年 NeXtreme.com. All rights reserved.
//

#import "NXViewController.h"

@interface NXViewController ()
@property (strong, nonatomic) IBOutlet UIView *redView;
@property (strong, nonatomic) IBOutlet UIView *groundView;


@end

@implementation NXViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIView* red = _redView;
    UIView* ground = _groundView;
    
    NSLog(@"red center (%f, %f)", _redView.center.x, _redView.center.y);
    NSLog(@"ground center (%f, %f)", _groundView.center.x, _groundView.center.y);
    
    UIView* targetView = self.view;
    UIView* localView = _redView.superview;
    CGPoint redCenter = [localView convertPoint:_redView.center toView:targetView];
    localView = _groundView.superview;
    CGPoint groundCenter = [localView convertPoint:_groundView.center toView:targetView];
    
    localView = _redView.superview;
    CGRect redFrame = [localView convertRect:_redView.frame toView:targetView];
    localView = _groundView.superview;
    CGRect groundFrame = [localView convertRect:_groundView.frame toView:targetView];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
