//
//  main.m
//  zhizhireturntimeDemo
//
//  Created by wudezhi on 2017/4/11.
//  Copyright © 2017年 RWUIControls. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RuntimeKit.h"
#import "TestClass.h"
#import "TestClass+Category.h"
#import "TestClass+SwapMethod.h"
#import "TestClass+AssociatedObject.h"



int main(int argc, const char * argv[]) {
    @autoreleasepool {
       
        NSString *className = [RuntimeKit fetchClassName:[TestClass class]];
        NSLog(@"测试类的类名为:%@\n",className);
    
        
        NSArray * ivarList = [RuntimeKit fetcgIvarList:[TestClass class]];
        NSLog(@"\n获取TestClass的成员变量列表:%@",ivarList);
        
        NSArray * propretyList = [RuntimeKit fetchProPertyList:[TestClass class]];
        NSLog(@"\n获取TestClass的属性列表:%@",propretyList);
        
        NSArray * methodList = [RuntimeKit fetchMethodList:[TestClass class]];
        NSLog(@"\n获取TestClass的方法列表%@",methodList);
        
        NSArray * protocolList = [RuntimeKit fecthProtocolList:[RuntimeKit class]];
        NSLog(@"\n 获取TestClass的协议列表%@",protocolList);
        
        TestClass *instance = [TestClass new];
        [instance publicTestMethod2];
        [instance performSelector:@selector(noThisMethod:) withObject:@"实例方法参数"];
        
        instance.dynamicAddProperty = @"我是动态添加的属性";
        NSLog(@"%@",instance.dynamicAddProperty);
        
        
        [instance swapMethod];
        
        [instance method2];
        
        [instance method1];
        
    }
    return 0;
}
