
//
//  TestClass.m
//  zhizhireturntimeDemo
//
//  Created by wudezhi on 2017/4/11.
//  Copyright © 2017年 RWUIControls. All rights reserved.
//

#import "TestClass.h"
#import "RuntimeKit.h"

@interface SecondClass: NSObject
-(void)noThisMethod:(NSString*)value;

@end


@implementation SecondClass
-(void)noThisMethod:(NSString *)value{
    NSLog(@"SecondClass中的方法实现%@",value);
}
@end


@interface TestClass ()
{
    NSInteger _var1;
    int _var2;
    BOOL _var3;
    double _var4;
    float _var5;
}

@property (nonatomic, strong) NSMutableArray * privateProperty1;
@property (nonatomic, strong) NSNumber * privateProperty2;
@property (nonatomic, strong) NSDictionary * privateProperty3;
@end


@implementation TestClass

+(void)classMethod:(NSString *)value{
    
    NSLog(@"pubilcTestMethod1");
}

-(void)publicTestMethod1:(NSString *)value1 Second:(NSString *)value2{
    
    NSLog(@"publicTestMethod1+Second");
}


-(void)publicTestMethod2{

    NSLog(@"publicTestMethod2");
    
}


-(void)privateTestMethod1{
    
    NSLog(@"privateTestMethod1");
    
}

-(void)privateTestMethod2{

    NSLog(@"privateTestMethod2");
}

//方法交换时使用

-(void)method1{
    
    NSLog(@"其实我是替换Method2的方法");

}


//运行时方法拦截
-(void)dynameicAddMethod:(NSString*) value{

    NSLog(@"OC 替换的方法：%@",value);
    
}



//没有找到SEL的IML实现时会执行下方的方法
+(BOOL)resolveClassMethod:(SEL)sel{

    return NO;
    [RuntimeKit addMethod:[self class] Method:sel method:@selector(dynameicAddMethod:)];
    return YES;
    
}


-(id)forwardingTargetForSelector:(SEL)aSelector{

    return self;
    return [SecondClass new];
}

-(NSMethodSignature*)methodSignatureForSelector:(SEL)aSelector{

    //查找父类的方法签名
    NSMethodSignature *signature = [super methodSignatureForSelector:aSelector];
    if (signature == nil) {
        signature = [NSMethodSignature signatureWithObjCTypes:"@@:"];
    }
    
    return signature;
}


-(void)forwardInvocation:(NSInvocation *)anInvocation{
    
    SecondClass *forwardClass = [SecondClass new];
    SEL sel  = anInvocation.selector;
    
    if ([forwardClass respondsToSelector:sel]) {
        [anInvocation invokeWithTarget:forwardClass];
        
    }else{
        [self doesNotRecognizeSelector:sel];
        
    }
}

@end























