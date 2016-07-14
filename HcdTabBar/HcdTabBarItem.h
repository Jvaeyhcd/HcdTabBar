//
//  HcdTabBarItem.h
//  HcdTabBarDemo
//
//  Created by polesapp-hcd on 16/7/14.
//  Copyright © 2016年 Polesapp. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  两种类型，一种冒出来的，一种没有冒出来的
 */
typedef NS_ENUM(NSUInteger, HcdTabBarItemType) {
    HcdTabBarItemNormal = 0,
    HcdTabBarItemRise,
};

extern NSString *const kHcdTabBarItemAttributeTitle;// NSString
extern NSString *const kHcdTabBarItemAttributeNormalImageName;// NSString
extern NSString *const kHcdTabBarItemAttributeSelectedImageName;// NSString
extern NSString *const kHcdTabBarItemAttributeType;// NSNumber, LLTabBarItemType

@interface HcdTabBarItem : UIButton

@property (nonatomic, assign) HcdTabBarItemType tabBarItemType;

@end
