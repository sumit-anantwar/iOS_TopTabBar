//
//  CustomTabTitleView.m
//  TopTabBar
//
//  Created by Sumit Anantwar on 7/18/17.
//  Copyright © 2017 Sumit Anantwar. All rights reserved.
//

#import "CustomTabTitleView.h"

@interface CustomTabTitleView()

@property (strong, nonatomic) IBOutlet UIView *container;

@property (weak, nonatomic) IBOutlet UILabel *iconLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation CustomTabTitleView

#pragma mark - Getters & Setters

- (void) setIcon:(NSString *)icon
{
    if (![_icon isEqualToString:icon]) {
        
        _icon = icon;
        
        self.iconLabel.text = icon;
    }
}

- (void) setIconFont:(UIFont *)iconFont
{
    if (iconFont && ![_iconFont isEqual:iconFont]) {
        _iconFont = iconFont;
        
        self.iconLabel.font = iconFont;
    }
}

- (void) setIconColor:(UIColor *)iconColor
{
    if (iconColor && ![_iconColor isEqual:iconColor]) {
        
        _iconColor = iconColor;
        
        self.iconLabel.textColor = iconColor;
    }
}

- (void) setTitle:(NSString *)title
{
    if (![_title isEqualToString:title]) {
        
        _title = title;
        
        self.titleLabel.text = title;
    }
}

- (void) setTitleFont:(UIFont *)titleFont
{
    if (titleFont && ![_titleFont isEqual:titleFont]) {
        _titleFont = titleFont;
        
        self.titleLabel.font = titleFont;
    }
}

- (void) setTitleColor:(UIColor *)titleColor
{
    if (titleColor && ![_titleColor isEqual:titleColor]) {
        _titleColor = titleColor;
        
        self.titleLabel.textColor = titleColor;
    }
}

#pragma mark - Designated Initializers

- (instancetype) init
{
    if (self = [super init]) {
        
        [self initialize];
    }
    
    return self;
}

#pragma mark - Storyboard Initializers

- (void) initialize
{
    // Load the Nib
    [[UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil] instantiateWithOwner:self options:nil];
    
    // Clip to Bounds
    self.clipsToBounds = YES;
    
    // Add container to the View
    [self addSubview:self.container];
    self.container.frame = self.bounds;
    
    self.iconColor = [UIColor blackColor];
    self.titleColor = [UIColor blackColor];
}

#pragma mark - Override

- (void) setFrame:(CGRect)frame
{
    [super setFrame:frame];
    
    self.container.frame = self.bounds;
}


#pragma mark - Object Factory

+ (CustomTabTitleView *) titleViewWithIcon:(NSString *)icon andTitle:(NSString *)title
{
    CustomTabTitleView *ttv = [[self alloc] init];
    ttv.icon    = icon;
    ttv.title   = title;
    
    return ttv;
}

@end
