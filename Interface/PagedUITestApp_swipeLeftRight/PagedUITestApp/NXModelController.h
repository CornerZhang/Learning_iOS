#import <UIKit/UIKit.h>

@class NXContentViewController;

@interface NXPageRecord: NSObject
@property (nonatomic) id pageView;
@property BOOL used;

- (instancetype)init;

@end

@interface NXModelController : NSObject <UIPageViewControllerDataSource>
@property (readonly, strong, nonatomic) NSArray * monthNames;
@property (strong, nonatomic) NSMutableArray* contentPageViews;

- (instancetype)init;

- (NXContentViewController *)viewControllerAtIndex:(NSUInteger)index
                                     storyboard:(UIStoryboard *)storyboard;

- (NSUInteger)indexOfViewController:(NXContentViewController *)viewController;

@end
