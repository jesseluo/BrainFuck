//
//  JLBFCompiler.h
//  BrainFuck
//
//  Created by Jesse Luo on 12-10-16.
//  Copyright (c) 2012年 Jesse Luo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JLBFCompiler : NSObject

- (id)initWithCode:(NSString *) code;
- (NSString *) compileWithCode:(NSString *) code;
- (NSString *) compile;

@end
