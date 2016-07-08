//
//  UIViewController+Addons.m
//  ScenicComplaints
//
//  Created by 凌晨 on 12/24/13.
//  Copyright (c) 2013 凌晨. All rights reserved.
//

#import "UIViewController+Addons.h"
static char kVCActionHandleTouchUpInsideBlockKey;
static char kVCActionHandleButtonKey;
static char kVCActionHandleAlertCancelBlockKey;
static char kVCActionHandleAlertOtherBlockKey;

static char kVCActionHandleSheetCancelBlockKey;
static char kVCActionHandleSheetOtherBlockKey;

static char kVCImagePickerHandleBlockKey;
static char kVCImagePickerDismissBlocKey;


@implementation UIViewController(Addons)

-(void)setNavigationRightItem:(UIImage *)image
                    withBlock:(HandleBlock)block{
    [self setNavigationRightItem:image andTitle:nil withBlock:block];
}

-(void)setNavigationRightItem:(UIImage *)image
                     andTitle:(NSString *)title
                    withBlock:(HandleBlock)block{
    UIButton *associateButton = objc_getAssociatedObject(self, &kVCActionHandleButtonKey);
    
    if(associateButton == nil){
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        
        if (image) {
            button.frame = CGRectMake(0, 0, image.size.width, image.size.height);
            [button setBackgroundImage:image forState:UIControlStateNormal];
        }
        else{
            CGSize titeSize = CGSizeZero;
            if ([UIDevice currentDevice].systemName.floatValue >= 7.0f) {
                titeSize = [title boundingRectWithSize:CGSizeMake(MAXFLOAT, 40) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:16]} context:nil].size;
            }
            else
            {                
                titeSize = [title boundingRectWithSize: CGSizeMake(MAXFLOAT, 40)
                                               options: NSStringDrawingUsesFontLeading
                                            attributes: nil
                                               context: nil].size;
            }
            button.frame = CGRectMake(0, 0, titeSize.width, titeSize.height);
        }
        
        [button setTitle:title forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:16];
        [button addTarget:self action:@selector(__handleActionForTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:button];
        self.navigationItem.rightBarButtonItem = rightItem;
        objc_setAssociatedObject(self, &kVCActionHandleButtonKey, button, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    objc_setAssociatedObject(self, &kVCActionHandleTouchUpInsideBlockKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(void)__handleActionForTouchUpInside:(UIButton *)button{
    HandleBlock block = objc_getAssociatedObject(self, &kVCActionHandleTouchUpInsideBlockKey);
    if(block){
        block();
    }
}

-(void)showAlertViewWithTitle:(NSString *)title
                      message:(NSString *)message
            cancelButtonTitle:(NSString *)cancelButtonTitle
            otherButtonTitles:(NSArray *)otherButtonTitles
                     onCancel:(CancelBlock)cancelBlock
                      onOther:(OtherHandleBlock)otherBlock{
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:title message:message delegate:self cancelButtonTitle:cancelButtonTitle otherButtonTitles:nil];
    
    for(NSString *buttonTitle in otherButtonTitles){
        [alertView addButtonWithTitle:buttonTitle];
    }
    objc_setAssociatedObject(self, &kVCActionHandleAlertCancelBlockKey, cancelBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &kVCActionHandleAlertOtherBlockKey, otherBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [alertView show];
}


- (void)showFieldAlertViewWithTitle:(NSString *)title
                            message:(NSString *)message
                  cancelButtonTitle:(NSString *)cancelButtonTitle
                  otherButtonTitles:(NSArray *)otherButtonTitles
                           withText: (NSString*) text
                           onCancel:(CancelWithTextBlock)cancelBlock
                            onOther:(OtherHandleWithTexteBlock)otherBlock{
    
    UIAlertView *alertView = nil;
    
    alertView = [[UIAlertView alloc]initWithTitle:title message:message delegate:self cancelButtonTitle:cancelButtonTitle otherButtonTitles:nil];
alertView.alertViewStyle = UIAlertViewStylePlainTextInput;
    [[alertView textFieldAtIndex: 0] setText: text];
    
    for(NSString *buttonTitle in otherButtonTitles){
        [alertView addButtonWithTitle:buttonTitle];
    }
    objc_setAssociatedObject(self, &kVCActionHandleAlertCancelBlockKey, cancelBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &kVCActionHandleAlertOtherBlockKey, otherBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [alertView show];

}


#pragma mark - UIAlterView Delegate Method
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(alertView.alertViewStyle == UIAlertViewStyleDefault){
        if(buttonIndex == alertView.cancelButtonIndex){
            CancelBlock cancelBlock = objc_getAssociatedObject(self, &kVCActionHandleAlertCancelBlockKey);
            if(cancelBlock){
                cancelBlock();
            }
        }
        else{
            OtherHandleBlock otherBlock = objc_getAssociatedObject(self, &kVCActionHandleAlertOtherBlockKey);
            if(otherBlock){
                otherBlock(buttonIndex - 1);
            }
        }

    }
    else{
        if(buttonIndex==alertView.cancelButtonIndex){
            CancelWithTextBlock cancelTextBlock = objc_getAssociatedObject(self, &kVCActionHandleAlertCancelBlockKey);
            if(cancelTextBlock){
                cancelTextBlock([alertView textFieldAtIndex:0].text);
            }
        }
        else{
            OtherHandleWithTexteBlock otherTextBlock = objc_getAssociatedObject(self, &kVCActionHandleAlertOtherBlockKey);
            if(otherTextBlock){
                otherTextBlock([alertView textFieldAtIndex:0].text, buttonIndex - 1);
            }
        }

    }
}

- (void)showActionSheetWithTitle:(NSString *)title
               cancelButtonTitle:(NSString *)cancelButtonTitle
                destructiveTitle:(NSString *)destructiveButtonTitle
               otherButtonTitles:(NSArray *)otherButtonTitles
                        onCancel:(CancelBlock)cancelBlock
                         onOther:(OtherHandleBlock)otherBlock{
    
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:title
                                                            delegate:self
                                                   cancelButtonTitle:nil
                                              destructiveButtonTitle:destructiveButtonTitle
                                                   otherButtonTitles:nil, nil];
    
    [otherButtonTitles enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [actionSheet addButtonWithTitle:obj];
    }];
    
    actionSheet.cancelButtonIndex = [actionSheet addButtonWithTitle:cancelButtonTitle];
    
    objc_setAssociatedObject(self, &kVCActionHandleSheetCancelBlockKey, cancelBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &kVCActionHandleSheetOtherBlockKey, otherBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
//    UIView *topView = [[UIApplication sharedApplication].keyWindow;
    [actionSheet showInView:[UIApplication sharedApplication].keyWindow];
    
}

- (void)showImagePickWithActionSheet:(ImagePickerHandle)complteHandle
                  imagePickerDismiss:(HandleBlock)dismissHandle{
    
    [self showActionSheetWithTitle:@"选择方式" cancelButtonTitle:@"取消" destructiveTitle:nil otherButtonTitles:@[@"拍照", @"相册"] onCancel:nil onOther:^(NSInteger index) {
        UIImagePickerController *PC = [[UIImagePickerController alloc]init];
        PC.delegate = self;
        if (index == 0) {
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
                PC.sourceType = UIImagePickerControllerSourceTypeCamera;
                PC.allowsEditing = NO;
            }
            else{
                [self showAlertViewWithTitle:@"不支持此硬件" message:nil cancelButtonTitle:nil otherButtonTitles:@[@"确定"] onCancel:nil onOther:nil];
            }
        }
        else{
            
            PC.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        }
        
        [self presentViewController:PC animated:YES completion:nil];
        
        objc_setAssociatedObject(self, &kVCImagePickerHandleBlockKey, complteHandle, OBJC_ASSOCIATION_COPY_NONATOMIC);
        objc_setAssociatedObject(self, &kVCImagePickerDismissBlocKey, dismissHandle, OBJC_ASSOCIATION_COPY_NONATOMIC);
    }];
}

#pragma mark - UIActionSheet Delegate Method
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if(buttonIndex == actionSheet.cancelButtonIndex){
        CancelBlock cancelBlock = objc_getAssociatedObject(self, &kVCActionHandleSheetCancelBlockKey);
        if(cancelBlock){
            cancelBlock();
        }
    }
    else{
        OtherHandleBlock otherBlock = objc_getAssociatedObject(self, &kVCActionHandleSheetOtherBlockKey);
        if(otherBlock){
            otherBlock(buttonIndex);
        }
    }
}


#pragma mark - UIImagePickerControllerDelegate Method

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    
    if ([mediaType isEqualToString:@"public.image"]) {
        UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
        ImagePickerHandle handle = objc_getAssociatedObject(self, &kVCImagePickerHandleBlockKey);
        if (handle) {
            handle(image);
        }
    }
    [picker dismissViewControllerAnimated:YES completion:^{
        HandleBlock handle = objc_getAssociatedObject(self, &kVCImagePickerDismissBlocKey);
        if (handle) {
            handle();
        }
    }];
    
}


@end
