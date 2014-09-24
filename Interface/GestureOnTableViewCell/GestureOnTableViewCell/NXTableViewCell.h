//
//  NXTableViewCell.h
//  GestureOnTableViewCell
//
//  Created by CornerZhang on 14-9-15.
//  Copyright (c) 2014年 NeXtreme.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NXTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *title;
@property (strong, nonatomic) UIView *userBackgroundView;
@property (strong, nonatomic) UIImageView *markView;
@property (strong, nonatomic) UIImageView *clockView;
@property (assign, nonatomic) CGPoint foregroundCenter;
@end
