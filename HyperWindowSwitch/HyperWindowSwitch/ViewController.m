//
//  ViewController.m
//  HyperWindowSwitch
//
//  Created by Ali Soume`e on 8/13/1395 AP.
//  Copyright © 1395 Ali-Soume. All rights reserved.
//

#import "ViewController.h"
#import "NewViewController.h"
#import "HyperWindowSwitch.h"
#import "MyTransitioningDelegate.h"

@interface ViewController ()
{
    MyTransitioningDelegate* transitioningDelegate;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





- (IBAction)goToNewViewController:(id)sender {
    

    UIStoryboard *storyboard =[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    UIViewController *newVC = [storyboard instantiateViewControllerWithIdentifier:@"NewViewController"];
    
    transitioningDelegate = [MyTransitioningDelegate new];

    newVC.transitioningDelegate = transitioningDelegate;
    newVC.modalPresentationStyle = UIModalPresentationCustom;
    
    [HyperWindowSwitch switchToViewController:newVC animationMode:HyperWindowSwitchAnimationModeTransitioningDelegate];
}

@end
