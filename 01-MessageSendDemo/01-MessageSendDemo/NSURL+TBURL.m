//
//  NSURL+TBURL.m
//  01-MessageSendDemo
//
//  Created by 田彬彬 on 2017/6/18.
//  Copyright © 2017年 田彬彬. All rights reserved.
//

#import "NSURL+TBURL.h"
#import <objc/message.h>

@implementation NSURL (TBURL)

+(void)load
{
    // 这个类会首先走这个方法
    // 拿到两个方法(Method) 然后同归runtime 提供的方法交换函数 进行交换
    // 拿到两个Method
    // class_getClassMethod()           拿到一个类的类方法
    // class_getInstanceMethod()        拿到一个类的对象方法
    
    Method  urlWith = class_getClassMethod([NSURL class], @selector(URLWithString:));
    Method  TB_URL =  class_getClassMethod([NSURL class], @selector(TBURLWithStr:));
    
    // 交换方法
    method_exchangeImplementations(urlWith, TB_URL);

}


//  写上注释
+(instancetype)TBURLWithStr:(NSString *)str
{
    NSURL * url = [NSURL TBURLWithStr:str];
    
    if(url == nil){
    
        NSLog(@"url 为空");
    }
    
    return  url;
}


@end
