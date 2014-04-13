//
//  MonthView.m
//  RTCalendarViewDemo
//
//  Created by Chaos Lin on 4/11/14.
//  Copyright (c) 2014 Chaos Lin. All rights reserved.
//

#import "MonthView.h"
#import "DateUtils.h"
#import "DayCellView.h"

@interface MonthView()

@property (nonatomic, strong) NSMutableDictionary* dic_day2views;

- (NSInteger)daysInThisMonth;
- (NSInteger)weekdayOfTheFirstDayInThisMonth;
//某一天对应第几行、第几列,以周日为第0列,最开始的一行为第0行
//day:20140411 -> row:1 volume:6
- (NSInteger)getRowForDayId:(NSInteger)day;
- (NSInteger)getVolumeForDayId:(NSInteger)day;
- (NSInteger)generateRows;

//view
- (DayCellView*)getDayViewForDayId:(NSInteger)dayId;
- (void)redraw;
@end

@implementation MonthView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
        self.dic_day2views = [NSMutableDictionary dictionaryWithCapacity:31];
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
    [self.dic_day2views removeAllObjects];
    for (UIView* subView in self.subviews)
    {
        [subView removeFromSuperview];
    }
    NSInteger count_day = [DateUtils numberOfDaysInYear:self.year month:self.month];
    for (NSInteger i = 1; i <= count_day; i++)
    {
        //得到DayView
        NSInteger dayId = [DateUtils getDayIdWithYear:self.year month:self.month day:i];
        DayCellView* dayView = [self getDayViewForDayId:dayId];
        if (dayView && !dayView.superview)
        {
            [self addSubview:dayView];
        }
        //设置center
        NSInteger row = [self getRowForDayId:dayId];
        NSInteger volume = [self getVolumeForDayId:dayId];
        CGPoint center = CGPointMake((int)(self.frame.size.width / 7.0 * (volume + 0.5)), (int)((dayView.frame.size.height + 1) * (row + 0.5)));
        dayView.center = center;
        dayView.hidden = NO;
    }
    for (NSInteger i = count_day + 1; i <= 31; i++)
    {
        //得到多余的DayView
        NSInteger dayId = [DateUtils getDayIdWithYear:self.year month:self.month day:i];
        DayCellView* dayView = [self getDayViewForDayId:dayId];
        dayView.hidden = YES;
    }
}

- (void)layoutSubviews
{
//    NSLog(@"current month is %d", self.month);
    [super layoutSubviews];
}

- (DayCellView*)getDayViewForDayId:(NSInteger)dayId
{
    DayCellView* dayView = nil;
    NSInteger day = dayId % 100;
    NSString* str_day = [NSString stringWithFormat:@"%d", day];
    if ([self.dic_day2views valueForKey:str_day])
    {
        dayView = [self.dic_day2views valueForKeyPath:[NSString stringWithFormat:@"%d", day]];
    }
    else
    {
        //如果没有view,而且day>当前月的count,return nil
        NSInteger count_day = [DateUtils numberOfDaysInYear:self.year month:self.month];
        if (day > count_day)
        {
            dayView = nil;
        }
        else
        {
            if (self.dataResource && [self.dataResource respondsToSelector:@selector(dayViewForDayId:)])
            {
                dayView = [self.dataResource dayViewForDayId:dayId];
            }
            if (dayView)
            {
                [self.dic_day2views setValue:dayView forKey:str_day];
            }
        }
    }
    return dayView;
}

- (DayCellView*)cellViewForDay:(NSInteger)day
{
    return [self.dic_day2views valueForKey:[NSString stringWithFormat:@"%d", day]];
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

- (void)showToday
{
    NSDate* date = [NSDate date];
    NSInteger dayId = [DateUtils getDayIdWithDate:date];
    NSInteger year = dayId / 10000;
    NSInteger month = dayId / 100 % 100;
    NSInteger day = dayId % 100;
    _year = year;
    self.month = month;
}

- (void)reloadView
{
    [self redraw];
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
