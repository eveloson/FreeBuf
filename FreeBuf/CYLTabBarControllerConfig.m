//
//  CYLTabBarControllerConfig.m
//  CYLTabBarController
//
//  v1.10.0 Created by 微博@iOS程序犭袁 ( http://weibo.com/luohanchenyilong/ ) on 10/20/15.
//  Copyright © 2015 https://github.com/ChenYilong . All rights reserved.
//
#import "CYLTabBarControllerConfig.h"



@implementation CYLBaseNavigationController

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

@end

#define kIndexViewControllerTitle @"首页"
#define kPersonBusinessViewControllerTitle @"分类"
#define kInfoViewControllerTitle @"文库"
#define kAssistantViewControllerTitle @"专栏"
#define kPersonCenterViewControllerTitle @"个人"
//View Controllers
#import "IndexViewController.h"
#import "CategoryReadViewController.h"
#import "InfoViewController.h"
#import "AssistantViewController.h"
#import "PersonCenterViewController.h"

@interface CYLTabBarControllerConfig ()<UITabBarControllerDelegate>

@property (nonatomic, readwrite, strong) CYLTabBarController *tabBarController;
@end

@implementation CYLTabBarControllerConfig
/**
 *  lazy load tabBarController
 *
 *  @return CYLTabBarController
 */
- (CYLTabBarController *)tabBarController {
    if (_tabBarController == nil) {
        CYLTabBarController *tabBarController = [CYLTabBarController tabBarControllerWithViewControllers:self.viewControllers
                          tabBarItemsAttributes:self.tabBarItemsAttributesForController
                                                 ];
        
        [self customizeTabBarAppearance:tabBarController];
        _tabBarController = tabBarController;
    }
    return _tabBarController;
}
- (NSArray *)viewControllers {
    IndexViewController *firstViewController = [[IndexViewController alloc] init];
    firstViewController.title = kIndexViewControllerTitle;
    UIViewController *firstNavigationController = [[CYLBaseNavigationController alloc]
                                                   initWithRootViewController:firstViewController];
    
    CategoryReadViewController *secondViewController = [CategoryReadViewController new];
    secondViewController.title = kPersonBusinessViewControllerTitle;
    UIViewController *secondNavigationController = [[CYLBaseNavigationController alloc]
                                                    initWithRootViewController:secondViewController];
    
    InfoViewController *thirdViewController = [[InfoViewController alloc] init];
    thirdViewController.title = kInfoViewControllerTitle;
    UIViewController *thirdNavigationController = [[CYLBaseNavigationController alloc]
                                                   initWithRootViewController:thirdViewController];
    
    AssistantViewController *fourthViewController = [AssistantViewController new];
    fourthViewController.title = kAssistantViewControllerTitle;
    UIViewController *fourthNavigationController = [[CYLBaseNavigationController alloc]
                                                    initWithRootViewController:fourthViewController];
    
    PersonCenterViewController *fiveViewController = [[PersonCenterViewController alloc] init];
    fiveViewController.title = kPersonCenterViewControllerTitle;
    UIViewController *fiveNavigationController = [[CYLBaseNavigationController alloc]
                                                    initWithRootViewController:fiveViewController];
  
    NSArray *viewControllers = @[
                                 firstNavigationController,
                                 secondNavigationController,
                                 thirdNavigationController,
                                 fourthNavigationController,
                                 fiveNavigationController,
                                 ];
    return viewControllers;
}

- (NSArray *)tabBarItemsAttributesForController {
    NSDictionary *firstTabBarItemsAttributes = @{
                                                 CYLTabBarItemTitle : kIndexViewControllerTitle,
                                                 CYLTabBarItemImage : @"1-1",  /* NSString and UIImage are supported*/
                                                 CYLTabBarItemSelectedImage : @"1-2", /* NSString and UIImage are supported*/
                                                 };
    NSDictionary *secondTabBarItemsAttributes = @{
                                                  CYLTabBarItemTitle : kPersonBusinessViewControllerTitle,
                                                  CYLTabBarItemImage : @"2-1",
                                                  CYLTabBarItemSelectedImage : @"2-2",
                                                  };
    NSDictionary *thirdTabBarItemsAttributes = @{
                                                 CYLTabBarItemTitle : kInfoViewControllerTitle,
                                                 CYLTabBarItemImage : @"3-1",
                                                 CYLTabBarItemSelectedImage : @"3-2",
                                                 };
    NSDictionary *fourthTabBarItemsAttributes = @{
                                                  CYLTabBarItemTitle : kAssistantViewControllerTitle,
                                                  CYLTabBarItemImage : @"4-1",
                                                  CYLTabBarItemSelectedImage : @"4-2"
                                                  };
    NSDictionary *fiveTabBarItemsAttributes = @{
                                                  CYLTabBarItemTitle : kPersonCenterViewControllerTitle,
                                                  CYLTabBarItemImage : @"5-1",
                                                  CYLTabBarItemSelectedImage : @"5-2"
                                                  };
    NSArray *tabBarItemsAttributes = @[
                                       firstTabBarItemsAttributes,
                                       secondTabBarItemsAttributes,
                                       thirdTabBarItemsAttributes,
                                       fourthTabBarItemsAttributes,
                                       fiveTabBarItemsAttributes,
                                       ];
    return tabBarItemsAttributes;
}

