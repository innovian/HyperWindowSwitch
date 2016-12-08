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


@interface HomeFirstViewController () <UITextFieldDelegate>
{
	MyTransitioningDelegate* transitioningDelegate;
    __weak IBOutlet UIButton *loginButton;
    __weak IBOutlet UITextField *usernameTA;
    __weak IBOutlet UITextField *passwordTA;
    __weak IBOutlet UIView *contentView;
}
@end


@implementation HomeFirstViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:true];
    
	// Do any additional setup after loading the view, typically from a nib.
    loginButton.layer.cornerRadius = 5;
    loginButton.layer.borderColor = [UIColor blackColor].CGColor;
    loginButton.layer.borderWidth = 1.0;
    
    usernameTA.layer.borderColor = [UIColor blackColor].CGColor;
    usernameTA.layer.borderWidth = 1.0;
    [usernameTA setReturnKeyType:UIReturnKeyDone];
    usernameTA.delegate = self;
    
    passwordTA.layer.borderColor = [UIColor blackColor].CGColor;
    passwordTA.layer.borderWidth = 1.0;
    [passwordTA setReturnKeyType:UIReturnKeyDone];
    passwordTA.delegate = self;
    
    contentView.layer.borderColor = [UIColor blackColor].CGColor;
    contentView.layer.borderWidth = 1.0;
    contentView.layer.cornerRadius = 5;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}


- (IBAction)loginButtonTouch:(id)sender {
    
    //Go to LoginViewController with custom animation.
	UIStoryboard* mainStroyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
	UIViewController* loginVC = [mainStroyboard instantiateViewControllerWithIdentifier:@"LoginNavigationController"];
	
    transitioningDelegate = [[MyTransitioningDelegate alloc] initWithTransitionMode: animationModeFade];
	loginVC.transitioningDelegate = transitioningDelegate;
	loginVC.modalPresentationStyle = UIModalPresentationCustom;
    
    [HyperWindowSwitch switchToViewController:loginVC animationMode:HyperWindowSwitchAnimationModeTransitioningDelegate completion:^{
    }];
}

@end
