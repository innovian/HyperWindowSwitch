//
//  HyperWindowSwitchTransitioningPresentation.m
//  Pods
//
//  Created by Ali Soume`e on 8/19/1395 AP.
//
//

#import "HyperWindowSwitchTransitioningPresentation.h"

@interface HyperWindowSwitchTransitioningPresentation() <UIDynamicAnimatorDelegate>
@property (nonatomic) UIDynamicAnimator *animator;
@property (nonatomic) id transitionContext;
@end

@implementation HyperWindowSwitchTransitioningPresentation

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return .65;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    _transitionContext = transitionContext;
    NSTimeInterval animationDuration = [self transitionDuration:transitionContext];
    UIView *containerView = [_transitionContext containerView];
//    UIViewController *fromViewController = [_transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [_transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    [containerView addSubview:toViewController.view];
    
    if(_animationMode == HyperWindowSwitchAnimationModeFade){
        toViewController.view.alpha = 0;
        [UIView animateWithDuration:animationDuration animations:^{
            toViewController.view.alpha = 1;
        } completion:^(BOOL finished) {
            [_transitionContext completeTransition:finished];
        }];
    }
    else if(_animationMode == HyperWindowSwitchAnimationModeFromBottom) {
        toViewController.view.frame = CGRectMake(0,
                                                 containerView.frame.size.height,
                                                 containerView.frame.size.width,
                                                 containerView.frame.size.height);
        
        [UIView animateWithDuration:animationDuration animations:^{
            toViewController.view.frame = CGRectMake(0,
                                                     0,
                                                     containerView.frame.size.width,
                                                     containerView.frame.size.height);
        } completion:^(BOOL finished) {
            [_transitionContext completeTransition:finished];
        }];
    }
    else if(_animationMode == HyperWindowSwitchAnimationModeFromBottomWithCollision) {
        
        toViewController.view.frame = CGRectMake(0,
                                                 containerView.frame.size.height,
                                                 containerView.frame.size.width,
                                                 containerView.frame.size.height);
        
        _animator = [[UIDynamicAnimator alloc]initWithReferenceView:containerView];
        _animator.delegate = self;
        UIGravityBehavior* gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[toViewController.view]];
        gravityBehavior.gravityDirection = CGVectorMake(0, -1);
        gravityBehavior.magnitude = 4;
        [_animator addBehavior:gravityBehavior];
        
        
        UICollisionBehavior* collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[toViewController.view]];
        [collisionBehavior addBoundaryWithIdentifier:@"topWall" fromPoint:CGPointMake(0, -2) toPoint:CGPointMake(containerView.bounds.size.width, -2)];
        [_animator addBehavior:collisionBehavior];
        
        UIDynamicItemBehavior *elasticityBehavior = [[UIDynamicItemBehavior alloc] initWithItems:@[toViewController.view]];
        elasticityBehavior.elasticity = 0.3f;
        [_animator addBehavior:elasticityBehavior];
    }
    
    
}


-(void)dynamicAnimatorDidPause:(UIDynamicAnimator *)animator
{
    [_animator removeAllBehaviors];
    _animator = nil;
    [_transitionContext completeTransition:true];
}


@end
