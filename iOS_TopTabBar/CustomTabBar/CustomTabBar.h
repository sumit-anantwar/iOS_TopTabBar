//
//  CustomTabBar.h
//  TopTabBar
//
//  Created by Sumit Anantwar on 7/18/17.
//  Copyright © 2017 Sumit Anantwar. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CustomTabHolder.h"

@class CustomTabBar;

@protocol CustomTabBarDataSource <NSObject>
@required

- ( UIView *) customTabBar:(CustomTabBar *)customTabBar titleViewForTabAtIndex:(NSUInteger)index;
- (UIView *) customTabBar:(CustomTabBar *)customTabBar contentViewForTabAtIndex:(NSUInteger) index;
- (NSUInteger) numberOfTabsInCustomTabBar:(CustomTabBar *)customTabBar;

@end



@interface CustomTabBar : UIView

@property (weak, nonatomic) id<CustomTabBarDataSource> dataSource;

@property (strong, nonatomic) UIColor * tabBackgroundColor;
@property (strong, nonatomic) UIColor * tabTintColor;


@end
