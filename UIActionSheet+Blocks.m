//
//  UIActionSheet+Blocks.m
//  UIActionSheetBlocks
//
//  Created by Ryan Maxwell on 31/08/13.
//  Copyright (c) 2013 Ryan Maxwell. All rights reserved.
//

#import "UIActionSheet+Blocks.h"

#import <objc/runtime.h>

static char kUIActionSheetOriginalDelegateKey;

static char kUIActionSheetTapBlockKey;
static char kUIActionSheetWillPresentBlockKey;
static char kUIActionSheetDidPresentBlockKey;
static char kUIActionSheetWillDismissBlockKey;
static char kUIActionSheetDidDismissBlockKey;
static char kUIActionSheetCancelBlockKey;

@implementation UIActionSheet (Blocks)

+ (void)showFromTabBar:(UITabBar *)tabBar
             withTitle:(NSString *)title
     cancelButtonTitle:(NSString *)cancelButtonTitle
destructiveButtonTitle:(NSString *)destructiveButtonTitle
     otherButtonTitles:(NSArray *)otherButtonTitles
              tapBlock:(UIActionSheetCompletionBlock)tapBlock {
    
    UIActionSheet *actionSheet = [[self alloc] initWithTitle:title
                                                    delegate:nil
                                           cancelButtonTitle:cancelButtonTitle
                                      destructiveButtonTitle:destructiveButtonTitle
                                           otherButtonTitles:nil];
    
    for (NSString *buttonTitle in otherButtonTitles) {
        [actionSheet addButtonWithTitle:buttonTitle];
    }
    
    if (tapBlock) {
        actionSheet.tapBlock = tapBlock;
    }
    
    [actionSheet showFromTabBar:tabBar];
}

+ (void)showFromToolbar:(UIToolbar *)toolbar
              withTitle:(NSString *)title
      cancelButtonTitle:(NSString *)cancelButtonTitle
 destructiveButtonTitle:(NSString *)destructiveButtonTitle
      otherButtonTitles:(NSArray *)otherButtonTitles
               tapBlock:(UIActionSheetCompletionBlock)tapBlock {
    
    UIActionSheet *actionSheet = [[self alloc] initWithTitle:title
                                                    delegate:nil
                                           cancelButtonTitle:cancelButtonTitle
                                      destructiveButtonTitle:destructiveButtonTitle
                                           otherButtonTitles:nil];
    
    for (NSString *buttonTitle in otherButtonTitles) {
        [actionSheet addButtonWithTitle:buttonTitle];
    }
    
    if (tapBlock) {
        actionSheet.tapBlock = tapBlock;
    }
    
    [actionSheet showFromToolbar:toolbar];
}

+ (void)showInView:(UIView *)view
         withTitle:(NSString *)title
 cancelButtonTitle:(NSString *)cancelButtonTitle
destructiveButtonTitle:(NSString *)destructiveButtonTitle
 otherButtonTitles:(NSArray *)otherButtonTitles
          tapBlock:(UIActionSheetCompletionBlock)tapBlock {
    
    UIActionSheet *actionSheet = [[self alloc] initWithTitle:title
                                                    delegate:nil
                                           cancelButtonTitle:cancelButtonTitle
                                      destructiveButtonTitle:destructiveButtonTitle
                                           otherButtonTitles:nil];
    
    for (NSString *buttonTitle in otherButtonTitles) {
        [actionSheet addButtonWithTitle:buttonTitle];
    }
    
    if (tapBlock) {
        actionSheet.tapBlock = tapBlock;
    }
    
    [actionSheet showInView:view];
}

