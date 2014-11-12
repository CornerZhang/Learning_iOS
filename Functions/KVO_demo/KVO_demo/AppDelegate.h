//
//  AppDelegate.h
//  KVO_demo
//
//  Created by CornerZhang on 14/11/12.
//  Copyright (c) 2014年 NeXtreme.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TestWatche;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) NSString* state;
@property (strong, nonatomic) NSString* completed;
@property (strong, nonatomic) TestWatche* watcher;
@end

