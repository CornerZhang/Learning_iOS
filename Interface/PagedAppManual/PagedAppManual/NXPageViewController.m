//
//  NXPageViewController.m
//  PagedAppManual
//
//  Created by CornerZhang on 14-7-8.
//  Copyright (c) 2014年 NeXtreme.com. All rights reserved.
//

#import "NXPageViewController.h"
#import "NXModelController.h"
#import "NXContentViewController.h"

@interface NXPageViewController ()

@end

@implementation NXPageViewController
@synthesize modelController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    modelController = [[NXModelController alloc] init];

    
    // 给pageViewController设置delegate
    self.delegate = self;
    
    NXContentViewController *startingViewController = [self.modelController viewControllerAtIndex:0 storyboard:self.storyboard];
    NSArray *viewControllers = @[startingViewController];
    [self setViewControllers:viewControllers
                                      direction:UIPageViewControllerNavigationDirectionForward
                                       animated:NO
                                     completion:nil];
    // 给pageViewController设置dataSource
    self.dataSource = self.modelController;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIPageViewController delegate methods

// 叶间切换时调用
- (void)pageViewController:(UIPageViewController *)pageViewController
        didFinishAnimating:(BOOL)finished
   previousViewControllers:(NSArray *)previousViewControllers
       transitionCompleted:(BOOL)completed
{
    NSLog(@"didFinishAnimating -- %@",NSStringFromSelector(_cmd));
    
}

//  纵横切换时调用
- (UIPageViewControllerSpineLocation)pageViewController:(UIPageViewController *)pageViewController
                   spineLocationForInterfaceOrientation:(UIInterfaceOrientation)orientation
{
    // Set the spine position to "min" and the page view controller's view controllers array to contain just one view controller. Setting the spine position to 'UIPageViewControllerSpineLocationMid' in landscape orientation sets the doubleSided property to YES, so set it to NO here.
    UIViewController *currentViewController = self.viewControllers[0];
    NSArray *viewControllers = @[currentViewController];
    [self setViewControllers:viewControllers
                                      direction:UIPageViewControllerNavigationDirectionForward
                                       animated:YES
                                     completion:nil];
    
    NSLog(@"spineLocationForInterfaceOrientation -- %@",NSStringFromSelector(_cmd));
    
    self.doubleSided = NO;
    return UIPageViewControllerSpineLocationMin;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
