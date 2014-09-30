//
//  ViewController.h
//  TranParamBetwwenUI
//
//  Created by CornerZhang on 14-9-30.
//  Copyright (c) 2014年 NeXtreme.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;
@property (strong, nonatomic) IBOutlet UISwitch *beRemember;
@property (strong, nonatomic) IBOutlet UISlider *ageNumber;

@property (strong, nonatomic) IBOutlet UIButton *tapExportButton;

@property (retain, nonatomic) NSDictionary* param;

- (void)setParam:(NSDictionary *)param;

@end

