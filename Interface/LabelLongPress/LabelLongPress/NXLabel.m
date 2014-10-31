//
//  NXLabel.m
//  LabelLongPress
//
//  Created by CornerZhang on 14/10/28.
//  Copyright (c) 2014年 NeXtreme.com. All rights reserved.
//

#import "NXLabel.h"

@implementation NXLabel

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)longPressLabel:(UILongPressGestureRecognizer *)sender {
    if (sender.state == UIGestureRecognizerStateBegan) {
#if DEBUG
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
#endif
    }
}

@end
