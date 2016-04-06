//
//  Target_A.m
//  BYXMediator
//
//  Created by bianyixuan on 16/4/5.
//  Copyright © 2016年 jzsec-byx. All rights reserved.
//

#import "Target_A.h"

#import "DemoModuleDetailViewController.h"

typedef void (^alertCallBackBlock)(NSDictionary *dic);

@implementation Target_A

-(UIViewController *)Action_nativeFetchDetailViewController:(NSDictionary *)params
{
    DemoModuleDetailViewController *viewController=[[DemoModuleDetailViewController alloc] init];
    viewController.valueLabel.text=params[@"key"];
    return viewController;
}

-(UIViewController *)Action_nativePresentImage:(NSDictionary *)params
{
    DemoModuleDetailViewController *viewController=[[DemoModuleDetailViewController alloc] init];
    viewController.valueLabel.text=@"this is a image";
    viewController.imageView.image=params[@"image"];
    return viewController;
}

-(UIViewController *)Action_nativePresentNoImage:(NSDictionary *)params
{
    DemoModuleDetailViewController *viewController=[[DemoModuleDetailViewController alloc] init];
    viewController.valueLabel.text=@"this is a image";
    viewController.imageView.image=params[@"image"];
    return viewController;
}

-(UIViewController *)Action_showAlert:(NSDictionary *)params
{
    UIAlertAction *cancelAction=[UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        alertCallBackBlock callback=params[@"cancel"];
        if (callback) {
            callback(@{@"alertAction":callback});
        }
    }];
    
    UIAlertAction *confirmAction=[UIAlertAction actionWithTitle:@"confirm" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        alertCallBackBlock callback=params[@"confirm"];
        if (callback) {
            callback(@{@"confirmAction":callback});
        }
    }];
    
    UIAlertController *alertController=[UIAlertController alertControllerWithTitle:@"title" message:params[@"message"] preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addAction:cancelAction];
    [alertController addAction:confirmAction];
    
    return alertController;

}

@end
