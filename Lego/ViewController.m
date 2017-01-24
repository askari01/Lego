//
//  ViewController.m
//  Lego
//
//  Created by Syed Askari on 1/13/17.
//  Copyright © 2017 Syed Askari. All rights reserved.
//

#import "ViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>
#import <WikitudeSDK/WikitudeSDK.h>
/* Wikitude SDK debugging */
#import <WikitudeSDK/WTArchitectViewDebugDelegate.h>

/*Wikitude SDK license key (EDU Purpose only) */
#define kWT_LICENSE_KEY @"fZIgzrYWvaBSnaCuujQB6vcRpQESBV0aYvMaDo81Pkdh7SQAsEjB8WlEn1aZLV4izpTuEDnpspthKwFLPd2BU/H/q/Ig1eOCcaPhVftlmkgl7sQkUsvh/YJfmmQI+w8df/S3+LttkNMsw8OhW23nhjmay9gg8EgyJ1UmtksFn1hTYWx0ZWRfX5sExigS3PZKCgTLSeIQFvSoEETXB7vmzHWPBC/01hASFcnkMxL3HqfV2unlVrPuuAVn2Ys2C4SyOGjKZdMy35ViUEfpHEnXT2AZx3Tn+sbBA660RwwCuPOlw9OPI0VswRBgOuIA7Yp5OEfllLIcYFuUyFuoPMRIPhPPthSZjafy1N5KknNEFnu/3WqOE4cHCRZbgpV812ZWOp4CKQ0IxgT7Hlp7TP5GRId1gIkToNw28ahULOqm/D6xKodkbYZC2aqdlibmGRq3dHO+MxXS+ErBjbujOWXJFh3mJvWB0Ty1XQAPL+GYrV3829jm847epi9Dg9mxznOM04sLTLtGL0z1bGKH0XuH5LLWHURYCpT1erRll5PGglNZmBTSuJbt97PIMu61F9s3H+lGS0IDLjy8rRMlhfSel8W6pV5dCAA3BkkJzrM4Fb4X1xPxRGFMoGGSALAdwmXSqANH++KGXwjvRPuh7/E0z/JgC/zCBS1sw08wkEVYUbR5DF9YG6GY1+qjW/MyykQ4"


@interface ViewController () <WTArchitectViewDelegate, WTArchitectViewDebugDelegate>

/* Add a strong property to the main Wikitude SDK component, the WTArchitectView */
@property (nonatomic, strong) WTArchitectView               *architectView;

/* And keep a weak property to the navigation object which represents the loading status of your Architect World */
@property (nonatomic, weak) WTNavigation                    *architectWorldNavigation;

@end

@implementation ViewController

