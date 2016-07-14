//
//  HcdTabBar.m
//  HcdTabBarDemo
//
//  Created by polesapp-hcd on 16/7/14.
//  Copyright © 2016年 Polesapp. All rights reserved.
//

// 屏幕高度
#define HCD_TABBAR_SCREEN_HEIGHT         [[UIScreen mainScreen] bounds].size.height
// 屏幕宽度
#define HCD_TABBAR_SCREEN_WIDTH          [[UIScreen mainScreen] bounds].size.width

#define HcdTabbarImageSrcName(file)               [@"HcdTabBar.bundle" stringByAppendingPathComponent:file]

#import "HcdTabBar.h"

@interface HcdTabBar ()

@property (strong, nonatomic) NSMutableArray *tabBarItems;

@end

@implementation HcdTabBar

- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self config];
    }
    
    return self;
}

#pragma mark - private

- (void)config {
    self.backgroundColor = [UIColor whiteColor];
    UIImageView *topLine = [[UIImageView alloc] initWithFrame:CGRectMake(0, -5, HCD_TABBAR_SCREEN_WIDTH, 5)];
    topLine.image = [UIImage imageNamed:HcdTabbarImageSrcName(@"tapbar_top_line")];
    [self addSubview:topLine];
}

- (void)setSelectedIndex:(NSInteger)index {
    for (HcdTabBarItem *item in self.tabBarItems) {
        if (item.tag == index) {
            item.selected = YES;
        } else {
            item.selected = NO;
        }
    }
    
    UIWindow *keyWindow = [[[UIApplication sharedApplication] delegate] window];
    UITabBarController *tabBarController = (UITabBarController *)keyWindow.rootViewController;
    if (tabBarController) {
        tabBarController.selectedIndex = index;
    }
}

#pragma mark - Touch Event

- (void)itemSelected:(HcdTabBarItem *)sender {
    if (sender.tabBarItemType != HcdTabBarItemRise) {
        [self setSelectedIndex:sender.tag];
    } else {
        if (self.delegate) {
            if ([self.delegate respondsToSelector:@selector(tabBarDidSelectedRiseButton)]) {
                [self.delegate tabBarDidSelectedRiseButton];
            }
        }
    }
}

#pragma mark - Setter

- (void)setTabBarItemAttributes:(NSArray<NSDictionary *> *)tabBarItemAttributes {
    _tabBarItemAttributes = tabBarItemAttributes.copy;
    
    NSAssert(_tabBarItemAttributes.count > 2, @"TabBar item count must greet than two.");
    
    CGFloat normalItemWidth = (HCD_TABBAR_SCREEN_WIDTH * 3 / 4) / (_tabBarItemAttributes.count - 1);
    CGFloat tabBarHeight = CGRectGetHeight(self.frame);
    CGFloat publishItemWidth = (HCD_TABBAR_SCREEN_WIDTH / 4);
    
    NSInteger itemTag = 0;
    BOOL passedRiseItem = NO;
    
    _tabBarItems = [NSMutableArray arrayWithCapacity:_tabBarItemAttributes.count];
    
    for (id item in _tabBarItemAttributes) {
        if ([item isKindOfClass:[NSDictionary class]]) {
            NSDictionary *itemDict = (NSDictionary *)item;
            
            HcdTabBarItemType type = [itemDict[kHcdTabBarItemAttributeType] integerValue];
            
            CGRect frame = CGRectMake(itemTag * normalItemWidth + (passedRiseItem ? publishItemWidth : 0), 0, type == HcdTabBarItemRise ? publishItemWidth : normalItemWidth, tabBarHeight);
            
            HcdTabBarItem *tabBarItem = [self tabBarItemWithFrame:frame
                                                            title:itemDict[kHcdTabBarItemAttributeTitle]
                                                  normalImageName:itemDict[kHcdTabBarItemAttributeNormalImageName]
                                                selectedImageName:itemDict[kHcdTabBarItemAttributeSelectedImageName]
                                                   tabBarItemType:type];
            if (itemTag == 0) {
                tabBarItem.selected = YES;
            }
            
            [tabBarItem addTarget:self action:@selector(itemSelected:) forControlEvents:UIControlEventTouchUpInside];
            
            if (tabBarItem.tabBarItemType != HcdTabBarItemRise) {
                tabBarItem.tag = itemTag;
                itemTag++;
            } else {
                passedRiseItem = YES;
            }
            
            [_tabBarItems addObject:tabBarItem];
            [self addSubview:tabBarItem];
        }
    }
}

- (HcdTabBarItem *)tabBarItemWithFrame:(CGRect)frame
                                 title:(NSString *)title
                       normalImageName:(NSString *)normalImageName
                     selectedImageName:(NSString *)selectedImageName
                        tabBarItemType:(HcdTabBarItemType)tabBarItemType {
    
    HcdTabBarItem *item = [[HcdTabBarItem alloc] initWithFrame:frame];
    [item setTitle:title forState:UIControlStateNormal];
    [item setTitle:title forState:UIControlStateSelected];
    item.titleLabel.font = [UIFont systemFontOfSize:8];
    UIImage *normalImage = [UIImage imageNamed:normalImageName];
    UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
    [item setImage:normalImage forState:UIControlStateNormal];
    [item setImage:selectedImage forState:UIControlStateSelected];
    [item setTitleColor:[UIColor colorWithWhite:51 / 255.0 alpha:1] forState:UIControlStateNormal];
    [item setTitleColor:[UIColor colorWithWhite:51 / 255.0 alpha:1] forState:UIControlStateSelected];
    item.tabBarItemType = tabBarItemType;
    
    return item;
}

@end
