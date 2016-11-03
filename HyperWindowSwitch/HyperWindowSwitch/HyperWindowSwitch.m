//
//  HyperWindowSwitch.m
//  HyperWindowSwitch
//
//  Created by Ali Soume`e on 8/13/1395 AP.
//  Copyright © 1395 Ali-Soume. All rights reserved.
//

#import "HyperWindowSwitch.h"
#import "HyperWindowSwitchMainViewController.h"


@interface HyperWindowSwitch()



@end


@implementation HyperWindowSwitch

static HyperWindowSwitchMainViewController *mainVC;


+(void) initializeWindowForAppDelegate:(id)someObject {
    if ([someObject respondsToSelector:@selector(setWindow:)]){
        UIWindow *window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
        [someObject setWindow:window];
        [window makeKeyAndVisible];
        mainVC = [HyperWindowSwitchMainViewController new];
        window.rootViewController = mainVC;
    }
    else{
        NSLog(@"ERROR");
    }
}

+(void) setRootViewController:(UIViewController*) firstVC {
    [mainVC presentViewController:firstVC animated:false completion:nil];
}

+(void) switchToViewController:(UIViewController*) newVC {
    [mainVC dismissViewControllerAnimated:false completion:^{
        [mainVC presentViewController:newVC animated:false completion:nil];
    }];
}

+(void)switchToViewController:(UIViewController*)newVC animationMode:(HyperWindowSwitchAnimationMode)animationMode
{
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
        [mainVC presentViewController:newVC animated:YES completion:^{
        }];
    }
}


@end
