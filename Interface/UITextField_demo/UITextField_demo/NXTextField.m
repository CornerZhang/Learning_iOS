//
//  NXTextField.m
//  UITextField_demo
//
//  Created by CornerZhang on 14-8-21.
//  Copyright (c) 2014年 NeXtreme.com. All rights reserved.
//

#import "NXTextField.h"

@implementation NXTextField

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        //...
        self.delegate = self;
        NSLog(@"init with delegate");
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    
    NSLog(@"%@",NSStringFromSelector(_cmd));
    return YES;
}

@end
