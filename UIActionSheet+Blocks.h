//
//  UIActionSheet+Blocks.h
//  UIActionSheetBlocks
//
//  Created by Ryan Maxwell on 31/08/13.
//  Copyright (c) 2013 Ryan Maxwell. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^UIActionSheetCompletionBlock) (UIActionSheet *actionSheet, NSInteger buttonIndex);

@interface UIActionSheet (Blocks)

+ (void)showFromTabBar:(UITabBar *)tabBar
             withTitle:(NSString *)title
     cancelButtonTitle:(NSString *)cancelButtonTitle
destructiveButtonTitle:(NSString *)destructiveButtonTitle
     otherButtonTitles:(NSArray *)otherButtonTitles
              tapBlock:(UIActionSheetCompletionBlock)tapBlock;

+ (void)showFromToolbar:(UIToolbar *)toolbar
              withTitle:(NSString *)title
      cancelButtonTitle:(NSString *)cancelButtonTitle
 destructiveButtonTitle:(NSString *)destructiveButtonTitle
      otherButtonTitles:(NSArray *)otherButtonTitles
               tapBlock:(UIActionSheetCompletionBlock)tapBlock;

+ (void)showInView:(UIView *)view
         withTitle:(NSString *)title
 cancelButtonTitle:(NSString *)cancelButtonTitle
destructiveButtonTitle:(NSString *)destructiveButtonTitle
 otherButtonTitles:(NSArray *)otherButtonTitles
          tapBlock:(UIActionSheetCompletionBlock)tapBlock;

+ (void)showFromBarButtonItem:(UIBarButtonItem *)barButtonItem
                     animated:(BOOL)animated
                    withTitle:(NSString *)title
            cancelButtonTitle:(NSString *)cancelButtonTitle
       destructiveButtonTitle:(NSString *)destructiveButtonTitle
            otherButtonTitles:(NSArray *)otherButtonTitles
                     tapBlock:(UIActionSheetCompletionBlock)tapBlock;

+ (void)showFromRect:(CGRect)rect
              inView:(UIView *)view
            animated:(BOOL)animated
           withTitle:(NSString *)title
   cancelButtonTitle:(NSString *)cancelButtonTitle
destructiveButtonTitle:(NSString *)destructiveButtonTitle
   otherButtonTitles:(NSArray *)otherButtonTitles
            tapBlock:(UIActionSheetCompletionBlock)tapBlock;

@end
