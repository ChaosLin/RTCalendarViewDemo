//
//  DayCellView.m
//  RTCalendarViewDemo
//
//  Created by Chaos Lin on 4/13/14.
//  Copyright (c) 2014 Chaos Lin. All rights reserved.
//

#import "DayCellView.h"

@interface DayCellView()
- (void)didReceiveTapGesture:(id)sender;
@end

@implementation DayCellView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor blueColor];
        UITapGestureRecognizer* tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(didReceiveTapGesture:)];
        [self addGestureRecognizer:tapGesture];
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

- (void)dealloc
{
    
}

- (void)didReceiveTapGesture:(id)sender
{
    self.isSelected = YES;
    if (self.delegate && [self.delegate respondsToSelector:@selector(didTapOnDayCellView:)])
    {
        [self.delegate didTapOnDayCellView:self];
    }
}

- (void)setIsSelected:(BOOL)isSelected
{
    if (isSelected)
    {
        self.backgroundColor = [UIColor greenColor];
    }
    else
    {
        self.backgroundColor = [UIColor blueColor];
    }
}
@end
