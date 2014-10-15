//
//  NXModelController.h
//  PageBasedApp
//
//  Created by CornerZhang on 14-7-8.
//  Copyright (c) 2014年 NeXtreme.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NXDataViewController;

@interface NXModelController : NSObject <UIPageViewControllerDataSource>

- (NXDataViewController *)viewControllerAtIndex:(NSUInteger)index
                                     storyboard:(UIStoryboard *)storyboard;
- (NSUInteger)indexOfViewController:(NXDataViewController *)viewController;

@end
