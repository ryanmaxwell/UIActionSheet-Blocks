//
//  UIActionSheetBlocksTests.m
//  UIActionSheetBlocksTests
//
//  Created by Ryan Maxwell on 7/09/13.
//  Copyright (c) 2013 Ryan Maxwell. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "UIActionSheet+Blocks.h"

@interface UIActionSheetBlocksTests : XCTestCase <UIActionSheetDelegate>
@property (strong, nonatomic) UIActionSheet *actionSheet;
@end

@implementation UIActionSheetBlocksTests

- (void)setUp {
    [super setUp];
    
    self.actionSheet = [[UIActionSheet alloc] initWithTitle:@"Test"
                                                   delegate:self
                                          cancelButtonTitle:@"Cancel"
                                     destructiveButtonTitle:@"Delete"
                                          otherButtonTitles:nil];
}

- (void)tearDown {
    self.actionSheet = nil;
    
    [super tearDown];
}

- (void)testSettingTapBlock {
    XCTAssertEqualObjects(self.actionSheet.delegate, self, @"The Action Sheet Delegate should be self");
    
    void (^localTapBlock)(UIActionSheet *actionSheet, NSInteger buttonIndex) = ^void(UIActionSheet *actionSheet, NSInteger buttonIndex){
        NSLog(@"Tapped Action Sheet");
    };
    
    self.actionSheet.tapBlock = localTapBlock;
    
    XCTAssertEqualObjects(self.actionSheet.tapBlock, localTapBlock, @"The Action Sheet tap block should equal the local tap block");
    XCTAssertEqualObjects(self.actionSheet.delegate, self.actionSheet, @"The Action Sheet Delegate should be the action sheet");
}

- (void)testSettingWillDismissBlock {
    XCTAssertEqualObjects(self.actionSheet.delegate, self, @"The Action Sheet Delegate should be self");
    
    void (^localWillDismissBlock)(UIActionSheet *actionSheet, NSInteger buttonIndex) = ^void(UIActionSheet *actionSheet, NSInteger buttonIndex){
        NSLog(@"Will Dismiss Action Sheet");
    };
    
    self.actionSheet.willDismissBlock = localWillDismissBlock;
    
    XCTAssertEqualObjects(self.actionSheet.willDismissBlock, localWillDismissBlock, @"The Action Sheet will dismiss block should equal the local will dismiss block block");
    XCTAssertEqualObjects(self.actionSheet.delegate, self.actionSheet, @"The Action Sheet Delegate should be the action sheet");
}

- (void)testSettingDidDismissBlock {
    XCTAssertEqualObjects(self.actionSheet.delegate, self, @"The Action Sheet Delegate should be self");
    
    void (^localDidDismissBlock)(UIActionSheet *actionSheet, NSInteger buttonIndex) = ^void(UIActionSheet *actionSheet, NSInteger buttonIndex){
        NSLog(@"Did Dismiss Action Sheet");
    };
    
    self.actionSheet.didDismissBlock = localDidDismissBlock;
    
    XCTAssertEqualObjects(self.actionSheet.didDismissBlock, localDidDismissBlock, @"The Action Sheet did dismiss block should equal the local did dismiss block block");
    XCTAssertEqualObjects(self.actionSheet.delegate, self.actionSheet, @"The Action Sheet Delegate should be the action sheet");
}

- (void)testSettingCancelBlock {
    XCTAssertEqualObjects(self.actionSheet.delegate, self, @"The Action Sheet Delegate should be self");
    
    void (^localCancelBlock)(UIActionSheet *actionSheet) = ^void(UIActionSheet *actionSheet){
        NSLog(@"Cancelled Action Sheet");
    };
    
    self.actionSheet.cancelBlock = localCancelBlock;
    
    XCTAssertEqualObjects(self.actionSheet.cancelBlock, localCancelBlock, @"The Action Sheet cancel block should equal the local cancel block");
    XCTAssertEqualObjects(self.actionSheet.delegate, self.actionSheet, @"The Action Sheet Delegate should be the action sheet");
}

- (void)testSettingWillPresentBlock {
    XCTAssertEqualObjects(self.actionSheet.delegate, self, @"The Action Sheet Delegate should be self");
    
    void (^localWillPresentBlock)(UIActionSheet *actionSheet) = ^void(UIActionSheet *actionSheet){
        NSLog(@"Will Present Action Sheet");
    };
    
    self.actionSheet.willPresentBlock = localWillPresentBlock;
    
    XCTAssertEqualObjects(self.actionSheet.willPresentBlock, localWillPresentBlock, @"The Action Sheet will present block should equal the local will present block");
    XCTAssertEqualObjects(self.actionSheet.delegate, self.actionSheet, @"The Action Sheet Delegate should be the action sheet");
}

- (void)testSettingDidPresentBlock {
    XCTAssertEqualObjects(self.actionSheet.delegate, self, @"The Action Sheet Delegate should be self");
    
    void (^localDidPresentBlock)(UIActionSheet *actionSheet) = ^void(UIActionSheet *actionSheet){
        NSLog(@"Did Present Action Sheet");
    };
    
    self.actionSheet.didPresentBlock = localDidPresentBlock;
    
    XCTAssertEqualObjects(self.actionSheet.didPresentBlock, localDidPresentBlock, @"The Action Sheet did present block should equal the local did present block");
    XCTAssertEqualObjects(self.actionSheet.delegate, self.actionSheet, @"The Action Sheet Delegate should be the action sheet");
}

@end
