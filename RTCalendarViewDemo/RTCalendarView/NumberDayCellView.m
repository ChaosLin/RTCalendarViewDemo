//
//  NumberDayCellView.m
//  remember
//
//  Created by Chaos Lin on 8/20/14.
//  Copyright (c) 2014 Uncoped Studio. All rights reserved.
//

#import "NumberDayCellView.h"

@implementation NumberDayCellView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.label_day = [[UILabel alloc]initWithFrame:self.bounds];
        self.label_day.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        self.label_day.backgroundColor = [UIColor greenColor];
        self.label_day.font = [UIFont systemFontOfSize:15];
        self.label_day.textColor = [UIColor blackColor];
        self.label_day.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.label_day];
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

- (void)setDayId:(NSInteger)dayId
{
    _dayId = dayId;
    self.label_day.text = [NSString stringWithFormat:@"%d", self.dayId % 100];
}
@end
