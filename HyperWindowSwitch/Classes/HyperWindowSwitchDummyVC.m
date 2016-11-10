//
//  HyperWindowSwitchDummyVC.m
//  Prediscore
//
//  Created by hAmidReza on 11/5/16.
//  Copyright © 2016 pxlmind. All rights reserved.
//

#import "HyperWindowSwitchDummyVC.h"

@interface HyperWindowSwitchDummyVC ()

@end

@implementation HyperWindowSwitchDummyVC


-(UIStatusBarStyle)preferredStatusBarStyle
{
	return _statusBarStyle;
}

-(BOOL)prefersStatusBarHidden
{
	return _statusBarHidden;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
