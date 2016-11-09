//
//  HyperWindowSwitch.m
//  HyperWindowSwitch
//
//  Created by Ali Soume`e on 8/13/1395 AP.
//  Copyright © 1395 Ali-Soume. All rights reserved.
//

#import "HyperWindowSwitch.h"
//#import "HyperWindowSwitchMainViewController.h"


@interface HyperWindowSwitch()



@end


@implementation HyperWindowSwitch

static UIViewController *mainVC;
__weak static id appDelegate;

+(void) initializeWindowForAppDelegate:(id)theAppDelegate {
    if ([theAppDelegate respondsToSelector:@selector(setWindow:)]){
        UIWindow *window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
        [theAppDelegate setWindow:window];
        [window makeKeyAndVisible];
//        mainVC = [UIViewController new];
//        window.rootViewController = mainVC;
		appDelegate = theAppDelegate;
    }
    else{
        NSLog(@"ERROR");
    }
}

+(void) setRootViewController:(UIViewController*) firstVC {
//	NSAssert(mainVC, @"[ERROR] HyperWindowSwitch: It looks like you have not initialized HyperWindowSwitch correctly. Please add [HyperWindowSwitch initializeWindowForAppDelegate:self]  in application:didFinishLaunchingWithOptions in your app delegate file.");
//    [mainVC presentViewController:firstVC animated:false completion:nil];
//	[mainVC addChildViewController:firstVC];
//	[mainVC.view addSubview:firstVC];
	
	[[appDelegate window] setRootViewController:firstVC];
}

+(void) switchToViewController:(UIViewController*) newVC {
//	NSAssert(mainVC, @"[ERROR] HyperWindowSwitch: It looks like you have not initialized HyperWindowSwitch correctly. Please add [HyperWindowSwitch initializeWindowForAppDelegate:self]  in application:didFinishLaunchingWithOptions in your app delegate file.");
    [mainVC dismissViewControllerAnimated:false completion:^{
        [mainVC presentViewController:newVC animated:false completion:nil];
    }];
}

+(void)switchToViewController:(UIViewController*)newVC animationMode:(HyperWindowSwitchAnimationMode)animationMode
{
//	NSAssert(mainVC, @"[ERROR] HyperWindowSwitch: It looks like you have not initialized HyperWindowSwitch correctly. Please add [HyperWindowSwitch initializeWindowForAppDelegate:self]  in application:didFinishLaunchingWithOptions in your app delegate file.");
    if (animationMode == HyperWindowSwitchAnimationModeNone)
    {
        
    }
    else if (animationMode == HyperWindowSwitchAnimationModeFromBottom)
    {
        
    }
    else if (animationMode == HyperWindowSwitchAnimationModeFade)
    {
        
    }
    else if (animationMode == HyperWindowSwitchAnimationModeTransitioningDelegate)
    {
		[[[appDelegate window] rootViewController] presentViewController:newVC animated:YES completion:^{
//			UIView* [newVC.view snapshotViewAfterScreenUpdates:YES]
			[[[appDelegate window] rootViewController] dismissViewControllerAnimated:NO completion:^{
				[[appDelegate window] setRootViewController:newVC];
			;}];
			
		}];
//        [mainVC presentViewController:newVC animated:YES completion:^{
//        }];
    }
}


@end
