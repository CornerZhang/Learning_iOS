//
//  PageGroup.h
//  PagedUITestApp
//
//  Created by CornerZhang on 14-7-20.
//  Copyright (c) 2014年 NeXtreme.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Items;

@interface PageGroup : NSManagedObject

@property (nonatomic, retain) NSString * pageTitle;
@property (nonatomic, retain) NSOrderedSet *newRelationship;
@end

@interface PageGroup (CoreDataGeneratedAccessors)

- (void)insertObject:(Items *)value inNewRelationshipAtIndex:(NSUInteger)idx;
- (void)removeObjectFromNewRelationshipAtIndex:(NSUInteger)idx;
- (void)insertNewRelationship:(NSArray *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeNewRelationshipAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInNewRelationshipAtIndex:(NSUInteger)idx withObject:(Items *)value;
- (void)replaceNewRelationshipAtIndexes:(NSIndexSet *)indexes withNewRelationship:(NSArray *)values;
- (void)addNewRelationshipObject:(Items *)value;
- (void)removeNewRelationshipObject:(Items *)value;
- (void)addNewRelationship:(NSOrderedSet *)values;
- (void)removeNewRelationship:(NSOrderedSet *)values;

@end
