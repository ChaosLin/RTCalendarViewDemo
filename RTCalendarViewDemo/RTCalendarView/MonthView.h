//
//  MonthView.h
//  RTCalendarViewDemo
//
//  Created by Chaos Lin on 4/11/14.
//  Copyright (c) 2014 Chaos Lin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DayCellView;
@class MonthView;

@protocol MonthViewResource <NSObject>
@required
- (DayCellView*)dayViewForDayId:(NSInteger)dayId;
//- (CGPoint)centerForDayCellViewInDayId:(NSInteger)dayId;
@end

@protocol MonthViewDelegate <NSObject>
@optional
- (void)monthView:(MonthView*)monthView didSelectDayId:(NSInteger)dayId;
@end

@interface MonthView : UIView

@property (nonatomic, assign) NSInteger year;
@property (nonatomic, assign) NSInteger month;

@property (nonatomic, assign) NSInteger dayId_currentSelected;
@property (nonatomic, weak) id<MonthViewResource> dataResource;
@property (nonatomic, weak) id<MonthViewDelegate> delegate;


- (void)showPreviousMonth;
- (void)showNextMonth;
- (void)showPreviousYear;
- (void)showNextYear;
- (void)showToday;

- (void)reloadView;//类似UITableview的ReloadData,这个操作会删除现有的view，并重新生成DayView

- (DayCellView*)dayViewForDayId:(NSInteger)dayId;
//- (
@end
