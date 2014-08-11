//
//  NXViewController.m
//  PageCornerCurl
//
//  Created by CornerZhang on 14-8-11.
//  Copyright (c) 2014年 NeXtreme.com. All rights reserved.
//

#import "NXViewController.h"

@interface NXViewController ()

@end

@implementation NXViewController
@synthesize isCurl;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    isCurl = NO;
    
}

- (void)viewDidAppear:(BOOL)animated {
    [self performSelector:@selector(doCurl:) withObject:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)doCurl:(UIBarButtonItem *)sender {
    CATransition* curlAnimation = [CATransition animation];	// 继承自CAAnimation
    curlAnimation.delegate = self;
    curlAnimation.duration = 0.2f;
    curlAnimation.timingFunction = UIViewAnimationCurveEaseInOut;
    
    if (!isCurl) {
        curlAnimation.type = @"pageCurl";
        curlAnimation.endProgress = 0.25f;
    }else{
        curlAnimation.type = @"pageUnCurl";
        curlAnimation.startProgress = 0.75f;
    }
    
	curlAnimation.fillMode = kCAFillModeForwards;
    curlAnimation.subtype = kCATransitionFromBottom;
    curlAnimation.removedOnCompletion = NO;
    
    [self.view exchangeSubviewAtIndex:0 withSubviewAtIndex:1];	// ???
    [[self.view layer] addAnimation:curlAnimation forKey:@"PageCurlAnimation"];
    
    isCurl = !isCurl;
}
@end
