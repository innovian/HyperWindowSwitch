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

-(instancetype)initWithTransitionMode:(transitionMode) transitnioMode{
    self = [super init];
    if (self)
    {
        _transitionMode = transitnioMode;
    }
    return self;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    MyTransitioningPresentation *presentationAnimator = [[MyTransitioningPresentation alloc] initWithTransitionMode: _transitionMode];
    presentationAnimator.isPresenting = YES;
    return presentationAnimator;
}

@end
