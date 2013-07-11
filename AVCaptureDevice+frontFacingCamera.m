//
//  AVCaptureDevice+frontFacingCamera.m
//  Conference
//
//  Created by Sam Baumgarten on 7/10/13.
//  Copyright (c) 2013 Curiousminds. All rights reserved.
//

#import "AVCaptureDevice+frontFacingCamera.h"

@implementation AVCaptureDevice (frontFacingCamera)

+ (AVCaptureDevice *)frontFacingCameraIfAvailable {
  // Try and find front camera
  NSArray *videoDevices = [AVCaptureDevice devicesWithMediaType:AVMediaTypeVideo];
  AVCaptureDevice *captureDevice = nil;
  for (AVCaptureDevice *device in videoDevices) {
    if (device.position == AVCaptureDevicePositionFront) {
      captureDevice = device;
      break;
    }
  }
  // If a front camera is not found, use the default camera
  if (!captureDevice) {
    captureDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
  }
  return captureDevice;
}

@end
