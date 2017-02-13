//
//  ViewController.h
//  Lego
//
//  Created by Syed Askari on 1/13/17.
//  Copyright © 2017 Syed Askari. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WikitudeSDK/WTArchitectView.h>
#import <JavaScriptCore/JavaScriptCore.h>
#import <WikitudeSDK/WTArchitectViewDebugDelegate.h>
#import <Lego-Swift.h>
#import <Firebase.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface ViewController : UIViewController <WTArchitectViewDelegate>
@property (nonatomic,strong) JSContext *context;
    @property (weak, nonatomic) IBOutlet UILabel *mainLbl;
    @property (weak, nonatomic) IBOutlet UILabel *cordinatesLbl;
    @property (weak, nonatomic) IBOutlet UILabel *descriptionLbl;
    @property (weak, nonatomic) IBOutlet UIImageView *picView;
    @property (weak, nonatomic) IBOutlet UITextField *markerLbl;
    @property (weak, nonatomic) IBOutlet UITextView *markerDesc;

//
//@property (nonatomic, strong) WTArchitectView               *architectView;
//@property (nonatomic, weak) WTNavigation                    *architectWorldNavigation;

- (void)architectView:(WTArchitectView *)architectView invokedURL:(NSURL *)url;

- (void) picImage: (id)sender ;
- (CLLocationCoordinate2D) getLocation;

//- (void) hi:;

@property (weak, nonatomic) IBOutlet UICollectionView *myTempView;
@property (weak, nonatomic) IBOutlet UICollectionView *addMarker;
//@property (readonly, nonatomic) FIRStorage *_Nonnull storage;

@end



