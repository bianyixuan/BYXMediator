//
//  BYXMediator+BYXMediatorModuleAActions.h
//  BYXMediator
//
//  Created by bianyixuan on 16/4/5.
//  Copyright © 2016年 jzsec-byx. All rights reserved.
//

#import "BYXMediator.h"
#import <UIKit/UIKit.h>
@interface BYXMediator (BYXMediatorModuleAActions)

- (UIViewController *)BYXMediator_viewControllerForDetail;

-(UIViewController *)BYXMediator_presentImage:(UIImage *)image;


-(UIAlertController *)BYXMediator_showAlertWithMessage:(NSString *)massage cancelAction:(void(^)(NSDictionary *dic))cancelAction confirmAction:(void(^)(NSDictionary *dic))confirmAction;

@end
