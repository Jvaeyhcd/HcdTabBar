//
//  HcdTabBar.h
//  HcdTabBarDemo
//
//  Created by polesapp-hcd on 16/7/14.
//  Copyright © 2016年 Polesapp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HcdTabBarItem.h"

@protocol HcdTabBarDelegate <NSObject>

- (void)tabBarDidSelectedRiseButton;

@end

@interface HcdTabBar : UIView

- (instancetype) initWithFrame:(CGRect)frame topLineImage:(UIImage *)topLineImage;

@property (nonatomic, copy) NSArray<NSDictionary *> *tabBarItemAttributes;
@property (nonatomic, weak) id<HcdTabBarDelegate> delegate;

@end
