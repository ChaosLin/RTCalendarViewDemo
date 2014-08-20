//
//  EventDayCellView.m
//  remember
//
//  Created by Chaos Lin on 8/20/14.
//  Copyright (c) 2014 Uncoped Studio. All rights reserved.
//

#import "EventDayCellView.h"

@interface EventDayCellView()
@property (nonatomic, strong) UIImageView* imageView_event;
@end

@implementation EventDayCellView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        CGRect bounds = self.bounds;
        float width = 5;
        float height = 5;
        self.imageView_event = [[UIImageView alloc]initWithFrame:CGRectMake((bounds.size.width - width) / 2.0, bounds.size.height - height, width, height)];
        self.imageView_event.backgroundColor = [UIColor grayColor];
        [self addSubview:self.imageView_event];
        self.imageView_event.hidden = YES;
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)setHasEvent:(BOOL)hasEvent
{
    _hasEvent = hasEvent;
    self.imageView_event.hidden = !hasEvent;
}
@end
