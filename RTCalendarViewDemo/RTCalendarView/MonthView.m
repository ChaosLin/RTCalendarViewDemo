//
//  MonthView.m
//  RTCalendarViewDemo
//
//  Created by Chaos Lin on 4/11/14.
//  Copyright (c) 2014 Chaos Lin. All rights reserved.
//

#import "MonthView.h"
#import "DateUtils.h"

@interface MonthView()

- (NSInteger)daysInThisMonth;
- (NSInteger)weekdayOfTheFirstDayInThisMonth;
//某一天对应第几行、第几列,以周日为第0列,最开始的一行为第0行
//day:20140411 -> row:1 volume:6
- (NSInteger)getRowForDayId:(NSInteger)day;
- (NSInteger)getVolumeForDayId:(NSInteger)day;

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

#pragma mark - base
- (NSInteger)daysInThisMonth
{
    return [DateUtils numberOfDaysInYear:self.year month:self.month];
}

- (NSInteger)weekdayOfTheFirstDayInThisMonth
{
    NSInteger dayId = [DateUtils getDayIdWithYear:self.year month:self.month day:1];
    return [DateUtils getWeekDayWithDayId:dayId];
}

//某一天对应第几行、第几列,以周日为第0列,最开始的一行为第0行
//day:20140411 -> row:1 volume:6
- (NSInteger)getRowForDayId:(NSInteger)day
{
    return [DateUtils getRowWithDayId:day];
}

- (NSInteger)getVolumeForDayId:(NSInteger)day
{
    return [DateUtils getRowWithDayId:day];
}
@end
