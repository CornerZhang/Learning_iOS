//
//  TestWatche.m
//  KVO_demo
//
//  Created by CornerZhang on 14/11/12.
//  Copyright (c) 2014年 NeXtreme.com. All rights reserved.
//

#import "TestWatche.h"

#define DEBUG 1

@implementation TestWatche
@synthesize croped;
@synthesize array;

- (instancetype)init {
    self = [super init];
    if (self) {
        NSString* fileName = [[NSBundle mainBundle] pathForResource:@"KVO_demo" ofType:@"plist"];
        array = [[NSMutableArray alloc] initWithContentsOfFile:fileName];
        
        NSLog(@"array: %@", array);
    }
    return self;
}

//- (void)willChangeValueForKey:(NSString *)key {
//#if DEBUG
//    NSLog(@"Running %@ '%@' -- key: %@", self.class, NSStringFromSelector(_cmd), key);
//#endif
//}

// 当对应属性改变时，被调用的方法
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    NSString* text = (__bridge NSString*)context;
    NSLog(@"%@ change: %@, with context string -- %@", keyPath, change, text);
}

//- (void)didChangeValueForKey:(NSString *)key {
//#if DEBUG
//    NSLog(@"Running %@ '%@' -- key: %@", self.class, NSStringFromSelector(_cmd), key);
//#endif
//}

@end
