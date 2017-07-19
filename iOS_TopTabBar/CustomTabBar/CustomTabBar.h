//
//  CustomTabBar.h
//  TopTabBar
//
//  Created by Sumit Anantwar on 7/18/17.
//  Copyright © 2017 Sumit Anantwar. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CustomTabHolder.h"

IB_DESIGNABLE

@interface CustomTabBar : UIView


@property (strong, nonatomic) UIColor *tabBackgroundColor;
@property (strong, nonatomic) UIColor *tabTintColor;

@property (strong, nonatomic) NSArray<CustomTabHolder*> *tabs;



@end
