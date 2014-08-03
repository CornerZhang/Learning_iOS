//
//  Items.h
//  PagedUITestApp
//
//  Created by CornerZhang on 14-7-20.
//  Copyright (c) 2014年 NeXtreme.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class PageGroup;

@interface Items : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * displayOrder;
@property (nonatomic, retain) PageGroup *newRelationship;

@end
