//
//  CustomTab.h
//  TopTabBar
//
//  Created by Sumit Anantwar on 7/18/17.
//  Copyright © 2017 Sumit Anantwar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "CustomTabTitleView.h"

@interface CustomTabHolder : NSObject

@property (strong, nonatomic) CustomTabTitleView *titleView;
@property (strong, nonatomic) UIView *contentView;


+ (CustomTabHolder *) tabWithTitleView:(CustomTabTitleView *)titleView andContentView:(UIView *)contentView;

@end
