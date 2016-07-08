//
//  UIViewController+Addons.h
//  ScenicComplaints
//
//  Created by 凌晨 on 12/24/13.
//  Copyright (c) 2013 凌晨. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <objc/runtime.h>

typedef void(^HandleBlock)(void);
typedef void(^CancelBlock)(void);
typedef void(^OtherHandleBlock)(NSInteger index);
typedef void(^CancelWithTextBlock)(NSString *text);
typedef void(^OtherHandleWithTexteBlock)(NSString *text, NSInteger index);
typedef void(^ImagePickerHandle)(UIImage *image);

@interface UIViewController(Addons)<UIAlertViewDelegate, UIActionSheetDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
/**
 *  设置导航栏的rightItem
 *
 *  @param image  按钮图片
 *  @param handle 点击执行的方法(block)
 */
- (void)setNavigationRightItem:(UIImage *)image
                     withBlock:(HandleBlock)block;

/**
 *  设置导航栏的rightItem
 *
 *  @param image 按钮图片
 *  @param title 按钮title
 *  @param block 点击执行的方法(block)
 */
- (void)setNavigationRightItem:(UIImage *)image
                      andTitle:(NSString *)title
                     withBlock:(HandleBlock)block;

/**
 *  显示alterView
 *
 *  @param title             title
 *  @param message           message
 *  @param cancelButtonTitle 取消按钮的title
 *  @param otherButtonTitles otherButton的title数组
 *  @param cancelBlock       取消按钮执行的block
 *  @param otherBlock        other按钮执行的block
 */
- (void)showAlertViewWithTitle:(NSString *) title
                      message:(NSString *) message
            cancelButtonTitle:(NSString *) cancelButtonTitle
            otherButtonTitles:(NSArray *) otherButtonTitles
                     onCancel:(CancelBlock) cancelBlock
                      onOther:(OtherHandleBlock) otherBlock;
/**
 *  显示alertView，带输入框
 *
 *  @param title             title
 *  @param message           message
 *  @param cancelButtonTitle 取消按钮的title
 *  @param otherButtonTitles otherButton的title数组
 *  @param cancelBlock       取消按钮执行的block
 *  @param otherBlock        other按钮执行的block
 */

- (void)showFieldAlertViewWithTitle:(NSString *)title
                            message:(NSString *)message
                  cancelButtonTitle:(NSString *)cancelButtonTitle
                  otherButtonTitles:(NSArray *)otherButtonTitles
                           withText: (NSString*) text
                           onCancel:(CancelWithTextBlock)cancelBlock
                            onOther:(OtherHandleWithTexteBlock)otherBlock;


/**
 *  显示alterView，带输入框
 *
 *  @param title                  title
 *  @param cancelButtonTitle      cancelButtonTitle
 *  @param destructiveButtonTitle destructiveButtonTitle
 *  @param otherButtonTitles      otherButtonTitles数组
 *  @param cancelBlock            cancelBlock
 *  @param otherBlock             cancelBlock
 */
- (void)showActionSheetWithTitle:(NSString *)title
               cancelButtonTitle:(NSString *)cancelButtonTitle
                destructiveTitle:(NSString *)destructiveButtonTitle
               otherButtonTitles:(NSArray *)otherButtonTitles
                        onCancel:(CancelBlock)cancelBlock
                         onOther:(OtherHandleBlock)otherBlock;


/**
 *  显示一个actionSheet,选择从相册或者拍照中得到图片
 *
 *  @param complteHandle 得到照片后执行的block
 *  @param dismissHandle imagePicker dismiss后执行的block
 */
- (void)showImagePickWithActionSheet:(ImagePickerHandle)complteHandle
                  imagePickerDismiss:(HandleBlock)dismissHandle;


@end

