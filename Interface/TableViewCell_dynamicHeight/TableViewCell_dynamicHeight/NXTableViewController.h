//
//  NXTableViewController.h
//  TableViewCell_dynamicHeight
//
//  Created by CornerZhang on 14/11/5.
//  Copyright (c) 2014年 NeXtreme.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NXTableViewController : UITableViewController
@property (strong, nonatomic) NSMutableArray* data;

+ (instancetype)sharedInstance;

@end
