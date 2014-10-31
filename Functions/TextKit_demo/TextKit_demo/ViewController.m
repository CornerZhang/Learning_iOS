//
//  ViewController.m
//  TextKit_demo
//
//  Created by CornerZhang on 14-9-25.
//  Copyright (c) 2014年 NeXtreme.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (assign, nonatomic) BOOL beStrike;
@property (strong, nonatomic) NSTextStorage* textStorage;
@end

@implementation ViewController
@synthesize textLabel;
@synthesize beStrike;
@synthesize textStorage;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    beStrike = NO;
    
    textStorage = [[NSTextStorage alloc] init];

    [self attributeStringStrikeshtrough:beStrike];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)attributeStringStrikeshtrough:(BOOL)strike {
    [textStorage beginEditing];
    
    NSString* string = textLabel.attributedText.string;
    NSDictionary *attribs = @{
                                    NSStrikethroughStyleAttributeName: @(strike)
                                    };
    NSMutableAttributedString* textString = [[NSMutableAttributedString alloc] initWithString:string attributes:attribs];
    [textStorage setAttributedString:textString];
    
    [textStorage endEditing];
    
    textLabel.attributedText = textString;
}

- (IBAction)tapStrikeButton:(UIButton *)sender {
    beStrike = !beStrike;
    
    [self attributeStringStrikeshtrough:beStrike];
}

@end
