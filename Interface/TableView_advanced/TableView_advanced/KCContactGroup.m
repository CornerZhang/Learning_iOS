//
//  KCContactGroup.m
//  TableView_advanced
//
//  Created by CornerZhang on 14-10-2.
//  Copyright (c) 2014年 NeXtreme.com. All rights reserved.
//

#import "KCContactGroup.h"

@implementation KCContactGroup

-(KCContactGroup*)initWithName:(NSString *)name andDetail:(NSString *)detail andContacts:(NSMutableArray *)contacts {
    if (self = [super init]) {
        self.name = name;
        self.detail = detail;
        self.contacts = contacts;
    }
    return self;
}

+(KCContactGroup*)initWithName:(NSString *)name andDetail:(NSString *)detail andContacts:(NSMutableArray *)contacts {
    KCContactGroup* group = [[KCContactGroup alloc] initWithName:name andDetail:detail andContacts:contacts];
    return group;
}

@end
