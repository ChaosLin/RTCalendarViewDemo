//
//  MonthView.m
//  RTCalendarViewDemo
//
//  Created by Chaos Lin on 4/11/14.
//  Copyright (c) 2014 Chaos Lin. All rights reserved.
//

#import "MonthView.h"

@interface MonthView()

- (NSInteger)daysInThisMonth;
- (NSInteger)weekdayOfTheFirstDayInThisMonth;
//某一天对应第几行、第几列
//day:20140411
- (void)getRow:(NSInteger)row volumn:(NSInteger)volumn forDayID:(NSInteger)day;

@end

@implementation MonthView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
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

@end