- (void)dealloc
{
    /* Remove this view controller from the default Notification Center so that it can be released properly */
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    NSLog(@"inside xxxxxx");
//    self.label.text = @"dsdfsdfssdfsdf";    // Do any additional setup after loading the view, typically from a nib.
    
    /* It might be the case that the device which is running the application does not fulfil all Wikitude SDK hardware requirements.
     To check for this and handle the situation properly, use the -isDeviceSupportedForRequiredFeatures:error class method.
     
     Required features specify in more detail what your Architect World intends to do. Depending on your intentions, more or less devices might be supported.
     e.g. an iPod Touch is missing some hardware components so that Geo augmented reality does not work, but 2D tracking does.
     
     NOTE: On iOS, an unsupported device might be an iPhone 3GS for image recognition or an iPod Touch 4th generation for Geo augmented reality.
     */
    NSError *deviceSupportError = nil;
    if ( [WTArchitectView isDeviceSupportedForRequiredFeatures:WTFeature_Geo error:&deviceSupportError] ) {
//        NSLog(@"inside rrrrr");
        /* Standard WTArchitectView object creation and initial configuration */
        self.architectView = [[WTArchitectView alloc] initWithFrame:CGRectZero motionManager:nil];
        self.architectView.delegate = self;
        self.architectView.debugDelegate = self;
        
        /* Use the -setLicenseKey method to unlock all Wikitude SDK features that you bought with your license. */
        [self.architectView setLicenseKey:@"qByvLCLFn+zWbd/q+hLw6bB1O8ZAFxL8/x5gm/SyBy12uXgjB/d1AMXqsJKu5bS3zprcAa9r8+01xjF5IDD66fmBkjzB2eeA/F1gCbXSu8JOgsWHHNIM/nghjIUF2Vi6YTyBmg14nLwW4oEP4+/SQ1i40DoSQIYHzIzgh5vP9IJTYWx0ZWRfX4LR4ZVqtTgyXTbFGRLrE0uNwZ0JaWwD5XJcWYw01DdRzIjFOF2QcYnT8lw4jJMlzF3KubwtcE8IVJJivuVZHeMF5b+yUCgRTnSST4e9+cIGBk62075QEiK99AgkWd8ncl++xKOvOi9UcFFQFKT8eoV9e8r9rfVBucjKQkAklm1zUz1/riwmKUcW90PIzZi4WPawCgZAi8/tDRptNCFRBQdoep9d1wIIbvusXxZodAt6+gQJVaKmoZOBsQzGHaK5AsryRTm7VBBGOyeViNrTnZSAp6qo5y47p0W+1Hnvx4+tgGaoTc3o0QtM3qvMWXm5BLiGcMJFjI922y939cEAF3Db3VJ4T97gU35DbvnKkS2IFV3S35FxuNh047GboOBAAm0n00v0x8AapFQ5wXxH+WsxgbhP3OLR7sKsmheUk1eRcHqnHHuMGAb4ul+cbRoIgdTIPVo8ZrzyefZJqzwR5JOlc4gd47aFUCvRyDel4vO2oWD2S4q8HrQ="];
        
        
        /* The Architect World can be loaded independently from the WTArchitectView rendering.
         
         NOTE: The architectWorldNavigation property is assigned at this point. The navigation object is valid until another Architect World is loaded.
         */
        self.architectWorldNavigation = [self.architectView loadArchitectWorldFromURL:[[NSBundle mainBundle] URLForResource:@"index" withExtension:@"html" subdirectory:@"ArchitectWorld"] withRequiredFeatures:WTFeature_Geo];
        
        /* Because the WTArchitectView does some OpenGL rendering, frame updates have to be suspended and resumend when the application changes it's active state.
         Here, UIApplication notifications are used to respond to the active state changes.
         
         NOTE: Since the application will resign active even when an UIAlert is shown, some special handling is implemented in the UIApplicationDidBecomeActiveNotification.
         */
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didReceiveApplicationWillResignActiveNotification:) name:UIApplicationWillResignActiveNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didReceiveApplicationDidBecomeActiveNotification:) name:UIApplicationDidBecomeActiveNotification object:nil];
        
        /* Standard subview handling using Autolayout */
        [self.view addSubview:self.architectView];
        
//        _myTempView.frame = CGRectMake(0, 590, [[UIScreen mainScreen] bounds].size.width, 360);
 
        self.myTempView.hidden = true;
        _picView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(picImage:)];
        tapGesture.numberOfTapsRequired = 1;
        [tapGesture setDelegate:self];
        [_picView addGestureRecognizer:tapGesture];
        
        self.architectView.translatesAutoresizingMaskIntoConstraints = NO;
        
        NSDictionary *views = NSDictionaryOfVariableBindings(_architectView);
        [self.view addConstraints: [NSLayoutConstraint constraintsWithVisualFormat:@"|[_architectView]|" options:0 metrics:nil views:views] ];
        [self.view addConstraints: [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_architectView]|" options:0 metrics:nil views:views] ];
        
//        NSLog(@"inside");
        
        //Testing JS call
    }
    else {
        NSLog(@"This device is not supported. Show either an alert or use this class method even before presenting the view controller that manages the WTArchitectView. Error: %@", [deviceSupportError localizedDescription]);
    }
}
    

