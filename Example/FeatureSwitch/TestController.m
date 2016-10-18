//
//  TestController.m
//  FeatureSwitch
//
//  Created by Ravel Antunes on 4/17/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

#import "TestController.h"
@import FeatureSwitch;

@interface TestController ()

@end

@implementation TestController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    FeatureManager *f = [[FeatureManager alloc] init];
    [f whenEnabled:@"test" run:^{
        
    }];
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
