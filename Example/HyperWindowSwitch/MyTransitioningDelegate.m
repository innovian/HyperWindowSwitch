//
//  MyTransitioningDelegate.m
//  HyperWindowSwitch
//
//  Created by Ali Soume`e on 8/13/1395 AP.
//  Copyright © 1395 Ali-Soume. All rights reserved.
//

#import "MyTransitioningDelegate.h"
#import "MyTransitioningPresentation.h"

@implementation MyTransitioningDelegate

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    MyTransitioningPresentation *presentationAnimator = [MyTransitioningPresentation new];
    presentationAnimator.isPresenting = YES;
    return presentationAnimator;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    MyTransitioningPresentation *presentationAnimator = [MyTransitioningPresentation new];
    presentationAnimator.isPresenting = NO;
    return presentationAnimator;
}

@end
