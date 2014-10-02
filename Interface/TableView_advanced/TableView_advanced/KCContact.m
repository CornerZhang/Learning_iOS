//
//  KCContact.m
//  TableView_advanced
//
//  Created by CornerZhang on 14-10-2.
//  Copyright (c) 2014年 NeXtreme.com. All rights reserved.
//

#import "KCContact.h"

@implementation KCContact

-(KCContact*)initWithFirstName:(NSString *)firstName andLastName:(NSString *)lastName andPhoneNumber:(NSString *)phoneNumber {
    if (self = [super init]) {
        self.firstName = firstName;
        self.lastName = lastName;
        self.phoneNumber = phoneNumber;
    }
    return self;
}

-(NSString*)getName {
    return [NSString stringWithFormat:@"%@ %@", _lastName, _firstName];
}

+(KCContact*)initWithFirstName:(NSString *)firstName andLastName:(NSString *)lastName andPhoneNumber:(NSString *)phoneNumber {
    KCContact* contact = [[KCContact alloc] initWithFirstName:firstName andLastName:lastName andPhoneNumber:phoneNumber];
    return contact;
}
@end
