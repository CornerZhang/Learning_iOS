#import "NXModelController.h"
#import "NXContentViewController.h"

@implementation NXPageRecord
@synthesize pageView;
@synthesize used;
- (instancetype)init {
    self = [super init];
    if (self) {
        pageView = nil;
        used = NO;
    }
    return self;
}

@end


@implementation NXModelController

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        _monthNames = [[dateFormatter monthSymbols] copy];	// 每个月的名称存放到pageData
        NSLog(@"month count %d", [_monthNames count]);
        
        _contentPageViews = [[NSMutableArray alloc] init];
        for (int i=0; i<_monthNames.count; ++i) {
            const NXPageRecord* pageRecord = [[NXPageRecord alloc] init];
            [_contentPageViews addObject:pageRecord];
        }
        NSLog(@"pages count %d", [_contentPageViews count]);
    }
    
    return self;
}

- (NXContentViewController *)viewControllerAtIndex:(NSUInteger)index
                                        storyboard:(UIStoryboard *)storyboard {
    if (([self.monthNames count] == 0) || (index >= [self.monthNames count])) {
        return nil;	// 超出了第一页，或允许的页数时，没有相应的页
    }
    
    NXPageRecord* pageRecord = [_contentPageViews objectAtIndex:index];
    if ( pageRecord.used == NO) {
        // Create a new view controller and pass suitable data.
        NXContentViewController *contentViewController = [storyboard instantiateViewControllerWithIdentifier:@"NXContentViewController"];
        
        // 设置页名称
        contentViewController.monthName = self.monthNames[index];
        //[_contentPageViews insertObject:contentViewController atIndex:index];
        
		pageRecord.pageView = contentViewController;
        pageRecord.used = YES;
    }
    
    
    return pageRecord.pageView;

}

- (NSUInteger)indexOfViewController:(NXContentViewController *)viewController {
    NXContentViewController* found = nil;
    NSUInteger c = 0;
    for (NXPageRecord* pageRecord in _contentPageViews) {
        if (pageRecord.pageView == viewController) {
            found = viewController;
            break;
        }
        ++c;
    }
    
    return c;
}

#pragma mark - Page View Controller Data Source

// 往前翻页
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController
      viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = [self indexOfViewController:(NXContentViewController *)viewController];
    if ((index == 0) || (index == NSNotFound)) {
        return nil;	// 到了第一页,或此页不存在时
    }
    
    NSLog(@"viewControllerBeforeViewController -- %@, before",NSStringFromSelector(_cmd));
    
    index--;
    return [self viewControllerAtIndex:index storyboard:viewController.storyboard];
}

// 往后翻页
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController
       viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = [self indexOfViewController:(NXContentViewController *)viewController];
    if (index == NSNotFound) {
        return nil;	// 不存在这页时
    }
    
    
    index++;
    if (index == [self.monthNames count]) {
        return nil;	// 超出最多的页时
    }
    
    NSLog(@"viewControllerAfterViewController -- %@, after",NSStringFromSelector(_cmd));

    return [self viewControllerAtIndex:index storyboard:viewController.storyboard];
}



@end
