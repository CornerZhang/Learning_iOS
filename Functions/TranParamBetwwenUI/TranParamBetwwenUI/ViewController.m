//
//  ViewController.m
//  TranParamBetwwenUI
//
//  Created by CornerZhang on 14-9-30.
//  Copyright (c) 2014年 NeXtreme.com. All rights reserved.
//

#import "ViewController.h"
#import "ParamTableViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize nameTextField;
@synthesize passwordTextField;
@synthesize beRemember;
@synthesize ageNumber;
@synthesize tapExportButton;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setParam:(NSDictionary *)param {
    _param = param;

    [self loadParam];
}

- (void)saveParam {
    NSDictionary* param = @{
                            @"name": nameTextField.text,
                            @"password": passwordTextField.text,
                            @"remember": @(beRemember.on),
                            @"age": @(ageNumber.value)
                            };
    _param = param;
}

- (void)loadParam {
    nameTextField.text = [self.param objectForKey:@"name"];
    passwordTextField.text = [self.param objectForKey:@"password"];
    beRemember.on = [(NSNumber*)[self.param objectForKey:@"remember"] boolValue];
    ageNumber.value = [(NSNumber*)[self.param objectForKey:@"age"] integerValue];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    [self saveParam];

	ParamTableViewController* paramController = [segue destinationViewController];
    paramController.param = self.param;
}

@end
