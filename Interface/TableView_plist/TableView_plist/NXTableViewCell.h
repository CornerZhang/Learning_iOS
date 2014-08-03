//
//  NXTableViewCell.h
//  TableView_plist
//
//  Created by CornerZhang on 14-7-1.
//  Copyright (c) 2014年 NeXtreme.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NXTableViewCell : UITableViewCell

- (void) handleLeftSwipe:(UISwipeGestureRecognizer*)sender;
- (void) handleRightSwipe:(UISwipeGestureRecognizer*)sender;

@end
