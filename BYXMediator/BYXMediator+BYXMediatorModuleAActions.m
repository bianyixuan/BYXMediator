//
//  BYXMediator+BYXMediatorModuleAActions.m
//  BYXMediator
//
//  Created by bianyixuan on 16/4/5.
//  Copyright © 2016年 jzsec-byx. All rights reserved.
//

#import "BYXMediator+BYXMediatorModuleAActions.h"


NSString * const kBYXMediatorTargetA = @"A";
NSString * const kBYXMediatorActionNativFetchDetailViewController = @"nativeFetchDetailViewController";
NSString * const kBYXMediatorActionNativPresentImage = @"nativePresentImage";
NSString * const kBYXMediatorActionNativPresentNoImage = @"nativePresentNoImage";
NSString * const kBYXMediatorActionAlertView = @"showAlert";

@implementation BYXMediator (BYXMediatorModuleAActions)


-(UIViewController *)BYXMediator_viewControllerForDetail
{
    UIViewController *viewController=[self performTarget:kBYXMediatorTargetA action:kBYXMediatorActionNativFetchDetailViewController params:@{@"key":@"value"}];
    
    if (viewController!=nil) {
        //将ViewController交付出去，让用户选择present或者push
        return viewController;
    }else{
        return [[UIViewController alloc] init];
    }
}

-(UIViewController *)BYXMediator_presentImage:(UIImage *)image
{
    UIViewController *viewController;

    if (image) {
        viewController=[self performTarget:kBYXMediatorTargetA action:kBYXMediatorActionNativPresentImage params:@{@"image":image}];
    }else{
        image=[UIImage imageNamed:@"noImage"];
        viewController=[self performTarget:kBYXMediatorTargetA action:kBYXMediatorActionNativPresentNoImage params:@{@"image":image}];
    }
    if (viewController!=nil) {
        //将ViewController交付出去，让用户选择present或者push
        return viewController;
    }else{
        return [[UIViewController alloc] init];
    }
    
}

-(UIAlertController *)BYXMediator_showAlertWithMessage:(NSString *)message cancelAction:(void (^)(NSDictionary *))cancelAction confirmAction:(void (^)(NSDictionary *))confirmAction
{
    NSMutableDictionary *params=[[NSMutableDictionary alloc] init];
    if (message) {
        params[@"message"]=message;
    }
    if (cancelAction) {
        params[@"cancel"]=cancelAction;
    }
    if (confirmAction) {
        params[@"confirm"]=confirmAction;
    }
    
    return  [self performTarget:kBYXMediatorTargetA action:kBYXMediatorActionAlertView params:params];
}

@end
