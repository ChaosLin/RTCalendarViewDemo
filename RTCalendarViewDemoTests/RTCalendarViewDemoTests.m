//
//  RTCalendarViewDemoTests.m
//  RTCalendarViewDemoTests
//
//  Created by Chaos Lin on 4/11/14.
//  Copyright (c) 2014 Chaos Lin. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DateUtils.h"

@interface RTCalendarViewDemoTests : XCTestCase

@end

@implementation RTCalendarViewDemoTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

//- (void)testExample
//{
////    XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
//}
//
//- (void)testTemp
//{
//    XCTAssert(1, @"testTemp");
//}

- (void)testGetWeekDayWithDayId
{
    XCTAssert(2 == [DateUtils getWeekDayWithDayId:20140401], @"fail");
    XCTAssert(3 == [DateUtils getWeekDayWithDayId:20140402], @"fail");
    XCTAssert(4 == [DateUtils getWeekDayWithDayId:20140403], @"fail");
    XCTAssert(5 == [DateUtils getWeekDayWithDayId:20140404], @"fail");
    XCTAssert(6 == [DateUtils getWeekDayWithDayId:20140405], @"fail");
    XCTAssert(7 == [DateUtils getWeekDayWithDayId:20140406], @"fail");
    XCTAssert(1 == [DateUtils getWeekDayWithDayId:20140407], @"fail");
    XCTAssert(2 == [DateUtils getWeekDayWithDayId:20140408], @"fail");
    XCTAssert(3 == [DateUtils getWeekDayWithDayId:20140409], @"fail");
    XCTAssert(4 == [DateUtils getWeekDayWithDayId:20140410], @"fail");
    XCTAssert(5 == [DateUtils getWeekDayWithDayId:20140411], @"fail");
    XCTAssert(6 == [DateUtils getWeekDayWithDayId:20140412], @"fail");
    XCTAssert(7 == [DateUtils getWeekDayWithDayId:20140413], @"fail");
    XCTAssert(1 == [DateUtils getWeekDayWithDayId:20140414], @"fail");
    XCTAssert(2 == [DateUtils getWeekDayWithDayId:20140415], @"fail");
    XCTAssert(3 == [DateUtils getWeekDayWithDayId:20140416], @"fail");
    XCTAssert(4 == [DateUtils getWeekDayWithDayId:20140417], @"fail");
    XCTAssert(5 == [DateUtils getWeekDayWithDayId:20140418], @"fail");
    XCTAssert(6 == [DateUtils getWeekDayWithDayId:20140419], @"fail");
    XCTAssert(7 == [DateUtils getWeekDayWithDayId:20140420], @"fail");
    XCTAssert(1 == [DateUtils getWeekDayWithDayId:20140421], @"fail");
    XCTAssert(2 == [DateUtils getWeekDayWithDayId:20140422], @"fail");
    XCTAssert(3 == [DateUtils getWeekDayWithDayId:20140423], @"fail");
    XCTAssert(4 == [DateUtils getWeekDayWithDayId:20140424], @"fail");
    XCTAssert(5 == [DateUtils getWeekDayWithDayId:20140425], @"fail");
    XCTAssert(6 == [DateUtils getWeekDayWithDayId:20140426], @"fail");
    XCTAssert(7 == [DateUtils getWeekDayWithDayId:20140427], @"fail");
    XCTAssert(1 == [DateUtils getWeekDayWithDayId:20140428], @"fail");
    XCTAssert(2 == [DateUtils getWeekDayWithDayId:20140429], @"fail");
    XCTAssert(3 == [DateUtils getWeekDayWithDayId:20140430], @"fail");
    XCTAssert(4 == [DateUtils getWeekDayWithDayId:20140431], @"fail");
}

- (void)testGetRowWithDayId
{
    XCTAssert(0 == [DateUtils getRowWithDayId:20140402] , @"fail");
    XCTAssert(2 == [DateUtils getRowWithDayId:20140417] , @"fail");
    XCTAssert(4 == [DateUtils getRowWithDayId:20140430] , @"fail");
    XCTAssert(0 == [DateUtils getRowWithDayId:20140101] , @"fail");
    XCTAssert(1 == [DateUtils getRowWithDayId:20140111] , @"fail");
    XCTAssert(3 == [DateUtils getRowWithDayId:20140119] , @"fail");
    XCTAssert(4 == [DateUtils getRowWithDayId:20140431] , @"fail");
    XCTAssert(4 == [DateUtils getRowWithDayId:20140430] , @"fail");
    XCTAssert(0 == [DateUtils getRowWithDayId:20140201] , @"fail");
    XCTAssert(1 == [DateUtils getRowWithDayId:20140202] , @"fail");
    XCTAssert(1 == [DateUtils getRowWithDayId:20140208] , @"fail");
    XCTAssert(2 == [DateUtils getRowWithDayId:20140215] , @"fail");
    XCTAssert(4 == [DateUtils getRowWithDayId:20140223] , @"fail");
    XCTAssert(4 == [DateUtils getRowWithDayId:20140224] , @"fail");
    XCTAssert(4 == [DateUtils getRowWithDayId:20140228] , @"fail");
    XCTAssert(0 == [DateUtils getRowWithDayId:20140501] , @"fail");
    XCTAssert(0 == [DateUtils getRowWithDayId:20140502] , @"fail");
    XCTAssert(0 == [DateUtils getRowWithDayId:20140503] , @"fail");
    XCTAssert(1 == [DateUtils getRowWithDayId:20140504] , @"fail");
    XCTAssert(1 == [DateUtils getRowWithDayId:20140505] , @"fail");
    XCTAssert(1 == [DateUtils getRowWithDayId:20140510] , @"fail");
    XCTAssert(3 == [DateUtils getRowWithDayId:20140519] , @"fail");
    XCTAssert(4 == [DateUtils getRowWithDayId:20140531] , @"fail");
}
@end
