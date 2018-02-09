//
//  TestClass+AssociatedObject.m
//  zhizhireturntimeDemo
//
//  Created by wudezhi on 2017/4/11.
//  Copyright © 2017年 RWUIControls. All rights reserved.
//

#import "TestClass+AssociatedObject.h"

static char KDyNamicAddProperty;


@implementation TestClass (AssociatedObject)

-(NSString*)dynamicAddProperty{

    return objc_getAssociatedObject(self, &KDyNamicAddProperty);
}


-(void)setDynamicAddProperty:(NSString *)dynamicAddProperty{

    objc_setAssociatedObject(self, &KDyNamicAddProperty, dynamicAddProperty, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}
@end
