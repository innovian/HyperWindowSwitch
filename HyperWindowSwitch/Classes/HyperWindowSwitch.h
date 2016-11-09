//
//  HyperWindowSwitch.h
//  HyperWindowSwitch
//
//  Created by Ali Soume`e on 8/13/1395 AP.
//  Copyright © 1395 Ali-Soume. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    HyperWindowSwitchAnimationModeNone = 0,
    HyperWindowSwitchAnimationModeFromBottom,
    HyperWindowSwitchAnimationModeFade,
    HyperWindowSwitchAnimationModeTransitioningDelegate
} HyperWindowSwitchAnimationMode;

@interface HyperWindowSwitch : NSObject

+(void) initializeWindowForAppDelegate:(id)theAppDelegate;
+(void) setRootViewController:(UIViewController*) firstVC;
+(void) switchToViewController:(UIViewController*) newVC;
+(void)switchToViewController:(UIViewController*)newVC animationMode:(HyperWindowSwitchAnimationMode)animationMode;

@end
