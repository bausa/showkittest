//
//  AVCaptureDevice+frontFacingCamera.h
//  Conference
//
//  Created by Sam Baumgarten on 7/10/13.
//  Copyright (c) 2013 Curiousminds. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>

@interface AVCaptureDevice (frontFacingCamera)
+ (AVCaptureDevice *)frontFacingCameraIfAvailable;
@end
