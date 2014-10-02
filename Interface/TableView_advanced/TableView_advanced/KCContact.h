//
//  KCContact.h
//  TableView_advanced
//
//  Created by CornerZhang on 14-10-2.
//  Copyright (c) 2014年 NeXtreme.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KCContact : NSObject
@property (copy, nonatomic) NSString* firstName;
@property (copy, nonatomic) NSString* lastName;
@property (copy, nonatomic) NSString* phoneNumber;

-(KCContact*)initWithFirstName:(NSString*)firstName andLastName:(NSString*)lastName andPhoneNumber:(NSString*)phoneNumber;
-(NSString*)getName;

+(KCContact*)initWithFirstName:(NSString*)firstName andLastName:(NSString*)lastName andPhoneNumber:(NSString*)phoneNumber;
@end
