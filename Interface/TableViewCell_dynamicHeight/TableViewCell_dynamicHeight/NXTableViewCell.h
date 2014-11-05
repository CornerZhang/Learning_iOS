//
//  NXTableViewCell.h
//  TableViewCell_dynamicHeight
//
//  Created by CornerZhang on 14/11/5.
//  Copyright (c) 2014年 NeXtreme.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NXTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *mainTitle;
@property (strong, nonatomic) IBOutlet UILabel *subTitle;

@property (assign, nonatomic) NSNumber* index;

@property (strong, nonatomic) UISwipeGestureRecognizer* gestureSwipeRight;



@end
