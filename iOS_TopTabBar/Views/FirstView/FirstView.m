//
//  FirstView.m
//  iOS_TopTabBar
//
//  Created by Sumit Anantwar on 7/20/17.
//  Copyright © 2017 Sumit Anantwar. All rights reserved.
//

#import "FirstView.h"

@interface FirstView()
<
    UITableViewDelegate,
    UITableViewDataSource
>

@property (strong, nonatomic) IBOutlet UIView *container;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation FirstView

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
    
    // TableView
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}


#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70.0f;
    
}

//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return 80.0f;
//}

//- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    return nil;
//}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Selected Roe : %d", (int)indexPath.row);
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (!cell) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"Row %d", (int)indexPath.row];
    
    return cell;
}



@end
