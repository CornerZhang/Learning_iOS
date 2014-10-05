//
//  NXPageViewController.h
//  PagedAppManual
//
//  Created by CornerZhang on 14-7-8.
//  Copyright (c) 2014年 NeXtreme.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NXModelController;

@interface NXPageViewController : UIPageViewController <UIPageViewControllerDelegate>
@property (strong, readonly, nonatomic) NXModelController* modelController;

@end
