//
//  ExampleViewController.m
//  HyperWindowSwitch
//
//  Created by H.Vakilian on 11/03/2016.
//  Copyright (c) 2016 H.Vakilian. All rights reserved.
//

#import "HomeFirstViewController.h"
#import "HyperWindowSwitch.h"
#import "MyTransitioningDelegate.h"


@interface HomeFirstViewController ()
{
	MyTransitioningDelegate* transitioningDelegate;
}
@end

@implementation HomeFirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)logoutButtonTouch:(id)sender {
	UIStoryboard* mainStroyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
	UIViewController* loginVC = [mainStroyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
	
	transitioningDelegate = [MyTransitioningDelegate new];
	loginVC.transitioningDelegate = transitioningDelegate;
	loginVC.modalPresentationStyle = UIModalPresentationCustom;
	
	[HyperWindowSwitch switchToViewController:loginVC animationMode:HyperWindowSwitchAnimationModeTransitioningDelegate];
	
}

@end
