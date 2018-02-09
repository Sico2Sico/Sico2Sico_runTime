
//
//  RuntimeKit.m
//  zhizhireturntimeDemo
//
//  Created by wudezhi on 2017/4/11.
//  Copyright © 2017年 RWUIControls. All rights reserved.
//

#import "RuntimeKit.h"

@implementation RuntimeKit

//获取类名

+(NSString *)fetchClassName:(Class)class{
    
    const char * className = class_getName(class);
    return [NSString stringWithUTF8String:className];
    
}


//获取成员变量
+(NSArray*)fetcgIvarList:(Class)class{
    
    unsigned int count =0;
    Ivar * ivarList = class_copyIvarList(class, &count);
    NSMutableArray * mutableList = [NSMutableArray arrayWithCapacity:count];
    
    for (unsigned int i =0; i < count ; i++) {
        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:2];
        const char* ivarName = ivar_getName(ivarList[i]);
        const char* ivarType = ivar_getTypeEncoding(ivarList[i]);
        dic[@"type"] = [NSString stringWithUTF8String:ivarType];
        dic[@"ivarName"] = [NSString stringWithUTF8String:ivarName];
        
        [mutableList addObject:dic];
    }
    free(ivarList);
    return [NSArray arrayWithArray:mutableList];
}

//获取类的属性列表
+(NSArray*)fetchProPertyList:(Class)class{
    
    unsigned int count = 0;
    objc_property_t *propertyList = class_copyPropertyList(class, &count);
    NSMutableArray* mutableList = [NSMutableArray arrayWithCapacity:count];
    
    for (unsigned int i =0; i < count; i++) {
        const char* propertyName = property_getName(propertyList[i]);
        [mutableList addObject:[NSString stringWithUTF8String:propertyName]];
    }
    
    free(propertyList);
    return [NSArray arrayWithArray:mutableList];
}


//获取实例方法
+(NSArray*)fetchMethodList:(Class)class{
    
    unsigned int count = 0 ;
    Method * methodList = class_copyMethodList(class, &count);
    NSMutableArray * mutableList = [NSMutableArray arrayWithCapacity:count];
    
    for (unsigned int i =0; i< count; i ++) {
        Method method = methodList[i];
        SEL methodName = method_getName(method);
        [mutableList addObject: NSStringFromSelector(methodName)];
    }
    
    free(methodList);
    return [NSArray arrayWithArray:mutableList];
}


//获取协议列表
+(NSArray*)fecthProtocolList:(Class)class{
    
    unsigned int count = 0;
    __unsafe_unretained Protocol **protocolList = class_copyProtocolList(class, &count);
    NSMutableArray * mutableList = [NSMutableArray arrayWithCapacity:count];
    
    for (unsigned int i = 0 ; i < count ; i ++) {
        Protocol * protocol = protocolList[i];
        const char * protocolName = protocol_getName(protocol);
        [mutableList addObject:[NSString stringWithUTF8String:protocolName]];
    }

    free(protocolList);
    return [NSArray arrayWithArray:mutableList];
}


//往类上添加新的方法与其实现
+(void)addMethod:(Class)class Method:(SEL)methodSel method:(SEL)methodSelImpl{
    
    Method method = class_getInstanceMethod(class, methodSelImpl);
    IMP methodIMP = method_getImplementation(method);
    const char * types = method_getTypeEncoding(method);
    class_addMethod(class, methodSel, methodIMP, types);
}
 

//方法交换   //方法 函数都没有改变  只是改变了映射表地址  IMP代表了方法的具体的实现
+(void)methodSwap:(Class)class firstMethod:(SEL)method1 secondMethod:(SEL)method2{
    
    Method firstMethod = class_getInstanceMethod(class, method1);
    Method secondMethod = class_getInstanceMethod(class, method2);
    method_exchangeImplementations(firstMethod, secondMethod);
    
}



+(void)Runtimefunc{
    //获取cls类对象所有成员ivar结构体
    Ivar *ivar = class_copyIvarList(Class cls, unsigned int *outCount);
    
    //获取cls类对象name对应的实例方法结构体
    Method * method = class_getClassMethod(Class cls, SEL name);
    
    
    
}



@end




















