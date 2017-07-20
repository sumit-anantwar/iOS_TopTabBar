//
//  CustomTabBar.m
//  TopTabBar
//
//  Created by Sumit Anantwar on 7/18/17.
//  Copyright © 2017 Sumit Anantwar. All rights reserved.
//

#import "CustomTabBar.h"
#import "PointerView.h"

@interface CustomTabBar()

// Outlets
@property (strong, nonatomic) IBOutlet UIView *container;

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (weak, nonatomic) IBOutlet UIView *segmentContainer;
@property (weak, nonatomic) IBOutlet PointerView *pointer;

@property (strong, nonatomic) NSMutableArray *titleViews;
@property (strong, nonatomic) NSMutableArray *contentViews;

@end

@implementation CustomTabBar

#pragma mark - Getters & Setters

- (NSMutableArray *) titleViews
{
    if (!_titleViews) _titleViews = [[NSMutableArray alloc] init];
    
    return _titleViews;
}

- (NSMutableArray *) contentViews
{
    if (!_contentViews) _contentViews = [[NSMutableArray alloc] init];
    
    return _contentViews;
}


- (void) setTabBackgroundColor:(UIColor *)tabBackgroundColor
{
    if (![_tabBackgroundColor isEqual:tabBackgroundColor]) {
        
        _tabBackgroundColor = tabBackgroundColor;
        
        self.segmentedControl.backgroundColor = tabBackgroundColor;
    }
}

- (void) setTabTintColor:(UIColor *)tabTintColor
{
    if (![_tabTintColor isEqual:tabTintColor]) {
        
        _tabTintColor = tabTintColor;
        
        self.segmentedControl.tintColor = tabTintColor;
        self.pointer.pointerColor = tabTintColor;
    }
}

- (void) setDataSource:(id<CustomTabBarDataSource>)dataSource
{
    if (![_dataSource isEqual:dataSource]) {
        
        _dataSource = dataSource;
        [self setupTabs];
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

- (instancetype) initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        
        [self initialize];
    }
    
    return self;
}

- (void) initialize
{
    // Load the Nib
    [[UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil] instantiateWithOwner:self options:nil];
    
    // Clip to Bounds
    self.clipsToBounds = YES;
    
    // Add container to the View
    [self addSubview:self.container];
    self.container.frame = self.bounds;
    
    NSDictionary *attributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
    [self.segmentedControl setTitleTextAttributes:attributes
                                                       forState:UIControlStateNormal];
    [self.segmentedControl setTitleTextAttributes:attributes forState:UIControlStateSelected];
    self.segmentedControl.layer.cornerRadius =  0.0f;
    self.segmentedControl.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.segmentedControl.layer.borderWidth = 0.0f;
    self.segmentedControl.layer.masksToBounds = YES;
    
    self.tabBackgroundColor = [UIColor darkGrayColor];
    self.tabTintColor = [UIColor darkGrayColor];
}


#pragma mark - Private

- (void) setupTabs
{
    if (!self.dataSource) {
        return;
    }
    
    [self.segmentedControl removeAllSegments];
    
    NSUInteger tabCount = [self.dataSource numberOfTabsInCustomTabBar:self];
    
    for (int i = 0; i < tabCount; i++) {
        
        UIView *titleView = [self.dataSource customTabBar:self titleViewForTabAtIndex:i];
        UIView *contentView = [self.dataSource customTabBar:self contentViewForTabAtIndex:i];
        
        [self.segmentedControl insertSegmentWithTitle:@"" atIndex:i animated:NO];
        
        [self.container addSubview:titleView];
        titleView.userInteractionEnabled = NO;
        
        [self.titleViews addObject:titleView];
        [self.contentViews addObject:contentView];
    }
    
    self.segmentedControl.selectedSegmentIndex = 0;
    [self selectSegmentAtIndex:0];
}


#pragma mark - Override

- (void) layoutSubviews
{
    NSUInteger tabCount = [self.dataSource numberOfTabsInCustomTabBar:self];
    
    CGFloat tvWidth = self.segmentedControl.frame.size.width / tabCount;
    CGFloat tvHeight = self.segmentedControl.frame.size.height;
    
    for (int i = 0; i < tabCount; i++) {
        
        if (i < self.titleViews.count) {
            
            UIView *titleView = self.titleViews[i];
            CGFloat tvX = i *tvWidth;
            CGFloat tvY = 0.0f;
            
            titleView.frame = CGRectMake(tvX, tvY, tvWidth, tvHeight);
        }
        
        if (i < self.contentViews.count) {
            
            UIView *contentView =  self.contentViews[i];
            contentView.frame = self.segmentContainer.bounds;
        }
    }
    
    if (self.segmentedControl.selectedSegmentIndex >= 0){
        NSUInteger index = self.segmentedControl.selectedSegmentIndex;
        CGFloat segmentCenter = (index * tvWidth) + (tvWidth / 2);
        CGPoint pointerPosition = CGPointMake(segmentCenter, (self.pointer.frame.size.height/2));
        self.pointer.layer.position = pointerPosition;
    }
    
   
}


#pragma mark - UISegmentedControl listener

- (IBAction)didChangeSegment:(UISegmentedControl *)sender
{
    NSInteger segmentIndex = sender.selectedSegmentIndex;
    
    [self selectSegmentAtIndex:segmentIndex];
}

- (void) selectSegmentAtIndex:(NSUInteger)index
{
    UIView *contentView = (index < self.contentViews.count) ? self.contentViews[index] : nil;
    
    [self.segmentContainer.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self.segmentContainer addSubview:contentView];
    
    [self setNeedsLayout];
}


@end
