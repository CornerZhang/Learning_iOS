//
//  NXDatePicker.m
//  DatePicker_demo
//
//  Created by CornerZhang on 14-10-11.
//  Copyright (c) 2014年 NeXtreme.com. All rights reserved.
//

#import "NXDatePicker.h"

#define DEBUG 1 

@implementation NXDatePicker

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
#if DEBUG
    	NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
#endif
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
