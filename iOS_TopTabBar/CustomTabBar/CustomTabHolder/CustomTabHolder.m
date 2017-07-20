//
//  CustomTab.m
//  TopTabBar
//
//  Created by Sumit Anantwar on 7/18/17.
//  Copyright © 2017 Sumit Anantwar. All rights reserved.
//

#import "CustomTabHolder.h"

@implementation CustomTabHolder


+ (CustomTabHolder *) tabWithTitleView:(UIView *)titleView andContentView:(UIView *)contentView;
{
    CustomTabHolder *tab    = [[self alloc] init];
    tab.titleView           = titleView;
    tab.contentView         = contentView;
    
    return tab;
}


@end
