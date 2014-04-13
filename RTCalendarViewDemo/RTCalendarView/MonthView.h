//
//  MonthView.h
//  RTCalendarViewDemo
//
//  Created by Chaos Lin on 4/11/14.
//  Copyright (c) 2014 Chaos Lin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DayCellView;
@protocol MonthViewResource <NSObject>
@required
- (DayCellView*)dayViewForDayId:(NSInteger)dayId;
//- (CGPoint)centerForDayCellViewInDayId:(NSInteger)dayId;

@end

@interface MonthView : UIView

@property (nonatomic, assign) NSInteger year;
@property (nonatomic, assign) NSInteger month;

@property (nonatomic, weak) id<MonthViewResource> dataResource;


- (void)showPreviousMonth;
- (void)showNextMonth;
- (void)showToday;

- (void)reloadView;//类似UITableview的ReloadData,这个操作会删除现有的view，并重新生成DayView

- (DayCellView*)cellViewForDay:(NSInteger)day;
@end
