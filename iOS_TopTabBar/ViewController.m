//
//  ViewController.m
//  TopTabBar
//
//  Created by Sumit Anantwar on 7/18/17.
//  Copyright © 2017 Sumit Anantwar. All rights reserved.
//

#import "ViewController.h"

#import "CustomTabBar.h"
#import "FirstView.h"

@interface ViewController () <CustomTabBarDataSource>

@property (weak, nonatomic) IBOutlet CustomTabBar *customTabBar;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    
    
//    self.customTabBar.tabs = tabs;
    self.customTabBar.tabBackgroundColor = [UIColor orangeColor];
    self.customTabBar.tabTintColor = [UIColor purpleColor];
    self.customTabBar.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - CustomTabBarDataSource

- ( UIView * _Nonnull ) customTabBar:(CustomTabBar * _Nonnull)customTabBar titleViewForTabAtIndex:(NSUInteger)index
{
    if (index == 0) {
        CustomTabTitleView *rtv = [CustomTabTitleView titleViewWithIcon:@"\ue921" andTitle:@"FIRST VIEW"];
        rtv.iconFont = [UIFont fontWithName:@"icomoon" size:23.0];
        rtv.iconColor = [UIColor whiteColor];
        return rtv;
    }
    else if (index == 1) {
        CustomTabTitleView *gtv = [CustomTabTitleView titleViewWithIcon:@"G" andTitle:@"GREEN"];
        gtv.iconFont = [UIFont fontWithName:@"icomoon" size:23.0];
        return gtv;
    }
    else if (index == 2) {
        
        CustomTabTitleView *btv = [CustomTabTitleView titleViewWithIcon:@"B" andTitle:@"LONG BLUE"];
        btv.iconFont = [UIFont fontWithName:@"icomoon" size:23.0];
        return btv;
    }
    
    return nil;
}

- (UIView * _Nonnull) customTabBar:(CustomTabBar * _Nonnull)customTabBar contentViewForTabAtIndex:(NSUInteger) index
{
    if (index == 0){
        
        FirstView *fv = [[FirstView alloc] init];
        return fv;
    }
    else if (index == 1) {
        
        UIView *greenView = [[UIView alloc] init];
        greenView.backgroundColor = [UIColor greenColor];
        return greenView;
    }
    else if (index == 2) {
        
        UIView *blueView = [[UIView alloc] init];
        blueView.backgroundColor = [UIColor blueColor];
        return blueView;
    }
    
    return nil;
}

- (NSUInteger) numberOfTabsInCustomTabBar:(CustomTabBar * _Nonnull)customTabBar
{
    return 3;
}

@end
