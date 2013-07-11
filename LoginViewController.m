//
//  LoginViewController.m
//  Conference
//
//  Created by Sam Baumgarten on 7/10/13.
//  Copyright (c) 2013 Curiousminds. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
  NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
  NSString *documentsDirectory = [paths objectAtIndex:0];
  [ShowKit setState:[NSString stringWithFormat:@"%@/logfile.txt", documentsDirectory] forKey:SHKLogfileKey];
  
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(connectionStateChanged:)
                                               name:SHKConnectionStatusChangedNotification
                                             object:nil];
}

- (void)viewDidDisappear:(BOOL)animated {
  [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)login:(id)sender {
  NSLog(@"TAG: %i", [sender tag]);
  switch ([sender tag]) {
    case 1:
      [ShowKit login:kUser1login password:kUser1password];
      [[UserManager sharedManager] setUsername:kUser1login];
      [[UserManager sharedManager] setPassword:kUser1password];
      break;
    case 2:
      [ShowKit login:kUser1login password:kUser2password];
      [[UserManager sharedManager] setUsername:kUser2login];
      [[UserManager sharedManager] setPassword:kUser2password];
    default:
      break;
  }
}

#pragma mark - ShowKit Delegate
//First, set up the handle the notification
- (void) connectionStateChanged: (NSNotification*) n {
  SHKNotification *s;
  NSString *v ;
  
  s = (SHKNotification *)[n object];
  v = (NSString *)s.Value;
  
  NSLog(@"v: %@", v);
  if ([v isEqualToString:SHKConnectionStatusCallTerminated]){
    
  } else if ([v isEqualToString:SHKConnectionStatusInCall]) {

  } else if ([v isEqualToString:SHKConnectionStatusLoggedIn]) {
    [self performSegueWithIdentifier:@"login" sender:self];
  } else if ([v isEqualToString:SHKConnectionStatusLoginFailed]) {

  } else if ([v isEqualToString:SHKConnectionStatusCallIncoming]) {
    
  }
}

@end