+ (void)showFromBarButtonItem:(UIBarButtonItem *)barButtonItem
                     animated:(BOOL)animated
                    withTitle:(NSString *)title
            cancelButtonTitle:(NSString *)cancelButtonTitle
       destructiveButtonTitle:(NSString *)destructiveButtonTitle
            otherButtonTitles:(NSArray *)otherButtonTitles
                     tapBlock:(UIActionSheetCompletionBlock)tapBlock {
    
    UIActionSheet *actionSheet = [[self alloc] initWithTitle:title
                                                    delegate:nil
                                           cancelButtonTitle:cancelButtonTitle
                                      destructiveButtonTitle:destructiveButtonTitle
                                           otherButtonTitles:nil];
    
    for (NSString *buttonTitle in otherButtonTitles) {
        [actionSheet addButtonWithTitle:buttonTitle];
    }
    
    if (tapBlock) {
        actionSheet.tapBlock = tapBlock;
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
            tapBlock:(UIActionSheetCompletionBlock)tapBlock {
    
    UIActionSheet *actionSheet = [[self alloc] initWithTitle:title
                                                    delegate:nil
                                           cancelButtonTitle:cancelButtonTitle
                                      destructiveButtonTitle:destructiveButtonTitle
                                           otherButtonTitles:nil];
    
    for (NSString *buttonTitle in otherButtonTitles) {
        [actionSheet addButtonWithTitle:buttonTitle];
    }
    
    if (tapBlock) {
        actionSheet.tapBlock = tapBlock;
    }
    
    [actionSheet showFromRect:rect inView:view animated:animated];
}

#pragma mark -

- (UIActionSheetCompletionBlock)tapBlock {
    return objc_getAssociatedObject(self, &kUIActionSheetTapBlockKey);
}

- (void)setTapBlock:(UIActionSheetCompletionBlock)tapBlock {
    
    if (self.delegate != (id<UIActionSheetDelegate>)self) {
        objc_setAssociatedObject(self, &kUIActionSheetOriginalDelegateKey, self.delegate, OBJC_ASSOCIATION_ASSIGN);
        self.delegate = (id<UIActionSheetDelegate>)self;
    }
    
    objc_setAssociatedObject(self, &kUIActionSheetTapBlockKey, tapBlock, OBJC_ASSOCIATION_COPY);
}

- (UIActionSheetCompletionBlock)willDismissBlock {
    return objc_getAssociatedObject(self, &kUIActionSheetWillDismissBlockKey);
}

- (void)setWillDismissBlock:(UIActionSheetCompletionBlock)willDismissBlock {
    
    if (self.delegate != (id<UIActionSheetDelegate>)self) {
        objc_setAssociatedObject(self, &kUIActionSheetOriginalDelegateKey, self.delegate, OBJC_ASSOCIATION_ASSIGN);
        self.delegate = (id<UIActionSheetDelegate>)self;
    }
    
    objc_setAssociatedObject(self, &kUIActionSheetWillDismissBlockKey, willDismissBlock, OBJC_ASSOCIATION_COPY);
}

- (UIActionSheetCompletionBlock)didDismissBlock {
    return objc_getAssociatedObject(self, &kUIActionSheetDidDismissBlockKey);
}

- (void)setDidDismissBlock:(UIActionSheetCompletionBlock)didDismissBlock {
    
    if (self.delegate != (id<UIActionSheetDelegate>)self) {
        objc_setAssociatedObject(self, &kUIActionSheetOriginalDelegateKey, self.delegate, OBJC_ASSOCIATION_ASSIGN);
        self.delegate = (id<UIActionSheetDelegate>)self;
    }
    
    objc_setAssociatedObject(self, &kUIActionSheetDidDismissBlockKey, didDismissBlock, OBJC_ASSOCIATION_COPY);
}

- (UIActionSheetBlock)willPresentBlock {
    return objc_getAssociatedObject(self, &kUIActionSheetWillPresentBlockKey);
}

- (void)setWillPresentBlock:(UIActionSheetBlock)willPresentBlock {
    
    if (self.delegate != (id<UIActionSheetDelegate>)self) {
        objc_setAssociatedObject(self, &kUIActionSheetOriginalDelegateKey, self.delegate, OBJC_ASSOCIATION_ASSIGN);
        self.delegate = (id<UIActionSheetDelegate>)self;
    }
    
    objc_setAssociatedObject(self, &kUIActionSheetWillPresentBlockKey, willPresentBlock, OBJC_ASSOCIATION_COPY);
}

- (UIActionSheetBlock)didPresentBlock {
    return objc_getAssociatedObject(self, &kUIActionSheetDidPresentBlockKey);
}

- (void)setDidPresentBlock:(UIActionSheetBlock)didPresentBlock {
    
    if (self.delegate != (id<UIActionSheetDelegate>)self) {
        objc_setAssociatedObject(self, &kUIActionSheetOriginalDelegateKey, self.delegate, OBJC_ASSOCIATION_ASSIGN);
        self.delegate = (id<UIActionSheetDelegate>)self;
    }
    
    objc_setAssociatedObject(self, &kUIActionSheetDidPresentBlockKey, didPresentBlock, OBJC_ASSOCIATION_COPY);
}

- (UIActionSheetBlock)cancelBlock {
    return objc_getAssociatedObject(self, &kUIActionSheetCancelBlockKey);
}

- (void)setCancelBlock:(UIActionSheetBlock)cancelBlock {
    
    if (self.delegate != (id<UIActionSheetDelegate>)self) {
        objc_setAssociatedObject(self, &kUIActionSheetOriginalDelegateKey, self.delegate, OBJC_ASSOCIATION_ASSIGN);
        self.delegate = (id<UIActionSheetDelegate>)self;
    }
    
    objc_setAssociatedObject(self, &kUIActionSheetCancelBlockKey, cancelBlock, OBJC_ASSOCIATION_COPY);
}

#pragma mark - UIActionSheetDelegate

- (void)willPresentActionSheet:(UIActionSheet *)actionSheet {
    UIActionSheetBlock completion = actionSheet.willPresentBlock;
    
    if (completion) {
        completion(actionSheet);
    }
    
    id originalDelegate = objc_getAssociatedObject(self, &kUIActionSheetOriginalDelegateKey);
    if (originalDelegate && [originalDelegate respondsToSelector:@selector(willPresentActionSheet:)]) {
        [originalDelegate willPresentActionSheet:actionSheet];
    }
}

- (void)didPresentActionSheet:(UIActionSheet *)actionSheet {
    UIActionSheetBlock completion = actionSheet.didPresentBlock;
    
    if (completion) {
        completion(actionSheet);
    }
    
    id originalDelegate = objc_getAssociatedObject(self, &kUIActionSheetOriginalDelegateKey);
    if (originalDelegate && [originalDelegate respondsToSelector:@selector(didPresentActionSheet:)]) {
        [originalDelegate didPresentActionSheet:actionSheet];
    }
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSLog(@"HERE");
    UIActionSheetCompletionBlock completion = actionSheet.tapBlock;
    
    if (completion) {
        completion(actionSheet, buttonIndex);
    }
    
    id originalDelegate = objc_getAssociatedObject(self, &kUIActionSheetOriginalDelegateKey);
    if (originalDelegate && [originalDelegate respondsToSelector:@selector(actionSheet:clickedButtonAtIndex:)]) {
        [originalDelegate actionSheet:actionSheet clickedButtonAtIndex:buttonIndex];
    }
}

- (void)actionSheetCancel:(UIActionSheet *)actionSheet {
    UIActionSheetBlock completion = actionSheet.cancelBlock;
    
    if (completion) {
        completion(actionSheet);
    }
    
    id originalDelegate = objc_getAssociatedObject(self, &kUIActionSheetOriginalDelegateKey);
    if (originalDelegate && [originalDelegate respondsToSelector:@selector(actionSheetCancel:)]) {
        [originalDelegate actionSheetCancel:actionSheet];
    }
}

- (void)actionSheet:(UIActionSheet *)actionSheet willDismissWithButtonIndex:(NSInteger)buttonIndex {
    UIActionSheetCompletionBlock completion = actionSheet.willDismissBlock;
    
    if (completion) {
        completion(actionSheet, buttonIndex);
    }
    
    id originalDelegate = objc_getAssociatedObject(self, &kUIActionSheetOriginalDelegateKey);
    if (originalDelegate && [originalDelegate respondsToSelector:@selector(actionSheet:willDismissWithButtonIndex:)]) {
        [originalDelegate actionSheet:actionSheet willDismissWithButtonIndex:buttonIndex];
    }
}

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex {
    UIActionSheetCompletionBlock completion = actionSheet.didDismissBlock;
    
    if (completion) {
        completion(actionSheet, buttonIndex);
    }
    
    id originalDelegate = objc_getAssociatedObject(self, &kUIActionSheetOriginalDelegateKey);
    if (originalDelegate && [originalDelegate respondsToSelector:@selector(actionSheet:didDismissWithButtonIndex:)]) {
        [originalDelegate actionSheet:actionSheet didDismissWithButtonIndex:buttonIndex];
    }
}

@end
