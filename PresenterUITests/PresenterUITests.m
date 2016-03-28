//
//  PresenterUITests.m
//  PresenterUITests
//
//  Created by Sergey Zenchenko on 3/27/16.
//  Copyright © 2016 Techery. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface PresenterUITests : XCTestCase

@end

@implementation PresenterUITests

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];
    
    
    
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app.buttons[@"Login"] tap];
    
    XCUIElement *okButton = app.alerts[@"Login Error"].collectionViews.buttons[@"OK"];
    [okButton tap];
    
    XCTAssertTrue(app.buttons[@"Retry"].isEnabled);
}

@end
