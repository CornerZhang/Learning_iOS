//
//  NXDynamicTableViewController.h
//  TableView_plist
//
//  Created by CornerZhang on 14-7-1.
//  Copyright (c) 2014年 NeXtreme.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NXDynamicTableViewController : UITableViewController
@property (nonatomic, strong) UISwipeGestureRecognizer* swipeLeftGestureRecognizer;
@property (nonatomic, strong) UISwipeGestureRecognizer* swipeRightGestureRecognizer;

@property (nonatomic, strong) NSArray*					data;
@end
