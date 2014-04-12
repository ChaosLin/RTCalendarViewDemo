//
//  TestViewController.m
//  RTCalendarViewDemo
//
//  Created by Chaos Lin on 4/12/14.
//  Copyright (c) 2014 Chaos Lin. All rights reserved.
//

#import "TestViewController.h"
#import "MonthView.h"

@interface TestViewController ()
@property (nonatomic, strong) MonthView* monthView;
@end

@implementation TestViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self test];
    
    UIBarButtonItem* leftBarItem = [[UIBarButtonItem alloc]initWithTitle:@"before" style:UIBarButtonItemStyleBordered target:self action:@selector(showPreviousMonth)];
    UIBarButtonItem* rightBarItem = [[UIBarButtonItem alloc]initWithTitle:@"next" style:UIBarButtonItemStyleBordered target:self action:@selector(showNextMonth)];
    self.navigationItem.leftBarButtonItem = leftBarItem;
    self.navigationItem.rightBarButtonItem = rightBarItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)test
{
//    MonthView* month = [[MonthView alloc]initWithYear:2014 month:4];
//    month.frame = self.view.bounds;
    self.monthView = [[MonthView alloc]initWithFrame:CGRectMake(00, 100, 320, 480)];
    self.monthView.year = 2014;
    self.monthView.month = 1;
    
    [self.view addSubview:self.monthView];
    
//    NSTimer* timer = [NSTimer timerWithTimeInterval:5 target:self selector:@selector(newMonth:) userInfo:self.monthView repeats:YES];
//    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    
}

- (void)newMonth:(NSTimer*)timer
{
    static NSInteger month = 1;
    month++;
    MonthView* monthView = timer.userInfo;
    monthView.month = month;
}

- (void)showPreviousMonth
{
    [self.monthView showPreviousMonth];
}

- (void)showNextMonth
{
    [self.monthView showNextMonth];
}
@end
