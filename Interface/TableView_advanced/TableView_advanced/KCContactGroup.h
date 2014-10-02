//
//  KCContactGroup.h
//  TableView_advanced
//
//  Created by CornerZhang on 14-10-2.
//  Copyright (c) 2014年 NeXtreme.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KCContact.h"

@interface KCContactGroup : NSObject
@property (copy, nonatomic) NSString* name;
@property (copy, nonatomic) NSString* detail;
@property (strong, nonatomic) NSMutableArray* contacts;

-(KCContactGroup*)initWithName:(NSString*)name andDetail:(NSString*)detail andContacts:(NSMutableArray*)contacts;
+(KCContactGroup*)initWithName:(NSString*)name andDetail:(NSString*)detail andContacts:(NSMutableArray*)contacts;

@end