/**
 *  更多TabBar自定义设置：比如：tabBarItem 的选中和不选中文字和背景图片属性、tabbar 背景图片属性等等
 */
- (void)customizeTabBarAppearance:(CYLTabBarController *)tabBarController {
    // Customize UITabBar height
    // 自定义 TabBar 高度
     tabBarController.tabBarHeight = 54.f;
    UIFont *titleFont = [UIFont systemFontOfSize:12];
    // set the text color for unselected state
    // 普通状态下的文字属性
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    normalAttrs[NSFontAttributeName] = titleFont;
    
    // set the text color for selected state
    // 选中状态下的文字属性
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = ThemeColor;
    selectedAttrs[NSFontAttributeName] = titleFont;
    
    // set the text Attributes
    // 设置文字属性
    UITabBarItem *tabBar = [UITabBarItem appearance];
    [tabBar setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [tabBar setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
    // Set the dark color to selected tab (the dimmed background)
    // TabBarItem选中后的背景颜色
    // [self customizeTabBarSelectionIndicatorImage];
    
    // update TabBar when TabBarItem width did update
    // If your app need support UIDeviceOrientationLandscapeLeft or UIDeviceOrientationLandscapeRight，
    // remove the comment '//'
    // 如果你的App需要支持横竖屏，请使用该方法移除注释 '//'
    // [self updateTabBarCustomizationWhenTabBarItemWidthDidUpdate];
    
    // set the bar shadow image
    // This shadow image attribute is ignored if the tab bar does not also have a custom background image.So at least set somthing.
    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc] init]];
    [[UITabBar appearance] setBackgroundColor:[UIColor whiteColor]];
    [[UITabBar appearance] setShadowImage:[UIImage imageNamed:@"tapbar_top_line"]];
    
    // set the bar background image
    // 设置背景图片
//     UITabBar *tabBarAppearance = [UITabBar appearance];
//     [tabBarAppearance setBackgroundImage:[UIImage imageNamed:@"tab_bar"]];
    
    // remove the bar system shadow image
    // 去除 TabBar 自带的顶部阴影
    // [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
}

- (void)updateTabBarCustomizationWhenTabBarItemWidthDidUpdate {
    void (^deviceOrientationDidChangeBlock)(NSNotification *) = ^(NSNotification *notification) {
        UIDeviceOrientation orientation = [[UIDevice currentDevice] orientation];
        if ((orientation == UIDeviceOrientationLandscapeLeft) || (orientation == UIDeviceOrientationLandscapeRight)) {
            NSLog(@"Landscape Left or Right !");
        } else if (orientation == UIDeviceOrientationPortrait) {
            NSLog(@"Landscape portrait!");
        }
        [self customizeTabBarSelectionIndicatorImage];
    };
    [[NSNotificationCenter defaultCenter] addObserverForName:CYLTabBarItemWidthDidChangeNotification
                                                      object:nil
                                                       queue:[NSOperationQueue mainQueue]
                                                  usingBlock:deviceOrientationDidChangeBlock];
}

- (void)customizeTabBarSelectionIndicatorImage {
    ///Get initialized TabBar Height if exists, otherwise get Default TabBar Height.
    UITabBarController *tabBarController = [self cyl_tabBarController] ?: [[UITabBarController alloc] init];
    CGFloat tabBarHeight = tabBarController.tabBar.frame.size.height;
    CGSize selectionIndicatorImageSize = CGSizeMake(CYLTabBarItemWidth, tabBarHeight);
    //Get initialized TabBar if exists.
    UITabBar *tabBar = [self cyl_tabBarController].tabBar ?: [UITabBar appearance];
    [tabBar setSelectionIndicatorImage:
     [[self class] imageWithColor:[UIColor redColor]
                             size:selectionIndicatorImageSize]];
}

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    if (!color || size.width <= 0 || size.height <= 0) return nil;
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width + 1, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}



@end
