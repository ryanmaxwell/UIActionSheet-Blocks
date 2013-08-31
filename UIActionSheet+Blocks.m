//
//  UIActionSheet+Blocks.m
//  UIActionSheetBlocks
//
//  Created by Ryan Maxwell on 31/08/13.
//  Copyright (c) 2013 Ryan Maxwell. All rights reserved.
//

#import "UIActionSheet+Blocks.h"

@interface UIActionSheetBlocksManager : NSObject <UIActionSheetDelegate>

@property (strong, nonatomic) NSMutableDictionary *completionBlocks;

+ (instancetype)sharedInstance;

- (void)setCompletionBlock:(UIActionSheetCompletionBlock)completion
            forActionSheet:(UIActionSheet *)actionSheet;

@end

@implementation UIActionSheetBlocksManager

+ (instancetype)sharedInstance {
    static id instance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    
    return instance;
}

- (id)init {
    self = [super init];
    
    if (self) {
        _completionBlocks = [NSMutableDictionary dictionary];
    }
    return self;
}

- (void)setCompletionBlock:(UIActionSheetCompletionBlock)completion
            forActionSheet:(UIActionSheet *)actionSheet {
    
    if (completion) {
        NSString *hashString = [NSString stringWithFormat:@"%d", actionSheet.hash];
        self.completionBlocks[hashString] = completion;
    }
}

#pragma mark - UIActionSheetDelegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    actionSheet.delegate = nil;
    
    NSString *hashString = [NSString stringWithFormat:@"%d", actionSheet.hash];
    
    UIActionSheetCompletionBlock completion = self.completionBlocks[hashString];
    
    if (completion) {
        completion(actionSheet, buttonIndex);
        
        [self.completionBlocks removeObjectForKey:hashString];
    }
}

@end

@implementation UIActionSheet (Blocks)

+ (void)showFromTabBar:(UITabBar *)tabBar
             withTitle:(NSString *)title
     cancelButtonTitle:(NSString *)cancelButtonTitle
destructiveButtonTitle:(NSString *)destructiveButtonTitle
     otherButtonTitles:(NSArray *)otherButtonTitles
            completion:(UIActionSheetCompletionBlock)completion {
    
    UIActionSheet *actionSheet = [[self alloc] initWithTitle:title
                                                    delegate:nil
                                           cancelButtonTitle:cancelButtonTitle
                                      destructiveButtonTitle:destructiveButtonTitle
                                           otherButtonTitles:nil];
    
    for (NSString *buttonTitle in otherButtonTitles) {
        [actionSheet addButtonWithTitle:buttonTitle];
    }
    
    if (completion) {
        actionSheet.delegate = [UIActionSheetBlocksManager sharedInstance];
        [[UIActionSheetBlocksManager sharedInstance] setCompletionBlock:completion forActionSheet:actionSheet];
    }
    
    [actionSheet showFromTabBar:tabBar];
}

+ (void)showFromToolbar:(UIToolbar *)toolbar
              withTitle:(NSString *)title
      cancelButtonTitle:(NSString *)cancelButtonTitle
 destructiveButtonTitle:(NSString *)destructiveButtonTitle
      otherButtonTitles:(NSArray *)otherButtonTitles
             completion:(UIActionSheetCompletionBlock)completion {
    
    UIActionSheet *actionSheet = [[self alloc] initWithTitle:title
                                                    delegate:nil
                                           cancelButtonTitle:cancelButtonTitle
                                      destructiveButtonTitle:destructiveButtonTitle
                                           otherButtonTitles:nil];
    
    for (NSString *buttonTitle in otherButtonTitles) {
        [actionSheet addButtonWithTitle:buttonTitle];
    }
    
    if (completion) {
        actionSheet.delegate = [UIActionSheetBlocksManager sharedInstance];
        [[UIActionSheetBlocksManager sharedInstance] setCompletionBlock:completion forActionSheet:actionSheet];
    }
    
    [actionSheet showFromToolbar:toolbar];
}

+ (void)showInView:(UIView *)view
         withTitle:(NSString *)title
 cancelButtonTitle:(NSString *)cancelButtonTitle
destructiveButtonTitle:(NSString *)destructiveButtonTitle
 otherButtonTitles:(NSArray *)otherButtonTitles
        completion:(UIActionSheetCompletionBlock)completion {
    
    UIActionSheet *actionSheet = [[self alloc] initWithTitle:title
                                                    delegate:nil
                                           cancelButtonTitle:cancelButtonTitle
                                      destructiveButtonTitle:destructiveButtonTitle
                                           otherButtonTitles:nil];
    
    for (NSString *buttonTitle in otherButtonTitles) {
        [actionSheet addButtonWithTitle:buttonTitle];
    }
    
    if (completion) {
        actionSheet.delegate = [UIActionSheetBlocksManager sharedInstance];
        [[UIActionSheetBlocksManager sharedInstance] setCompletionBlock:completion forActionSheet:actionSheet];
    }
    
    [actionSheet showInView:view];
}

+ (void)showFromBarButtonItem:(UIBarButtonItem *)barButtonItem
                     animated:(BOOL)animated
                    withTitle:(NSString *)title
            cancelButtonTitle:(NSString *)cancelButtonTitle
       destructiveButtonTitle:(NSString *)destructiveButtonTitle
            otherButtonTitles:(NSArray *)otherButtonTitles
                   completion:(UIActionSheetCompletionBlock)completion {
    
    UIActionSheet *actionSheet = [[self alloc] initWithTitle:title
                                                    delegate:nil
                                           cancelButtonTitle:cancelButtonTitle
                                      destructiveButtonTitle:destructiveButtonTitle
                                           otherButtonTitles:nil];
    
    for (NSString *buttonTitle in otherButtonTitles) {
        [actionSheet addButtonWithTitle:buttonTitle];
    }
    
    if (completion) {
        actionSheet.delegate = [UIActionSheetBlocksManager sharedInstance];
        [[UIActionSheetBlocksManager sharedInstance] setCompletionBlock:completion forActionSheet:actionSheet];
    }
    
    [actionSheet showFromBarButtonItem:barButtonItem animated:animated];
}

+ (void)showFromRect:(CGRect)rect
              inView:(UIView *)view
            animated:(BOOL)animated
           withTitle:(NSString *)title
   cancelButtonTitle:(NSString *)cancelButtonTitle
destructiveButtonTitle:(NSString *)destructiveButtonTitle
   otherButtonTitles:(NSArray *)otherButtonTitles
          completion:(UIActionSheetCompletionBlock)completion {
    
    UIActionSheet *actionSheet = [[self alloc] initWithTitle:title
                                                    delegate:nil
                                           cancelButtonTitle:cancelButtonTitle
                                      destructiveButtonTitle:destructiveButtonTitle
                                           otherButtonTitles:nil];
    
    for (NSString *buttonTitle in otherButtonTitles) {
        [actionSheet addButtonWithTitle:buttonTitle];
    }
    
    if (completion) {
        actionSheet.delegate = [UIActionSheetBlocksManager sharedInstance];
        [[UIActionSheetBlocksManager sharedInstance] setCompletionBlock:completion forActionSheet:actionSheet];
    }
    
    [actionSheet showFromRect:rect inView:view animated:animated];
}

@end
