//
//  CustomTabTitleView.h
//  TopTabBar
//
//  Created by Sumit Anantwar on 7/18/17.
//  Copyright © 2017 Sumit Anantwar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTabTitleView : UIView

@property (strong, nonatomic) UIFont *iconFont;
@property (strong, nonatomic) UIColor *iconColor;

@property (strong, nonatomic) UIFont *titleFont;
@property (strong, nonatomic) UIColor *titleColor;

@property (strong, nonatomic) NSString *icon;
@property (strong, nonatomic) NSString *title;


// Object Factory
+ (CustomTabTitleView *) titleViewWithIcon:(NSString *)icon andTitle:(NSString *)title;


@end
