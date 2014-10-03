//
//  NXTableViewCell.m
//  TableView_plist
//
//  Created by CornerZhang on 14-7-1.
//  Copyright (c) 2014年 NeXtreme.com. All rights reserved.
//

#import "NXTableViewCell.h"
#import "NXDynamicTableViewController.h"

#define DEBUG 1

@interface NXTableViewCell ()
@property (strong, nonatomic) UITapGestureRecognizer* doubleTapGesture;
@end

@implementation NXTableViewCell
@synthesize doubleTapGesture;
@synthesize title;
@synthesize detail;
@synthesize data;
@synthesize controller;
@synthesize indexPath;

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
        SEL funcDoubleTapCell = @selector(doubleTapCell:);
        doubleTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:funcDoubleTapCell];
        doubleTapGesture.numberOfTapsRequired = 2;
        doubleTapGesture.numberOfTouchesRequired = 1;
        [self addGestureRecognizer:doubleTapGesture];
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

- (void)doubleTapCell:(UITapGestureRecognizer*)gesture {
#if DEBUG
    NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
#endif

    [data setValue:[NSNumber numberWithBool:detail.hidden] forKey:@"showDescription"];

//    [self detailLableHidden:!detail.hidden];
    [controller.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
}

- (void)loadData:(NSMutableDictionary *)dictioary {
    data = dictioary;
    
    NSNumber* show = [data objectForKey:@"showDescription"];
    title.text = [data objectForKey:@"name"];
    detail.text = [data objectForKey:@"description"];
    
    [self detailLableHidden:![show boolValue]];
}

- (void)detailLableHidden:(BOOL)hidden {
    detail.hidden = hidden;
}

- (CGFloat)heightForCell {
    return [NXTableViewCell heightForCell:detail.hidden];
}

+ (CGFloat)heightForCell:(BOOL)showDescription {
    if (!showDescription) {
        return CELL_TITLE_UPPER + CELL_TITLE_HEIGHT + CELL_TITLE_LOWER;
    }
    return CELL_FULL_HEIGHT;
}

@end
