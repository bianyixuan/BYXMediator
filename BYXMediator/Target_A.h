//
//  Target_A.h
//  BYXMediator
//
//  Created by bianyixuan on 16/4/5.
//  Copyright © 2016年 jzsec-byx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Target_A : NSObject

-(UIViewController *)Action_nativeFetchDetailViewController:(NSDictionary *)params;


-(UIViewController *)Action_nativePresentImage:(NSDictionary *)params;


-(UIViewController *)Action_nativePresentNoImage:(NSDictionary *)params;


-(UIViewController *)Action_showAlert:(NSDictionary *)params;

@end
