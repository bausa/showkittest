//
//  UserManager.h
//  Conference
//
//  Created by Sam Baumgarten on 7/10/13.
//  Copyright (c) 2013 Curiousminds. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString *kUser1login = @"336.veeru";
static NSString *kUser2login = @"336.sam";
static NSString *kUser1password = @"testtest";
static NSString *kUser2password = @"testtest";

@interface UserManager : NSObject
@property (nonatomic, retain) NSString *username;
@property (nonatomic, retain) NSString *password;
+ (id)sharedManager;
@end
