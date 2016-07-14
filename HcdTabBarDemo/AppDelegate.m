//
//  AppDelegate.m
//  HcdTabBarDemo
//
//  Created by polesapp-hcd on 16/7/14.
//  Copyright © 2016年 Polesapp. All rights reserved.
//

#import "HcdTabBar.h"
#import "LLHomeViewController.h"
#import "LLSameCityViewController.h"
#import "LLMessageViewController.h"
#import "LLMineViewController.h"

#import "AppDelegate.h"

@interface AppDelegate ()<HcdTabBarDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    LLHomeViewController *homeViewController = [[LLHomeViewController alloc] init];
    LLSameCityViewController *sameCityViewController = [[LLSameCityViewController alloc] init];
    LLMessageViewController *messageViewController = [[LLMessageViewController alloc] init];
    LLMineViewController *mineViewController = [[LLMineViewController alloc] init];
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.viewControllers = @[homeViewController, sameCityViewController, messageViewController, mineViewController];
    
    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc] init]];
    [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
    
    HcdTabBar *tabBar = [[HcdTabBar alloc] initWithFrame:tabBarController.tabBar.bounds];
    tabBar.tabBarItemAttributes = @[@{kHcdTabBarItemAttributeTitle : @"首页", kHcdTabBarItemAttributeNormalImageName : @"home_normal", kHcdTabBarItemAttributeSelectedImageName : @"home_highlight", kHcdTabBarItemAttributeType : @(HcdTabBarItemNormal)},
                                                                        @{kHcdTabBarItemAttributeTitle : @"同城", kHcdTabBarItemAttributeNormalImageName : @"mycity_normal", kHcdTabBarItemAttributeSelectedImageName : @"mycity_highlight", kHcdTabBarItemAttributeType : @(HcdTabBarItemNormal)},
                                                                        @{kHcdTabBarItemAttributeTitle : @"消息", kHcdTabBarItemAttributeNormalImageName : @"message_normal", kHcdTabBarItemAttributeSelectedImageName : @"message_highlight", kHcdTabBarItemAttributeType : @(HcdTabBarItemNormal)},
                                    @{kHcdTabBarItemAttributeTitle : @"发布", kHcdTabBarItemAttributeNormalImageName : @"account_normal", kHcdTabBarItemAttributeSelectedImageName : @"account_highlight", kHcdTabBarItemAttributeType : @(HcdTabBarItemNormal)},
                                    @{kHcdTabBarItemAttributeTitle : @"我的", kHcdTabBarItemAttributeNormalImageName : @"account_normal", kHcdTabBarItemAttributeSelectedImageName : @"account_highlight", kHcdTabBarItemAttributeType : @(HcdTabBarItemRise)}];
    tabBar.delegate = self;
    [tabBarController.tabBar addSubview:tabBar];
    
    self.window.rootViewController = tabBarController;
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)tabBarDidSelectedRiseButton {
    NSLog(@"Hello");
}

@end
