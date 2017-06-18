//
//  ViewController.m
//  01-MessageSendDemo
//
//  Created by 田彬彬 on 2017/6/18.
//  Copyright © 2017年 田彬彬. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import <objc/message.h>   //  消息头文件已经包含  #import <objc/runtime.h>
#import "NSURL+TBURL.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 0.0 运行时机制 创建对象的方法
    Person * person = [[Person alloc]init];
    
    // 0.1 消息机制 创建对象
    // 通过消息机制获取这个类
//      Person * person = objc_getClass("Person");
//      person = objc_msgSend(person, @selector(alloc));
//      person = objc_msgSend(person, @selector(init));

    //1.0  这是我们常写的 调用方法的形式
//    [person eat];
    [person performSelector:@selector(eat)];
    
    //2.0  我们声明一个方法却还没来的及实现它的方法 如果commd + b 编译 是不会报错 因为 commd + b 编译的话 这个类还没有加载到内存中 所以这个类根本不知道这个方法是否实现
    
    // 不带参数
    [person TBTest];
    
    
    // 带参数
    [person performSelector:@selector(TBTest:) withObject:@"美女"];
    
    //3.0 消息发送  完全是 c 语言的
    // Xcode 5 之后 apple 就不建议使用底层的方法 我们直接调下面的方法的话是会报错的。我们需要关闭 enable strick checking 这个 底层消息检测
    objc_msgSend(objc_msgSend(objc_msgSend(objc_getClass("Person"),@selector(alloc)), @selector(init)),@selector(eat));
    
    
    
    //4.0 Runtime 是一个 运行时机制 apple 提供了一个API,属于 C 语言的库
    //4.1 Runtime 有什么用
    //      利用Runtime 运行时  在程序运行的时候动态的去创建一个类
    //      利用Runtime 运行时  在程序运行的时候动态的去修改一个类的属性\方法
    //      利用Rubtime 运行时  便利一个类的属性和方法
    
    //  Method  :  成员方法
    //  Ivar    :  成员变量
    
    
    
    NSURL * url = [NSURL URLWithString:@"https://www.baidu.com/帅哥"];
    
    
    
    

    
    
    
    
}

@end
