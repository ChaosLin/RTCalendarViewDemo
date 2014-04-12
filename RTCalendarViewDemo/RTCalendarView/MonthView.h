//
//  MonthView.h
//  RTCalendarViewDemo
//
//  Created by Chaos Lin on 4/11/14.
//  Copyright (c) 2014 Chaos Lin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MonthView : UIView

@property (nonatomic, assign) NSInteger year;
@property (nonatomic, assign) NSInteger month;

- (void)showPreviousMonth;
- (void)showNextMonth;
@end
