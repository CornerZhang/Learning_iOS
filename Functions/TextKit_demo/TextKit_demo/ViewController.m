//
//  ViewController.m
//  TextKit_demo
//
//  Created by CornerZhang on 14-9-25.
//  Copyright (c) 2014年 NeXtreme.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize textLabel;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSDictionary *attribsStrike = @{
                              NSStrikethroughStyleAttributeName: @YES
                              };
    textLabel.attributedText = [[NSMutableAttributedString alloc] initWithString:@"Important" attributes:attribsStrike];
    
//    NSString* string = textLabel.attributedText.string;
//    NSDictionary *attribsNormal = @{
//                              NSStrikethroughStyleAttributeName: @NO
//                              };
//    textLabel.attributedText = [[NSMutableAttributedString alloc] initWithString:string attributes:attribsNormal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
