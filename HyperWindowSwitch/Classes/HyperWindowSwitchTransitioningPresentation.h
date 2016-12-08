//
//  HyperWindowSwitchTransitioningPresentation.h
//  Pods
//
//  Created by Ali Soume`e on 8/19/1395 AP.
//
//

#import <Foundation/Foundation.h>
#import "HyperWindowSwitch.h"

@interface HyperWindowSwitchTransitioningPresentation : NSObject <UIViewControllerAnimatedTransitioning>
@property (nonatomic) HyperWindowSwitchAnimationMode animationMode;
@end
