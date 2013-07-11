//
//  AnswerViewController.m
//  Conference
//
//  Created by Sam Baumgarten on 7/10/13.
//  Copyright (c) 2013 Curiousminds. All rights reserved.
//

#import "AnswerViewController.h"
#import "ConnectingViewController.h"
#import "AVCaptureDevice+frontFacingCamera.h"

@interface AnswerViewController ()

@end

@implementation AnswerViewController

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
  
  // Setup Slider
  UIImage *clearImage = [[UIImage alloc] init];
  [self.slideToMakeCallSlider setMinimumTrackImage:clearImage forState:UIControlStateNormal];
  [self.slideToMakeCallSlider setMaximumTrackImage:clearImage forState:UIControlStateNormal];
  [_slideToMakeCallSlider addTarget:self action:@selector(controlEventValueChanged:) forControlEvents:UIControlEventValueChanged];

  // Setup preview
  [self setupAVFoundation];
}

- (void)viewDidDisappear:(BOOL)animated {
  [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Slider Delegates
- (void)controlEventValueChanged:(UISlider *)sender {
  if (sender.value == 1.0 && !_shouldNotSlideBack) {
    _shouldNotSlideBack = YES;
    [ShowKit acceptCall];
    [self performSegueWithIdentifier:@"call" sender:self];
  }
}

- (IBAction)sliderTouchesEnded:(id)sender {
  if (!_shouldNotSlideBack) {
    [sender setValue:0.0 animated:YES];
  }
}

#pragma mark - AVFoundation
- (void)setupAVFoundation {
  // Setup variables
  NSError *error;
  // Setup session
  AVCaptureSession *session = [[AVCaptureSession alloc] init];
  [session setSessionPreset:AVCaptureSessionPresetLow];
  // Setup camera
  AVCaptureDevice *captureDevice = [AVCaptureDevice frontFacingCameraIfAvailable];
    AVCaptureDeviceInput *deviceInput = [AVCaptureDeviceInput deviceInputWithDevice:captureDevice error:&error];
  if ([session canAddInput:deviceInput]) {
    [session addInput:deviceInput];
  }
  // Setup preview
  AVCaptureVideoPreviewLayer *previewLayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:session];
  [previewLayer setVideoGravity:AVLayerVideoGravityResizeAspectFill];
  // Add preview to view
  CALayer *rootLayer = [[self view] layer];
  [previewLayer setDoubleSided:YES];
  [rootLayer setMasksToBounds:YES];
  [previewLayer setFrame:CGRectMake(-70, 0, rootLayer.bounds.size.height, rootLayer.bounds.size.height)];
  [rootLayer insertSublayer:previewLayer atIndex:0];
  // Start session
  [session startRunning];
}

#pragma -mark Segue
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  if ([segue.identifier isEqualToString:@"connect"]) {
    ConnectingViewController *vc = [segue destinationViewController];
    [vc setStatus:@"Connecting..."];
  }
}

@end
