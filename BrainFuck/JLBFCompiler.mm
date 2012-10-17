//
//  JLBFCompiler.m
//  BrainFuck
//
//  Created by Jesse Luo on 12-10-16.
//  Copyright (c) 2012年 Jesse Luo. All rights reserved.
//

#import "JLBFCompiler.h"

// cpp code begin
class BFCompiler {
public:
    BFCompiler() {
        
    }
    
    BFCompiler(NSString *code) {
        // TODO transfer NSString to char[]
        
    }
    
    id getResult() {
        compile();
        return [[NSString alloc] initWithUTF8String:DataBlock];
    }

private:
    id CodeSeg;
    char DataBlock[6] = "hello";
    char CodeSegment[100000];
    int CodeLen = 0;                // 代码指令长度，尾指针
    int Stack[100];                 // 栈，当进入'['，']'时用于维护指令指针
    int StackLen = 0;               // 栈指针
    
    void compile() {
//        DataBlock = "hello";
    }
};
//cpp code end

@implementation JLBFCompiler {
    NSString *_Code;
}

- (id)initWithCode:(NSString *) code {
    if(self = [super init])
    {
        _Code = code;
    }
    return self;

}

- (NSString *) compileWithCode:(NSString *) code {
    _Code = code;
    return [self compile];
}

- (NSString *) compile {
    BFCompiler *compiler;
    compiler = new BFCompiler(_Code);
    return(compiler->getResult());
}

@end