#pragma mark - View Lifecycle
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    /* WTArchitectView rendering is started once the view controllers view will appear */
    [self startWikitudeSDKRendering];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    /* WTArchitectView rendering is stopped once the view controllers view did disappear */
    [self stopWikitudeSDKRendering];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - View Rotation
- (BOOL)shouldAutorotate {
    
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    
    return UIInterfaceOrientationMaskAll;
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    
    /* When the device orientation changes, specify if the WTArchitectView object should rotate as well */
    [self.architectView setShouldRotate:YES toInterfaceOrientation:toInterfaceOrientation];
}

#pragma mark - Private Methods

/* Convenience methods to manage WTArchitectView rendering. */
- (void)startWikitudeSDKRendering{
    
    /* To check if the WTArchitectView is currently rendering, the isRunning property can be used */
    if ( ![self.architectView isRunning] ) {
        
        /* To start WTArchitectView rendering and control the startup phase, the -start:completion method can be used */
        [self.architectView start:^(WTStartupConfiguration *configuration) {
            
            /* Use the configuration object to take control about the WTArchitectView startup phase */
            /* You can e.g. start with an active front camera instead of the default back camera */
            
            // configuration.captureDevicePosition = AVCaptureDevicePositionFront;
            
        } completion:^(BOOL isRunning, NSError *error) {
            
            /* The completion block is called right after the internal start method returns.
             
             NOTE: In case some requirements are not given, the WTArchitectView might not be started and returns NO for isRunning.
             To determine what caused the problem, the localized error description can be used.
             */
            if ( !isRunning ) {
                NSLog(@"WTArchitectView could not be started. Reason: %@", [error localizedDescription]);
            }
        }];
    }
}

- (void)stopWikitudeSDKRendering {
    
    /* The stop method is blocking until the rendering and camera access is stopped */
    if ( [self.architectView isRunning] ) {
        [self.architectView stop];
    }
}

/* The WTArchitectView provides two delegates to interact with. */
#pragma mark - Delegation

/* The standard delegate can be used to get information about:
 * The Architect World loading progress
 * architectsdk:// protocol invocations using document.location inside JavaScript
 * Managing view capturing
 * Customizing view controller presentation that is triggered from the WTArchitectView
 */
#pragma mark WTArchitectViewDelegate
- (void)architectView:(WTArchitectView *)architectView didFinishLoadArchitectWorldNavigation:(WTNavigation *)navigation {
    /* Architect World did finish loading */
}

- (void)architectView:(WTArchitectView *)architectView didFailToLoadArchitectWorldNavigation:(WTNavigation *)navigation withError:(NSError *)error {
    
    NSLog(@"Architect World from URL '%@' could not be loaded. Reason: %@", navigation.originalURL, [error localizedDescription]);
}

/* The debug delegate can be used to respond to internal issues, e.g. the user declined camera or GPS access.
 
 NOTE: The debug delegate method -architectView:didEncounterInternalWarning is currently not used.
 */
#pragma mark WTArchitectViewDebugDelegate
- (void)architectView:(WTArchitectView *)architectView didEncounterInternalWarning:(WTWarning *)warning {
    
    /* Intentionally Left Blank */
}

- (void)architectView:(WTArchitectView *)architectView didEncounterInternalError:(NSError *)error {
    
    NSLog(@"WTArchitectView encountered an internal error '%@'", [error localizedDescription]);
}

#pragma mark - Notifications
/* UIApplication specific notifications are used to pause/resume the architect view rendering */
- (void)didReceiveApplicationWillResignActiveNotification:(NSNotification *)notification
{
    dispatch_async(dispatch_get_main_queue(), ^{
        /* Standard WTArchitectView rendering suspension when the application resignes active */
        [self stopWikitudeSDKRendering];
    });
}

