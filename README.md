# HyperWindowSwitch

[![CI Status](http://img.shields.io/travis/H.Vakilian/HyperWindowSwitch.svg?style=flat)](https://travis-ci.org/H.Vakilian/HyperWindowSwitch)
[![Version](https://img.shields.io/cocoapods/v/HyperWindowSwitch.svg?style=flat)](http://cocoapods.org/pods/HyperWindowSwitch)
[![License](https://img.shields.io/cocoapods/l/HyperWindowSwitch.svg?style=flat)](http://cocoapods.org/pods/HyperWindowSwitch)
[![Platform](https://img.shields.io/cocoapods/p/HyperWindowSwitch.svg?style=flat)](http://cocoapods.org/pods/HyperWindowSwitch)

####Developers
- Hamidreza Vakilian
- Ali Mohammadi Soume’e

------

###Summary
When you have two or more viewControllers and want to switch between them, you can use this pod. In this pod you have four default and custom animation for switiching viewControllers.  


###Usage
step1: You must first set your "Main Interface" equals to null. Main Intrface  is in general tab.

step2: Then, you should add initialiezeWindowForAppDelegate in  didFinishLaunchingWithOptions function of AppDelegate.

    - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
    {       
    	[HyperWindowSwitch initializeWindowForAppDelegate:self];
        return YES;
    }

step3: Add setRootViewController in didFinishLaunchingWithOptions function of AppDelegate after initializeWindowForAppDelegate and set a new viewController for it.

    - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
    {   
    	[HyperWindowSwitch initializeWindowForAppDelegate:self];
    	
    	UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    	UIViewController *firstViewController = [storyboard instantiateViewControllerWithIdentifier:@“FirstViewController”];
    	
    	[HyperWindowSwitch setRootViewController:home];
        return YES;
    }


For switching and replacing present viewController with another viewController you can use this order:

    [HyperWindowSwitch switchToViewController:logoutVC animationMode:HyperWindowSwitchAnimationModeFromBottom completion:^{
            
        }];

For transition exist four animation:

-HyperWindowSwitchAnimationModeNone    
-HyperWindowSwitchAnimationModeFromBottom     
-HyperWindowSwitchAnimationModeFromBottomWithCollision    
-HyperWindowSwitchAnimationModeFade    
-HyperWindowSwitchAnimationModeTransitioningDele     gate

that you can choose your animation in animationMode parameter of switchToViewController function

When you choose HyperWindowSwitchAnimationModeTransitioningDele     gate can set your custom animation for your viewController then replace it with present viewController


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
