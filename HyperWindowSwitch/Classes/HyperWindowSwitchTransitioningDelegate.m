//
//  HyperWindowSwitchTransitioningDelegate.m
//  Pods
//
//  Created by Ali Soume`e on 8/19/1395 AP.
//
//

#import "HyperWindowSwitchTransitioningDelegate.h"
#import "HyperWindowSwitchTransitioningPresentation.h"

@implementation HyperWindowSwitchTransitioningDelegate


- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    HyperWindowSwitchTransitioningPresentation *presentationAnimator = [HyperWindowSwitchTransitioningPresentation new];
    [presentationAnimator setAnimationMode:self.animationMode];
    return presentationAnimator;
}


@end
