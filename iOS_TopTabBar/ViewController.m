//
//  ViewController.m
//  TopTabBar
//
//  Created by Sumit Anantwar on 7/18/17.
//  Copyright © 2017 Sumit Anantwar. All rights reserved.
//

#import "ViewController.h"

#import "CustomTabBar.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet CustomTabBar *customTabBar;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CustomTabTitleView *rtv = [CustomTabTitleView titleViewWithIcon:@"\ue921" andTitle:@"RED"];
    rtv.iconFont = [UIFont fontWithName:@"icomoon" size:23.0];
    rtv.iconColor = [UIColor whiteColor];
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    CustomTabHolder *rtab = [CustomTabHolder tabWithTitleView:rtv andContentView:redView];
    
    CustomTabTitleView *gtv = [CustomTabTitleView titleViewWithIcon:@"G" andTitle:@"GREEN"];
    gtv.iconFont = [UIFont fontWithName:@"icomoon" size:23.0];
    UIView *greenView = [[UIView alloc] init];
    greenView.backgroundColor = [UIColor greenColor];
    CustomTabHolder *gtab = [CustomTabHolder tabWithTitleView:gtv andContentView:greenView];
    
    CustomTabTitleView *btv = [CustomTabTitleView titleViewWithIcon:@"B" andTitle:@"LONG BLUE"];
    btv.iconFont = [UIFont fontWithName:@"icomoon" size:23.0];
    UIView *blueView = [[UIView alloc] init];
    blueView.backgroundColor = [UIColor blueColor];
    CustomTabHolder *btab = [CustomTabHolder tabWithTitleView:btv andContentView:blueView];
    
    NSArray *tabs = @[rtab, gtab, btab];
    
    self.customTabBar.tabs = tabs;
    self.customTabBar.tabBackgroundColor = [UIColor orangeColor];
    self.customTabBar.tabTintColor = [UIColor purpleColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
