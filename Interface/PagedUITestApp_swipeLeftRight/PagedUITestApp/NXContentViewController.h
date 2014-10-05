//
//  NXContentViewController.h
//  PagedAppManual
//
//  Created by CornerZhang on 14-7-8.
//  Copyright (c) 2014年 NeXtreme.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NXTableView.h"

@interface NXContentViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *monthNameTitle;
@property (strong, nonatomic) IBOutlet NXTableView *tableView;

@property NSString* monthName;

@end
