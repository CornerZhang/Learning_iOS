#import <UIKit/UIKit.h>

@class NXContentViewController;

@interface NXModelController : NSObject <UIPageViewControllerDataSource>
@property (readonly, strong, nonatomic) NSArray * monthNames;

- (instancetype)init;

- (NXContentViewController *)viewControllerAtIndex:(NSUInteger)index
                                     storyboard:(UIStoryboard *)storyboard;

- (NSUInteger)indexOfViewController:(NXContentViewController *)viewController;

@end
