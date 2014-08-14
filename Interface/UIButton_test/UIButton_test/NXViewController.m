//
//  NXViewController.m
//  UIButton_test
//
//  Created by CornerZhang on 14-7-24.
//  Copyright (c) 2014年 NeXtreme.com. All rights reserved.
//

#import "NXViewController.h"

@interface NXViewController ()

@end

@implementation NXViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated {
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tap:(UIButton *)sender {

}

- (IBAction)tapOnBack:(UITapGestureRecognizer *)sender {
    [self becomeFirstResponder];
    
    CGPoint point = [sender locationInView:self.view];
    
    UIMenuController* menu = [UIMenuController sharedMenuController];
    UIMenuItem* deleteItem = [[UIMenuItem alloc] initWithTitle:@"hide" action:@selector(hide:)];
    menu.menuItems = @[ deleteItem ];
    
    [menu setTargetRect:CGRectMake(point.x, point.y, 0, 0) inView:self.view];
    menu.arrowDirection = UIMenuControllerArrowDefault;
    [menu setMenuVisible:YES animated:YES];	// show menu
 
    [self.view setNeedsDisplay];
}

- (void)hide:(id)sender {
    [self.view setNeedsDisplay];
}

@end
