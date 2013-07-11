//
//  AnswerViewController.h
//  Conference
//
//  Created by Sam Baumgarten on 7/10/13.
//  Copyright (c) 2013 Curiousminds. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface AnswerViewController : UIViewController

@property (weak, nonatomic) IBOutlet UISlider *slideToMakeCallSlider;
@property BOOL shouldNotSlideBack;

- (IBAction)sliderTouchesEnded:(id)sender;

@end
