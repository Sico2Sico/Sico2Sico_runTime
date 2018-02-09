//
//  TestClass.h
//  zhizhireturntimeDemo
//
//  Created by wudezhi on 2017/4/11.
//  Copyright © 2017年 RWUIControls. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestClass : NSObject <NSCopying,NSCoding>

@property (nonatomic, strong) NSArray * publicProperty1;
@property (nonatomic, strong) NSString *publicProperty2;

+(void)classMethod:(NSString*)value;
-(void)method1;
-(void)publicTestMethod2;
-(void)publicTestMethod1:(NSString*)value1 Second:(NSString*)value2;
@end
