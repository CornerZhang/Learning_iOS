//
//  AppDelegate.m
//  KVO_demo
//
//  Created by CornerZhang on 14/11/12.
//  Copyright (c) 2014年 NeXtreme.com. All rights reserved.
//

#import "AppDelegate.h"
#import "TestWatche.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.watcher = [[TestWatche alloc] init];
    
    // KVC
    BOOL r;
    [self.watcher setValue:@(NO) forKey:@"croped"];
    NSNumber* obj = [self.watcher valueForKey:@"croped"];
    r = [obj boolValue];
    
    // KVC array
    NSArray* names = [self.watcher valueForKeyPath:@"array.name"];
    NSLog(@"%@", names);
    NSNumber* count = [self.watcher valueForKeyPath:@"array.@count"];
    NSArray* ages = [self.watcher valueForKeyPath:@"array.age"];
    count = [ages valueForKeyPath:@"@count"];
    NSNumber* sum = [self.watcher valueForKeyPath:@"array.@sum.age"];
    NSNumber* avg = [self.watcher valueForKeyPath:@"array.@avg.age"];
    NSNumber* max = [self.watcher valueForKeyPath:@"array.@max.age"];
    NSNumber* min = [self.watcher valueForKeyPath:@"array.@min.age"];
    
    // 为@property state的改变绑定一个observing 对象self.watcher
    [self addObserver:self.watcher
           forKeyPath:@"state"
              options:NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew
              context:@"pass content1"];

    [self addObserver:self.watcher
           forKeyPath:@"completed"
              options:NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew
              context:@"pass content2"];
    
    self.state = @"launch";	// 输出设置这个状态时的改变信息 old(null) & new
    self.completed = @"undo";
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    
    self.state = @"Background";	// 输出设置这个状态时的改变信息，old & new
    self.completed = @"done";
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    
    self.state = @"Foreground"; // 输出设置这个状态时的改变信息，old & new
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
