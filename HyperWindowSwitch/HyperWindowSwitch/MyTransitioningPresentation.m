//
//  MyTransitioningPresentation.m
//  HyperWindowSwitch
//
//  Created by Ali Soume`e on 8/13/1395 AP.
//  Copyright © 1395 Ali-Soume. All rights reserved.
//

#import "MyTransitioningPresentation.h"

@implementation MyTransitioningPresentation

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return .65;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    NSTimeInterval animationDuration = [self transitionDuration:transitionContext];
    UIView *containerView = [transitionContext containerView];
    
//    if (_isPresenting)
    {
        //------------------— GET TO & FROM VCS —------------------//
        UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
        UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
        [containerView addSubview:toViewController.view];
        toViewController.view.alpha = 0;
        [UIView animateWithDuration:animationDuration animations:^{
            toViewController.view.alpha = 1;
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:finished];
        }];
    }
}

@end
