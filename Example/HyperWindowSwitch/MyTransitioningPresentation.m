//
//  MyTransitioningPresentation.m
//  HyperWindowSwitch
//
//  Created by Ali Soume`e on 8/13/1395 AP.
//  Copyright © 1395 Ali-Soume. All rights reserved.
//

#import "MyTransitioningPresentation.h"

@implementation MyTransitioningPresentation

-(instancetype)initWithTransitionMode:(transitionMode) transitionMode{
    self = [super init];
    if(self){
        _transitionMode = transitionMode;
    }
    return self;
}



-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return .65;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    NSTimeInterval animationDuration = [self transitionDuration:transitionContext];
    UIView *containerView = [transitionContext containerView];
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    [containerView addSubview:toViewController.view];

    
    //------------------— GET TO & FROM VCS —------------------//
    if(_transitionMode == animationModeFade){
        toViewController.view.alpha = 0;
        [UIView animateWithDuration:animationDuration animations:^{
            toViewController.view.alpha = 1;
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:finished];
        }];
    }
    else if(_transitionMode == animationModeFromLeft){
        toViewController.view.frame = CGRectMake(-containerView.frame.size.width,
                                                 0,
                                                 containerView.frame.size.width,
                                                 containerView.frame.size.height);
        
        [UIView animateWithDuration:animationDuration animations:^{
            toViewController.view.frame = CGRectMake(0,
                                                     0,
                                                     containerView.frame.size.width,
                                                     containerView.frame.size.height);
            fromViewController.view.frame = CGRectMake(containerView.frame.size.width / 2,
                                                       0,
                                                       containerView.frame.size.width,
                                                       containerView.frame.size.height);
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:finished];
        }];
        
    }
}

@end
