# HyperWindowSwitch

[![CI Status](http://img.shields.io/travis/H.Vakilian/HyperWindowSwitch.svg?style=flat)](https://travis-ci.org/H.Vakilian/HyperWindowSwitch)
[![Version](https://img.shields.io/cocoapods/v/HyperWindowSwitch.svg?style=flat)](http://cocoapods.org/pods/HyperWindowSwitch)
[![License](https://img.shields.io/cocoapods/l/HyperWindowSwitch.svg?style=flat)](http://cocoapods.org/pods/HyperWindowSwitch)
[![Platform](https://img.shields.io/cocoapods/p/HyperWindowSwitch.svg?style=flat)](http://cocoapods.org/pods/HyperWindowSwitch)

###### Easily Switch UIWindow’s RootviewController

####Developers
- Hamidreza Vakilian
- Ali Mohammadi Soume’e

------

###Summary
Easily switch UIWindow’s rootviewController with animations.

###Description
In some scenarios you have to change the UIWindow’s rootviewController such as when the user’s token is invalidated on the server and you have to show another viewController, e.g. a login viewController. Although you can deal with pushing or presenting the viewController but using HyperWindowSwitch brings such benefits:
> - Allows to other viewControllers to be released (which preserves memory)
> - Provides several predefined animations
> - Supports custom animation.

###Usage
1- Go to Xcode project settings, clear Main.storyboard for Main Interface field.
2- Import HyperWindowSwitch header into your AppDelegate's m file:
```
#import "HyperWindowSwitch.h"
```
3- Let's initialize HyperWindowSwitch. We will also create an instance of the viewController which we want to display at first. Add these lines to your application:didFinishLaunchingWithOptions method:
```
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	[HyperWindowSwitch initializeWindowForAppDelegate:self];
	
	//Instantiate the first viewController you want to display (you probably have to change this)
	UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
	UIViewController *home = [storyboard instantiateViewControllerWithIdentifier:@"HomeViewController"];
	
	//Tell HyperWindowSwitch to display it
	[HyperWindowSwitch setRootViewController:home];
    return YES;
}
```
Now for switching UIWindow's viewController you can call this method from anywhere. (you may have to import HyperWindowSwitch.h)
```
[HyperWindowSwitch switchToviewController:logoutVC animationMode:HyperWindowSwitchAnimationModeFromBottom completion:^{}];
```

###Supported Animations
When calling switchToviewController:animationMode:completion you can provide these values for the animationMode:
> - HyperWindowSwitchAnimationModeNone    
> - HyperWindowSwitchAnimationModeFromBottom     
> - HyperWindowSwitchAnimationModeFade    

###Custom Animations
As you know UITransitioning is used in combination with presentViewController method and it's not meant to be used when switching the rootViewController. We have worked a lot to bring UITransitioning functionality into HyperWindowSwitch. We have also implemented a nice animation:
*HyperWindowSwitchAnimationModeFromBottomWithCollision*

To implement your custom animations, use UITransitioningDelegate as before. Then just pass *HyperWindowSwitchAnimationModeTransitioningDelegate* animationMode for HyperWindowSwitch. 
Example:
```
    //Go to LoginViewController with custom animation.
	UIStoryboard* mainStroyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
	UIViewController* loginVC = [mainStroyboard instantiateViewControllerWithIdentifier:@"LoginNavigationController"];
	
    transitioningDelegate = [[MyTransitioningDelegate alloc] initWithTransitionMode: animationModeFade];
	loginVC.transitioningDelegate = transitioningDelegate;
	loginVC.modalPresentationStyle = UIModalPresentationCustom;
    
    [HyperWindowSwitch switchToViewController:loginVC animationMode:HyperWindowSwitchAnimationModeTransitioningDelegate completion:^{
    }];
```


## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

HyperWindowSwitch is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "HyperWindowSwitch"
```

## Author

[Innovian](http://innovian.com)

## License

HyperWindowSwitch is available under the MIT license. See the LICENSE file for more info.
