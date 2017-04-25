//
//  NSObject+CXArchive.h
//  runtime--序列化
//
//  Created by chenxiang on 2017/4/6.
//  Copyright © 2017年 chenxiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
@interface NSObject (CXArchive)

- (void)setClass:(const char *)className archiveWithCoder:(NSCoder *)aCoder;//归档
- (void)setClass:(const char *)className unArchiveWithCoder:(NSCoder *)aDecoder;//解档
@end
