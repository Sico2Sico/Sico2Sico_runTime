//
//  RuntimeKit.h
//  zhizhireturntimeDemo
//
//  Created by wudezhi on 2017/4/11.
//  Copyright © 2017年 RWUIControls. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <objc/message.h>

@interface RuntimeKit : NSObject
//获取类名
+(NSString*)fetchClassName:(Class)class;


//获取成员变量
+(NSArray*)fetcgIvarList:(Class)class;


//获取属性列表 包括私有和公有属性 即定义在延展中的属性
+(NSArray*)fetchProPertyList:(Class)class;


//获取对象方法列表
+(NSArray*)fetchMethodList:(Class)class;


//获取协议列表
+(NSArray*)fecthProtocolList:(Class)class;


//添加新的方法
+(void)addMethod:(Class)class Method:(SEL)methodSel method:(SEL)methodSelImpl;


//方法交换
+(void)methodSwap:(Class)class firstMethod:(SEL)method1 secondMethod:(SEL)method2;


@end


