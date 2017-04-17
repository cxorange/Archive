//
//  NSObject+CXArchive.m
//  runtime--序列化
//
//  Created by chenxiang on 2017/4/6.
//  Copyright © 2017年 chenxiang. All rights reserved.
//

#import "NSObject+CXArchive.h"

unsigned int  count = 0;
static   BOOL isArchive;

@implementation NSObject (CXArchive)

- (void)setClass:(const char *)className archiveWithCoder:(NSCoder *)aCoder
{

    isArchive = YES;

    [self setValueWithClass:className andCoder:aCoder];
    
}
- (void)setClass:(const char *)className unArchiveWithCoder:(NSCoder *)aDecoder
{
    isArchive = NO;
    [self setValueWithClass:className andCoder:aDecoder];
}

- (void)setValueWithClass:(const char *)className andCoder:(NSCoder *)coder
{
    Class classObjc = objc_getClass("Person");
    Ivar * ivars  = class_copyIvarList(classObjc, &count);
    for (int i = 0; i < count; i++) {
        Ivar ivar = ivars[i];
        const char * ivar_name = ivar_getName(ivar);
        NSString   * objc_name = [NSString stringWithUTF8String:ivar_name];
        if (isArchive == YES) {
            //归档操作
            [coder encodeObject:[self valueForKey:objc_name] forKey:objc_name];
        }else{
            //解档操作
            id value = [coder decodeObjectForKey:objc_name];
            [self setValue:value forKey:objc_name];
        }
    }
}


@end
