//
//  Person.m
//  01-MessageSendDemo
//
//  Created by 田彬彬 on 2017/6/18.
//  Copyright © 2017年 田彬彬. All rights reserved.
//

#import "Person.h"
#import <objc/message.h>
@implementation Person


void TBeatFood(id self,SEL _cmd){

    NSLog(@"我要去吃东西 我调用了什么方法 %@----%@",self,NSStringFromSelector(_cmd));
}

void TBeatFood1(id self,SEL _cmd,id objc){

     NSLog(@"我要去休息了 我调用了什么方法 %@",objc);
}


-(void)eat
{
    NSLog(@"吃东西");
}

// 没有实现的一个类方法
//+(BOOL)resolveClassMethod:(SEL)sel
//{
//
//}

// 没有实现的一个对象方法
+(BOOL)resolveInstanceMethod:(SEL)sel
{
    NSLog(@"%@",NSStringFromSelector(sel));
    
    if(sel == @selector(TBTest)){
    
        /**
              cls  类类型
              name  方法编号。方法名称
              imp   方法的实现。 就是一个函数的指针！
              types 方法的类型。返回值 和 参数
         */
        class_addMethod([Person class], sel, (IMP)TBeatFood, "v");
    
        
    }
    else if(sel == @selector(TBTest:)){
    
    // 有参数的情况下
        class_addMethod([Person class], sel, (IMP)TBeatFood1, "v@:@");
    }
    
    
    return  [super resolveInstanceMethod:sel];
}

@end