- (void)didReceiveApplicationDidBecomeActiveNotification:(NSNotification *)notification
{
    dispatch_async(dispatch_get_main_queue(), ^{
        
        /* When the application starts for the first time, several UIAlert's might be shown to ask the user for camera and/or GPS access.
         Because the WTArchitectView is paused when the application resigns active (See line 86), also Architect JavaScript evaluation is interrupted.
         To resume properly from the inactive state, the Architect World has to be reloaded if and only if an active Architect World load request was active at the time the application resigned active.
         This loading state/interruption can be detected using the navigation object that was returned from the -loadArchitectWorldFromURL:withRequiredFeatures method.
         */
        if ( self.architectWorldNavigation.wasInterrupted )
        {
            [self.architectView reloadArchitectWorld];
        }
        
        /* Standard WTArchitectView rendering resuming after the application becomes active again */
        [self startWikitudeSDKRendering];
    });
}
    
    - (void)architectView:(WTArchitectView *)architectView invokedURL:(NSURL *)url
    {
        NSLog(@"CALLING");
        
        if (!self.myTempView.hidden){
        if ([[url absoluteString] hasPrefix:@"architectsdk://markerselected?Close"]) {
                        NSLog(@"closing");
            
            //            self.myTempView .hidden = false;
            //            CGSize size = [UIScreen mainScreen].bounds.size;
            [UIView animateWithDuration:0.5
                                  delay:0.1
                                options: UIViewAnimationCurveEaseIn
                             animations:^{
                                 //                                 NSLog(@"closing");
                                 self.myTempView.frame = CGRectMake(0, 590, [[UIScreen mainScreen] bounds].size.width, 360);
                             }
                             completion:^(BOOL finished){
                                 if (finished)
                                     self.myTempView .hidden = true;
                                 //                                     [self.myTempView removeFromSuperview];
                             }];
            //            self.myTempView .hidden = true;
        }
        }
        if ([[url absoluteString] hasPrefix:@"architectsdk://markerselected?id"]) {
            
            NSDictionary *parameters = nil;//[self parseURLParameterFromURL:[url absoluteString]];
            
            NSString *myURL = [url absoluteString] ;
            NSString *tag = [myURL substringFromIndex:[myURL  rangeOfString:@"//"].location];
            NSString *encoded = tag;
            NSString *decoded = [encoded stringByRemovingPercentEncoding];
            
            NSLog(@"decodedString %@", decoded);
            
            NSString *url=decoded;
            NSArray *comp1 = [url componentsSeparatedByString:@"?"];
            NSString *query = [comp1 lastObject];
            NSArray *queryElements = [query componentsSeparatedByString:@"&"];
            for (NSString *element in queryElements) {
                NSArray *keyVal = [element componentsSeparatedByString:@"="];
                if (keyVal.count > 0) {
                    NSLog(@"@%", keyVal);
                    NSString *variableKey = [keyVal objectAtIndex:0];
                    NSString *value = (keyVal.count == 2) ? [keyVal lastObject] : nil;
                    NSLog(@"%@ %@", variableKey , value);
                    if ([variableKey  isEqual: @"title"]){
                        NSString *title = [value stringByReplacingOccurrencesOfString:@"#" withString:@" "];
                        NSLog(@"hello");
                        _mainLbl.text = title;
                    }
                }
            }

            NSLog(@"tag is %@", tag);
            
            if (self.myTempView.hidden){
                
            self.myTempView .hidden = false;
            [UIView animateWithDuration:0.5
                                  delay:0.1
                                options: UIViewAnimationCurveEaseIn
                             animations:^{
//                                 NSLog(@"opening");
                                 _myTempView.frame = CGRectMake(0, 420, [[UIScreen mainScreen] bounds].size.width, 360);
                             }
                             completion:^(BOOL finished){
                             }];
            
            [self.view addSubview:_myTempView];
            }
//            self.label.text = @"123456";
//            _label.text = @"44554";
        }
    }

- (void) picImage: (id)sender {
    NSLog(@"hello");
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];
}

#pragma mark - Image Picker Controller delegate methods

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    _picView.image = chosenImage;
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

@end


