//
//  PointerView.m
//  TopTabBar
//
//  Created by Sumit Anantwar on 7/18/17.
//  Copyright © 2017 Sumit Anantwar. All rights reserved.
//

#import "PointerView.h"

@implementation PointerView

#pragma mark - Getters & Setters

- (void) setPointerColor:(UIColor *)pointerColor
{
    if (![_pointerColor isEqual:pointerColor]) {
        
        _pointerColor = pointerColor;
        
        [self setNeedsDisplay];
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

- (instancetype) initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        
        [self initialize];
    }
    
    return self;
}

- (void) initialize
{
    self.backgroundColor = [UIColor clearColor];
    self.pointerColor = [UIColor blackColor];
}

- (void)drawRect:(CGRect)rect {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextMoveToPoint(context, 0.0f, 0.0f);
    CGContextAddLineToPoint(context, rect.size.width, 0.0f);
    CGContextAddLineToPoint(context, (rect.size.width/2), rect.size.height);
    
    CGContextClosePath(context);
    
    [_pointerColor setFill];
    CGContextFillPath(context);
}


@end
