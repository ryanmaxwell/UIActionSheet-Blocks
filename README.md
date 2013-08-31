UIActionSheetBlocks
===================

Category on UIActionSheet to use inline block callbacks instead of delegate callbacks.

UIActionSheet was created in a time before blocks, ARC, and judging by its naming – touch screens too. Who “clicks” on an action sheet anyway?

Lets modernize this shizzle with some blocks goodness.

```objc
typedef void (^UIActionSheetCompletionBlock) (UIActionSheet *actionSheet, NSInteger buttonIndex);
```

Create and show the action sheet in a single call:

```objc
+ (void)showInView:(UIView *)view
         withTitle:(NSString *)title
 cancelButtonTitle:(NSString *)cancelButtonTitle
destructiveButtonTitle:(NSString *)destructiveButtonTitle
 otherButtonTitles:(NSArray *)otherButtonTitles
        completion:(UIActionSheetCompletionBlock)completion;
```

The full suite of action methods are supported, including `showFromTabBar:`, `showFromToolbar:`, `showInView:`, `showFromBarButtonItem:animated:` and `showFromRect:inView:animated`.

## Requirements

ARC - so iOS 4.3 or later

## Usage

Add `UIActionSheet+Blocks.h/m` into your project, or `pod 'UIActionSheetBlocks'` using CocoaPods.

## Alert Views

If you’d like similar functionality on UIAlertView too, check out twin-sister [UIAlertViewBlocks](https://github.com/ryanmaxwell/UIAlertViewBlocks).