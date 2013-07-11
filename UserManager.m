//
//  UserManager.m
//  Conference
//
//  Created by Sam Baumgarten on 7/10/13.
//  Copyright (c) 2013 Curiousminds. All rights reserved.
//

#import "UserManager.h"

@implementation UserManager
@synthesize username;
@synthesize password;

+ (id)sharedManager {
  static UserManager *sharedUserManager = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    sharedUserManager = [[self alloc] init];
  });
  return sharedUserManager;
}

- (id)init {
  if (self = [super init]) {
    self.username = @"";
  }
  return self;
}

@end
