//
//  TestActionSheetViewController.m
//  UIActionSheetBlocks
//
//  Created by Ryan Maxwell on 7/09/13.
//  Copyright (c) 2013 Ryan Maxwell. All rights reserved.
//

#import "TestActionSheetViewController.h"
#import "UIActionSheet+Blocks.h"

@interface TestActionSheetViewController ()

- (IBAction)showInView:(id)sender;

@end

@implementation TestActionSheetViewController

- (IBAction)showInView:(id)sender {
    [UIActionSheet showInView:self.view
                    withTitle:@"Test Action Sheet"
            cancelButtonTitle:@"Cancel"
       destructiveButtonTitle:@"Delete"
            otherButtonTitles:@[@"One", @"Two", @"Three"]
                     tapBlock:^(UIActionSheet *actionSheet, NSInteger buttonIndex){
                         NSLog(@"Tapped '%@' at index %ld", [actionSheet buttonTitleAtIndex:buttonIndex], (long)buttonIndex);
                     }];
}

@end
