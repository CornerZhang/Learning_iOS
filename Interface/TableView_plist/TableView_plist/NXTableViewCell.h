//
//  NXTableViewCell.h
//  TableView_plist
//
//  Created by CornerZhang on 14-7-1.
//  Copyright (c) 2014年 NeXtreme.com. All rights reserved.
//

#import <UIKit/UIKit.h>

#define FONT_SIZE 14.0f

#define CELL_TEXT_WIDTH 210
#define CELL_TEXT_LEFT 8

#define CELL_TITLE_UPPER 8
#define CELL_TITLE_HEIGHT 46
#define CELL_DETAIL_UPPER 61
#define CELL_DETAIL_HEIGHT 20


@interface NXTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *title;
@property (strong, nonatomic) IBOutlet UILabel *detail;

- (void) handleLeftSwipe:(UISwipeGestureRecognizer*)sender;
- (void) handleRightSwipe:(UISwipeGestureRecognizer*)sender;


@end
