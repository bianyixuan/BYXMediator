//
//  BYXMediator.h
//  BYXMediator
//
//  Created by bianyixuan on 16/4/5.
//  Copyright © 2016年 jzsec-byx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BYXMediator : NSObject


+(instancetype)sharedInstance;

//本地组件调用入口
-(id)performTarget:(NSString *)targetName action:(NSString *)actionName params:(NSDictionary *)params;

//远程组件调用入口
-(id)performActionWithUrl:(NSURL *)url completion:(void(^)(NSDictionary *info))completion;

@end
