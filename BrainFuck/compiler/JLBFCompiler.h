//
//  JLBFCompiler.h
//  BrainFuck
//
//  Created by Jesse Luo on 12-10-16.
//  Copyright (c) 2012年 Jesse Luo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JLBFCompiler : NSObject

@property (strong, nonatomic) NSString *Code;
@property (strong, nonatomic) NSString *Input;

- (id)initWithCode:(NSString *) code;
- (NSString *) compileCode:(NSString *) code withInput:(NSString *) input;
- (NSString *) compileCode:(NSString *) code;
- (NSString *) compile;

@end
