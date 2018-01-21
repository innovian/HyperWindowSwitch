//
//  HyperWindowSwitch.m
//  HyperWindowSwitch
//
//  Created by Ali Soume`e on 8/13/1395 AP.
//  Copyright © 1395 Ali-Soume. All rights reserved.
//

#import "HyperWindowSwitch.h"
#import "HyperWindowSwitchDummyVC.h"
#import "HyperWindowSwitchTransitioningDelegate.h"

@protocol visibleStatusBarInterface <NSObject>

@property(nonatomic, readonly) UIStatusBarStyle preferredStatusBarStyle;

@end

@implementation HyperWindowSwitch


__weak static id appDelegate;


+(void) initializeWindowForAppDelegate:(id)theAppDelegate {
    if ([theAppDelegate respondsToSelector:@selector(setWindow:)]){
        UIWindow *window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
        [theAppDelegate setWindow:window];
        [window makeKeyAndVisible];
        appDelegate = theAppDelegate;
    }
    else{
        NSLog(@"ERROR");
    }
}


+(void) setRootViewController:(UIViewController*) firstVC {
    [[appDelegate window] setRootViewController:firstVC];
}


+(void)switchToViewController:(UIViewController*)newVC animationMode:(HyperWindowSwitchAnimationMode)animationMode completion:(void (^)())completion;
{
    if (![[appDelegate window] rootViewController])
    {
        [self setRootViewController:newVC];
        return;
    }
    
    if (animationMode == HyperWindowSwitchAnimationModeNone)
    {
        UIViewController* currentVC = [[appDelegate window] rootViewController] ;
        [currentVC presentViewController:newVC animated:false completion:^{
            
            //now we have to dismiss currentVC and immediately set the window.rootViewController. but it will cause a slight glitch in status bar. to avoid it, we have to create a snapshot of the presented vc as the dummyVC and set window.rootViewController = dummyVC. Now we can safely tell the currentVC to dismiss and and it's completion we set the window.rootViewController to the real newVC. Note that the dummyVC is a subclass of HyperWindowSwitchDummyVC. HyperWindowSwitchDummyVC is just a simple view controller but it immitates newVC's status bar style.
            HyperWindowSwitchDummyVC* vc = [HyperWindowSwitchDummyVC new];
            vc.statusBarHidden = [newVC prefersStatusBarHidden];
            vc.statusBarStyle = [newVC preferredStatusBarStyle];
            [vc.view addSubview:[newVC.view snapshotViewAfterScreenUpdates:YES]];
            [[appDelegate window] setRootViewController:vc];
            
            [currentVC dismissViewControllerAnimated:NO completion:^{
                [[appDelegate window] setRootViewController:newVC];
                if (completion)
                    completion();
                ;}];
        }];
    }
    else if (animationMode == HyperWindowSwitchAnimationModeTransitioningDelegate)
    {
        
        //*********** We wrap up the currentVC into a HyperWindowSwitchDummyVC ********//
        // Reason: because the currentVC in some cases won't perform the animation delegate context immediately. (after a touch or some other ui event it will perform be performed! (without receiving any warnings or errors) terrible bug in iOS.) to make it work, it seems that if we wrap the current vc inside another uiviewcontroller it will be performed well.
        HyperWindowSwitchDummyVC* dummyVC = [HyperWindowSwitchDummyVC new];
        
        // since preferredStatusBarStyle is not accessible outside the uiviewcontroller, we implemented this protocol
        UIViewController<visibleStatusBarInterface>* currentVC = (UIViewController<visibleStatusBarInterface>*)[[appDelegate window] rootViewController];
        
        [dummyVC.view addSubview:currentVC.view];
        [dummyVC addChildViewController:currentVC];
        
        dummyVC.statusBarStyle = currentVC.preferredStatusBarStyle;
        
        [[appDelegate window] setRootViewController:dummyVC];
        
        
        [dummyVC presentViewController:newVC animated:YES completion:^{
            
            //now we have to dismiss currentVC and immediately set the window.rootViewController. but it will cause a slight glitch in status bar. to avoid it, we have to create a snapshot of the presented vc as the dummyVC and set window.rootViewController = dummyVC. Now we can safely tell the currentVC to dismiss and and it's completion we set the window.rootViewController to the real newVC. Note that the dummyVC is a subclass of HyperWindowSwitchDummyVC. HyperWindowSwitchDummyVC is just a simple view controller but it immitates newVC's status bar style.
            HyperWindowSwitchDummyVC* vc = [HyperWindowSwitchDummyVC new];
            vc.statusBarHidden = [newVC prefersStatusBarHidden];
            vc.statusBarStyle = [newVC preferredStatusBarStyle];
            [vc.view addSubview:[newVC.view snapshotViewAfterScreenUpdates:YES]];
            [[appDelegate window] setRootViewController:vc];
            
            [currentVC dismissViewControllerAnimated:NO completion:^{
                [[appDelegate window] setRootViewController:newVC];
                if (completion)
                    completion();
                ;}];
        }];
    }
    else {
        HyperWindowSwitchTransitioningDelegate *transitioningDelegate = [HyperWindowSwitchTransitioningDelegate new];
        transitioningDelegate.animationMode = animationMode;
        
        newVC.transitioningDelegate = transitioningDelegate;
        newVC.modalPresentationStyle = UIModalPresentationCustom;
        
        UIViewController* currentVC = [[appDelegate window] rootViewController] ;
        
        [newVC setNeedsStatusBarAppearanceUpdate];
        [currentVC presentViewController:newVC animated:YES completion:^{
            
            //now we have to dismiss currentVC and immediately set the window.rootViewController. but it will cause a slight glitch in status bar. to avoid it, we have to create a snapshot of the presented vc as the dummyVC and set window.rootViewController = dummyVC. Now we can safely tell the currentVC to dismiss and and it's completion we set the window.rootViewController to the real newVC. Note that the dummyVC is a subclass of HyperWindowSwitchDummyVC. HyperWindowSwitchDummyVC is just a simple view controller but it immitates newVC's status bar style.
            HyperWindowSwitchDummyVC* vc = [HyperWindowSwitchDummyVC new];
            vc.statusBarHidden = [newVC prefersStatusBarHidden];
            vc.statusBarStyle = [newVC preferredStatusBarStyle];
            [vc.view addSubview:[newVC.view snapshotViewAfterScreenUpdates:YES]];
            [[appDelegate window] setRootViewController:vc];
            
            [currentVC dismissViewControllerAnimated:NO completion:^{
                [[appDelegate window] setRootViewController:newVC];
                if (completion)
                    completion();
                ;}];
        }];
    }
}

@end

