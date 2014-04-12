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
- (NSInteger)generateRows;

//view
- (UIView*)generateViewForDayId:(NSInteger)dayId;
- (void)redraw;
@end

@implementation MonthView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}

- (void)redraw
{
    [UIView animateWithDuration:0.2 animations:^(void){
        self.alpha = 0.99;
        for (UIView* subView in self.subviews)
        {
            [subView removeFromSuperview];
        }
        if (self.year && self.month)
        {
            NSInteger numberOfDays = [DateUtils numberOfDaysInYear:self.year month:self.month];
            for (NSInteger i = 1; i <= numberOfDays; i++)
            {
                NSInteger dayId = [DateUtils getDayIdWithYear:self.year month:self.month day:i];
                UIView* view_day = [self generateViewForDayId:dayId];
                [self addSubview:view_day];
            }
        }
    }completion:^(BOOL finished){
        self.alpha = 1.0;
        
    }];
}

- (UIView*)generateViewForDayId:(NSInteger)dayId
{
    float width_bounds = self.bounds.size.width;
    float height_bounds = self.bounds.size.height;
    float width = (int)(width_bounds / 7);
    float height = (int)(height_bounds / 7);
    NSInteger row = [self getRowForDayId:dayId];
    NSInteger volume = [self getVolumeForDayId:dayId];
    UIView* view = [[UIView alloc]initWithFrame:CGRectMake(width * volume, height * row, width, height)];
    view.backgroundColor = [UIColor greenColor];
    UILabel* label = [[UILabel alloc]initWithFrame:view.bounds];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = [NSString stringWithFormat:@"%d", dayId % 100];
    label.backgroundColor = [UIColor greenColor];
    [view addSubview:label];
    return view;
}

- (void)showPreviousMonth
{
    NSInteger month = self.month;
    month -= 1;
    if (0 >= month)
    {
        month = 12;
        _year -= 1;
    }
    self.month = month;
}

- (void)showNextMonth
{
    NSInteger month = self.month;
    month += 1;
    if (13 <= month)
    {
        month = 1;
        _year += 1;
    }
    self.month = month;
    
}

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
    return [DateUtils getVolumeWithDayId:day];
}

- (NSInteger)generateRows
{
    return [DateUtils numberOfRowsInYear:self.year month:self.month];
}

#pragma mark - setter,getter
- (void)setYear:(NSInteger)year
{
    if (_year != year && 1970 <= year && 2050 >= year)
    {
        _year = year;
        [self redraw];
    }
}

- (void)setMonth:(NSInteger)month
{
    if (_month != month && 1<= month && 12 >= month)
    {
        _month = month;
        [self redraw];
    }
}

#pragma mark -
@end
