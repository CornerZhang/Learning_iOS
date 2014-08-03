//
//  NXTableViewController.h
//  TableView_swipe
//
//  Created by CornerZhang on 14-7-1.
//  Copyright (c) 2014年 NeXtreme.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NXTableViewController : UITableViewController
@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *swipeGestureRecognizer;

- (IBAction)handleRightSwipe:(UISwipeGestureRecognizer *)sender;
@end
