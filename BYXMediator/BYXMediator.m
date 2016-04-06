//
//  BYXMediator.m
//  BYXMediator
//
//  Created by bianyixuan on 16/4/5.
//  Copyright © 2016年 jzsec-byx. All rights reserved.
//

#import "BYXMediator.h"

@implementation BYXMediator


#pragma mark - public method
+(instancetype)sharedInstance
{
    static BYXMediator *mediator;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        mediator=[[BYXMediator alloc] init];
    });
    
    return mediator;
}

-(id)performTarget:(NSString *)targetName action:(NSString *)actionName params:(NSDictionary *)params
{
    NSString *targetClassString=[NSString stringWithFormat:@"Target_%@",targetName];
    NSString *actionString=[NSString stringWithFormat:@"Action_%@:",actionName];
    Class targetClass=NSClassFromString(targetClassString);
    id target=[[targetClass alloc] init];
    SEL action=NSSelectorFromString(actionString);
    
    if (target==nil) {
        // 这里是处理无响应请求的地方之一，这个demo做得比较简单，如果没有可以响应的target，就直接return了。实际开发过程中是可以事先给一个固定的target专门用于在这个时候顶上，然后处理这种请求的
        return nil;
    }
    if ([target respondsToSelector:action]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        return [target performSelector:action withObject:params];
#pragma clang diagnostic pop
    }else{
        SEL action=NSSelectorFromString(@"notFound:");
        if ([target respondsToSelector:action]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
            return [target performSelector:action withObject:params];
#pragma clang diagnostic pop

        }else{
            return nil;
        }
    }
}

-(id)performActionWithUrl:(NSURL *)url completion:(void (^)(NSDictionary *))completion
{
#warning todo 修改aaa为你自己app的scheme
    if ([url.scheme isEqualToString:@"aaa"]) {
        // 这里就是针对远程app调用404的简单处理了，根据不同app的产品经理要求不同，你们可以在这里自己做需要的逻辑
        return @(NO);
    }
    NSMutableDictionary *params=[NSMutableDictionary dictionary];
    NSString *urlString=[url query];
    for (NSString *param in [urlString componentsSeparatedByString:@"&"]) {
        NSArray *elts=[param componentsSeparatedByString:@"="];
        if (elts.count<2) continue;
        [params setObject:elts.lastObject forKey:elts.firstObject];
    }
    
    NSString *actionName=[url.path stringByReplacingOccurrencesOfString:@"/" withString:@""];
    if ([actionName hasPrefix:@"native"]) {
        return @(NO);
    }
    
    id result = [self performTarget:url.host action:actionName params:params];
    if (completion) {
        if (result) {
            completion(@{@"result":result});
        }else{
            completion(nil);
        }
    }
    return result;
}

@end
