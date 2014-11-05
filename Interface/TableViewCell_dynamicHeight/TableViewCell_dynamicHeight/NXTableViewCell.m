//
//  NXTableViewCell.m
//  TableViewCell_dynamicHeight
//
//  Created by CornerZhang on 14/11/5.
//  Copyright (c) 2014年 NeXtreme.com. All rights reserved.
//

#import "NXTableViewCell.h"
#import "NXTableViewController.h"


@implementation NXTableViewCell
@synthesize mainTitle;
@synthesize subTitle;
@synthesize index;
@synthesize gestureSwipeRight;

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        gestureSwipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(doSwipeLeft:)];
        gestureSwipeRight.direction = UISwipeGestureRecognizerDirectionRight;
        gestureSwipeRight.numberOfTouchesRequired = 1;
        
        [self addGestureRecognizer:gestureSwipeRight];
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)doSwipeLeft:(UISwipeGestureRecognizer*)gesture {
#if DEBUG
    NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
#endif

    NSMutableArray* data = [NXTableViewController sharedInstance].data;
    NSMutableDictionary* cellData = [data objectAtIndex:[index integerValue]];
    NSNumber* bigger = [cellData objectForKey:@"bigger"];
    [cellData setValue:[NSNumber numberWithBool:![bigger boolValue]] forKey:@"bigger"];
    
    // 带有动画的更新cell的height
    NSIndexPath* indexPath = [NSIndexPath indexPathForRow:[index integerValue] inSection:0];
    NSUInteger anim = [index integerValue]==2? UITableViewRowAnimationMiddle : UITableViewRowAnimationAutomatic;
    [[NXTableViewController sharedInstance].tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:anim];
}

@end
