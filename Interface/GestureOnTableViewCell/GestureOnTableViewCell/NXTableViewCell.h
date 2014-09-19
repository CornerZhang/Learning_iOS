//
//  NXTableViewCell.h
//  GestureOnTableViewCell
//
//  Created by CornerZhang on 14-9-15.
//  Copyright (c) 2014年 NeXtreme.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NXTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIView *backgroundView;
@property (strong, nonatomic) IBOutlet UIView *foregroundView;
@property (strong, nonatomic) IBOutlet UILabel *title;
@property (strong, nonatomic) IBOutlet UIImageView *markView;
@property (strong, nonatomic) IBOutlet UIImageView *clockView;
@property (assign, nonatomic) CGPoint foregroundCenter;
@end
