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


@interface ViewController : UIViewController <WTArchitectViewDelegate>
@property (nonatomic,strong) JSContext *context;

//
//@property (nonatomic, strong) WTArchitectView               *architectView;
//@property (nonatomic, weak) WTNavigation                    *architectWorldNavigation;

- (void)architectView:(WTArchitectView *)architectView invokedURL:(NSURL *)url;
@end

