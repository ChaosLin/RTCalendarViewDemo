//
//  DayCellView.h
//  RTCalendarViewDemo
//
//  Created by Chaos Lin on 4/13/14.
//  Copyright (c) 2014 Chaos Lin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DayCellView;
@protocol DayCellViewDelegate <NSObject>
- (void)didTapOnDayCellView:(DayCellView*)dayCellView;
@end

@interface DayCellView : UIView
@property (nonatomic, assign) NSInteger dayId;
@property (nonatomic, weak) id <DayCellViewDelegate> delegate;
@property (nonatomic, assign) BOOL isSelected;
@end
