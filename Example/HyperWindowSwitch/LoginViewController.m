//
//  LoginViewController.m
//  HyperWindowSwitch
//
//  Created by hAmidReza on 11/3/16.
//  Copyright © 2016 H.Vakilian. All rights reserved.
//

#import "LoginViewController.h"
#import "HyperWindowSwitch.h"
#import "MyTransitioningDelegate.h"


@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UIButton *collisionButton;
@property (weak, nonatomic) IBOutlet UIButton *fadeButton;
@property (weak, nonatomic) IBOutlet UIButton *fromBottomButton;
@property (weak, nonatomic) IBOutlet UIButton *fromLeftButton;
@property (weak, nonatomic) IBOutlet UILabel *logoutLabel;
@property (weak, nonatomic) IBOutlet UIView *contentView;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _collisionButton.layer.cornerRadius = 5;
    _fromBottomButton.layer.cornerRadius = 5;
    _fadeButton.layer.cornerRadius = 5;
    _fromLeftButton.layer.cornerRadius = 5;
    _contentView.layer.cornerRadius = 5;
    _logoutLabel.layer.cornerRadius = 5;
    _logoutLabel.clipsToBounds = true;

    _collisionButton.layer.borderColor = [UIColor blackColor].CGColor;
    _fadeButton.layer.borderColor = [UIColor blackColor].CGColor;
    _fromBottomButton.layer.borderColor = [UIColor blackColor].CGColor;
    _fromLeftButton.layer.borderColor = [UIColor blackColor].CGColor;
    _contentView.layer.borderColor = [UIColor blackColor].CGColor;
    _logoutLabel.layer.borderColor = [UIColor blackColor].CGColor;
    
    _collisionButton.layer.borderWidth = 1.0;
    _fadeButton.layer.borderWidth = 1.0;
    _fromBottomButton.layer.borderWidth = 1.0;
    _fromLeftButton.layer.borderWidth = 1.0;
    _contentView.layer.borderWidth = 1.0;
    _logoutLabel.layer.borderWidth = 1.0;
    // Do any additional setup after loading the view.
}


- (IBAction)fadelogoutButtonTouch:(id)sender {
    
    //Go to HomeFirstViewController with default animation of HyperWindowSwitch.
    UIStoryboard* mainStroyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController* logoutVC = [mainStroyboard instantiateViewControllerWithIdentifier:@"LogoutNavigationController"];
    
    [HyperWindowSwitch switchToViewController:logoutVC animationMode:HyperWindowSwitchAnimationModeFade completion:^{
        
    }];
}


- (IBAction)collisionLogoutButtonTouch:(id)sender {
    
    //Go to HomeFirstViewController with default animation of HyperWindowSwitch.
    UIStoryboard* mainStroyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController* logoutVC = [mainStroyboard instantiateViewControllerWithIdentifier:@"LogoutNavigationController"];
    
    [HyperWindowSwitch switchToViewController:logoutVC animationMode:HyperWindowSwitchAnimationModeFromBottomWithCollision completion:^{
        
    }];
}


- (IBAction)fromBottomLogoutButtonTouch:(id)sender {
    
    //Go to HomeFirstViewController with default animation of HyperWindowSwitch.
    UIStoryboard* mainStroyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController* logoutVC = [mainStroyboard instantiateViewControllerWithIdentifier:@"LogoutNavigationController"];
    
    [HyperWindowSwitch switchToViewController:logoutVC animationMode:HyperWindowSwitchAnimationModeFromBottom completion:^{
        
    }];
}


- (IBAction)fromLeftLogoutbuttontouch:(id)sender {
    
    //Go to HomeFirstViewController with custom animation.
    UIStoryboard* mainStroyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController* logoutVC = [mainStroyboard instantiateViewControllerWithIdentifier:@"LogoutNavigationController"];
    
    MyTransitioningDelegate *transitionDelegate = [[MyTransitioningDelegate alloc] initWithTransitionMode:animationModeFromLeft];
    logoutVC.transitioningDelegate = transitionDelegate;
    logoutVC.modalPresentationStyle = UIModalPresentationCustom;
    
    [HyperWindowSwitch switchToViewController:logoutVC animationMode:HyperWindowSwitchAnimationModeTransitioningDelegate completion:^{
        
    }];
}

@end
