//
//  NXTableViewCell.m
//  TableView_plist
//
//  Created by CornerZhang on 14-7-1.
//  Copyright (c) 2014年 NeXtreme.com. All rights reserved.
//

#import "NXTableViewCell.h"



@implementation NXTableViewCell
@synthesize title;
@synthesize detail;


- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) handleLeftSwipe:(UISwipeGestureRecognizer*)sender {
    NSLog(@"left swipe on cell");
}

- (void) handleRightSwipe:(UISwipeGestureRecognizer*)sender {
    NSLog(@"right swipe on cell");
}

@end
