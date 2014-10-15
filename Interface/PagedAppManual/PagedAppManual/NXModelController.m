#import "NXModelController.h"
#import "NXContentViewController.h"

@interface NXModelController ()

@end

@implementation NXModelController

- (instancetype)init
{
    self = [super init];
    if (self) {
        // Create the data model.
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        _monthNames = [[dateFormatter monthSymbols] copy];	// 每个月的名称存放到pageData
    }
    return self;
}

- (NXContentViewController *)viewControllerAtIndex:(NSUInteger)index
                                        storyboard:(UIStoryboard *)storyboard {
    // Return the data view controller for the given index.
    if (([self.monthNames count] == 0) || (index >= [self.monthNames count])) {
        return nil;
    }
    
    // Create a new view controller and pass suitable data.
    NXContentViewController *contentViewController = [storyboard instantiateViewControllerWithIdentifier:@"NXContentViewController"];
    contentViewController.monthName = self.monthNames[index];
    return contentViewController;

}

- (NSUInteger)indexOfViewController:(NXContentViewController *)viewController {
    return [self.monthNames indexOfObject:viewController.monthName];

}

#pragma mark - Page View Controller Data Source

// 往前翻页
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController
      viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = [self indexOfViewController:(NXContentViewController *)viewController];
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    NSLog(@"viewControllerBeforeViewController -- %@",NSStringFromSelector(_cmd));
    
    index--;
    return [self viewControllerAtIndex:index storyboard:viewController.storyboard];
}

// 往后翻页
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController
       viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = [self indexOfViewController:(NXContentViewController *)viewController];
    if (index == NSNotFound) {
        return nil;
    }
    
    NSLog(@"viewControllerAfterViewController -- %@",NSStringFromSelector(_cmd));
    
    index++;
    if (index == [self.monthNames count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index storyboard:viewController.storyboard];
}



@end
