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
		UIViewController* currentVC = [[appDelegate window] rootViewController] ;
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
    else {
        HyperWindowSwitchTransitioningDelegate *transitioningDelegate = [HyperWindowSwitchTransitioningDelegate new];
        transitioningDelegate.animationMode = animationMode;

        newVC.transitioningDelegate = transitioningDelegate;
        newVC.modalPresentationStyle = UIModalPresentationCustom;

        UIViewController* currentVC = [[appDelegate window] rootViewController] ;
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
