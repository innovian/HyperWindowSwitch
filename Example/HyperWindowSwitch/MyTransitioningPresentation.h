//
//  MyTransitioningPresentation.h
//  HyperWindowSwitch
//
//  Created by Ali Soume`e on 8/13/1395 AP.
//  Copyright © 1395 Ali-Soume. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MyTransitioningDelegate.h"

@interface MyTransitioningPresentation : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic) BOOL isPresenting;
@property (nonatomic)transitionMode transitionMode;
-(instancetype)initWithTransitionMode:(transitionMode*) transitionMode;

@end
