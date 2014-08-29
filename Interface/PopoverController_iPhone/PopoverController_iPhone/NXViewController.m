//
//  NXViewController.m
//  PopoverController_iPhone
//
//  Created by CornerZhang on 14-8-29.
//  Copyright (c) 2014年 NeXtreme.com. All rights reserved.
//

#import "NXViewController.h"
#import "UIPopoverController_iPhone.h"

@interface NXViewController ()
@property (strong, nonatomic) UIPopoverController* poc;

@end

@implementation NXViewController

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

- (IBAction)moreItemTap:(UIBarButtonItem *)sender {
    UITableViewController *detailController = [self.storyboard instantiateViewControllerWithIdentifier:@"MorePopover"];
    //hanlde tableview delegate in this class
    //detailController.tableView.delegate = self;
    
    UIPopoverController *popoverController = nil;
    popoverController = [[UIPopoverController alloc] initWithContentViewController:detailController];
    //popoverController.delegate = self;
    popoverController.popoverContentSize = CGSizeMake(140, 88);
    [popoverController presentPopoverFromBarButtonItem:sender permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
    self.poc = popoverController;
}
@end
