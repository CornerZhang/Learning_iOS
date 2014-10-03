//
//  NXTableViewCell.h
//  TableView_plist
//
//  Created by CornerZhang on 14-7-1.
//  Copyright (c) 2014年 NeXtreme.com. All rights reserved.
//

#import <UIKit/UIKit.h>

#define CELL_FULL_HEIGHT 88

#define CELL_TEXT_WIDTH 210
#define CELL_TEXT_LEFT 8

#define CELL_TITLE_UPPER 8
#define CELL_TITLE_HEIGHT 46
#define CELL_TITLE_LOWER (CELL_TITLE_UPPER)
#define CELL_DETAIL_UPPER 63
#define CELL_DETAIL_HEIGHT 17
#define CELL_DETAIL_LOWER (CELL_TEXT_WIDTH - (CELL_DETAIL_UPPER+CELL_DETAIL_HEIGHT))

@class NXDynamicTableViewController;

@interface NXTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *title;
@property (strong, nonatomic) IBOutlet UILabel *detail;
@property (weak, nonatomic) NSMutableDictionary* data;
@property (weak, nonatomic) NXDynamicTableViewController* controller;
@property (copy, nonatomic) NSIndexPath* indexPath;

- (void)loadData:(NSMutableDictionary*)dictioary;

- (void)detailLableHidden:(BOOL)hidden;
- (CGFloat)heightForCell;

+ (CGFloat)heightForCell:(BOOL)showDescription;

@end
