//
//  NXDataViewController.m
//  PageBasedApp
//
//  Created by CornerZhang on 14-7-8.
//  Copyright (c) 2014年 NeXtreme.com. All rights reserved.
//

#import "NXDataViewController.h"

@interface NXDataViewController ()

@end

@implementation NXDataViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.dataLabel.text = [self.dataObject description];
}

@end
