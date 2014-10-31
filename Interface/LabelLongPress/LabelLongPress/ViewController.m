//
//  ViewController.m
//  LabelLongPress
//
//  Created by CornerZhang on 14/10/28.
//  Copyright (c) 2014年 NeXtreme.com. All rights reserved.
//

#import "ViewController.h"
#import "NXLabel.h"
#import <Foundation/Foundation.h>

@interface ViewController ()
@property (strong, nonatomic) UILongPressGestureRecognizer* longPressPageNumberGesture;
@end

@implementation ViewController
@synthesize longPressPageNumberGesture;
@synthesize longPressLabel;

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    longPressPageNumberGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:longPressLabel action:@selector(longPressLabel:)];
    longPressPageNumberGesture.minimumPressDuration = 0.5;
    longPressPageNumberGesture.numberOfTouchesRequired = 1;
    
    [self.view addGestureRecognizer:longPressPageNumberGesture];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
