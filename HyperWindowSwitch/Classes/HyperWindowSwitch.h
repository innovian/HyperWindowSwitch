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
    HyperWindowSwitchAnimationModeFromBottomWithCollision,
    HyperWindowSwitchAnimationModeFade,
    HyperWindowSwitchAnimationModeTransitioningDelegate
} HyperWindowSwitchAnimationMode;

@interface HyperWindowSwitch : NSObject

/**
 *  step1: You must first set your "Main Interface" equals to null. Main Intrface  is in general tab.
 *  step2: Then, you should add initialiezeWindowForAppDelegate in  didFinishLaunchingWithOptions function of AppDelegate.
 *  step3: Add setRootViewController in didFinishLaunchingWithOptions function of AppDelegate after initializeWindowForAppDelegate.
 */
+(void) initializeWindowForAppDelegate:(id)theAppDelegate;


/**
 *  This function is for setting the view of the rootViewController.
 *  You should in the first set your first viewController, so you add this function in AppDelegate after initializeWindowForAppDelegate function.
 */
+(void) setRootViewController:(UIViewController*) firstVC;


/**
 *  This function is for setting the new viewController which you want to display; the function has four default transition mode for animationing on appearing the new view.
 */
+(void)switchToViewController:(UIViewController*)newVC animationMode:(HyperWindowSwitchAnimationMode)animationMode completion:(void (^)())completion;

@end
