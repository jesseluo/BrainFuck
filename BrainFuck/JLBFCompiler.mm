//
//  JLBFCompiler.m
//  BrainFuck
//
//  Created by Jesse Luo on 12-10-16.
//  Copyright (c) 2012年 Jesse Luo. All rights reserved.
//

#import "JLBFCompiler.h"

#pragma mark C++ code begin
class BFCompiler {
public:
//    BFCompiler() {
//        //do nothing here ^ ^
//    }
    
    BFCompiler(NSString *code) {
        // transfer nsstring to char[]
        const char *codeInChar = [code cStringUsingEncoding:NSASCIIStringEncoding];
        strcpy(CodeSegment, codeInChar);
        CodeLen = code.length;
    }
    
    
    id getResult() {
        compile();
        return [[NSString alloc] initWithUTF8String:OutputBuffer];
    }

private:    
    char DataSegment[30000];
    char CodeSegment[1000];
    int CodeLen = 0;

    char InputBuffer[10000];
    int InputBufferTail = 0;

    char OutputBuffer[10000];
    int OutputBufferTail = 0;
    
    int Stack[100];             // '['，']' instruction stack
    int StackLen = 0;           // stack head
   
    // private methods
    void compile() {
        NSLog(@"code in compiler is:\n%@",[[NSString alloc] initWithUTF8String:CodeSegment]);
        int iCurrCodePos = 0;
        
        // avoid underflow
        char* pCurrData = DataSegment + 10000;
        
        while (iCurrCodePos < CodeLen) {
            switch (CodeSegment[iCurrCodePos]) {
                case '+':
                    ++(*pCurrData);
                    break;
                case '-':
                    --(*pCurrData);
                    break;
                case '>':
                    ++pCurrData;
                    break;
                case '<':
                    --pCurrData;
                    break;
                
                // output current data
                case '.':
                    OutputBuffer[OutputBufferTail] = (int)(*pCurrData);
                    OutputBufferTail++;
                    break;
                case ',':
                    *pCurrData = InputBuffer[InputBufferTail];
                    InputBufferTail++;
                    break;
                    
                case '[':
                    // 当前数据不为0，将指令指针压入栈中
                    if (*pCurrData) {
                        Stack[StackLen++] = iCurrCodePos;
                    }
                    // 当前数据为0，找到与其匹配的']'，然后开始执行']'后的指令
                    else {
                        int j, k;
                        for (k = iCurrCodePos, j = 0; k < CodeLen; k++) {
                            CodeSegment[k] == '[' && j++;
                            CodeSegment[k] == ']' && j--;
                            // can't find ']', break
                            if (0 == j) break;
                        }
                        // for循环因找到匹配的']'而退出
                        if (0 == j) { 
                            iCurrCodePos = k;
                        }
                        else {
//                            fprintf(stderr, "%s:%d\n" ,__FILE__, __LINE__);
//                            return 3;
                        }
                    } // end of if(*p) 
                    
                    break;
                    
                    // 从栈里获得指令指针，跳转到对应的'['位置
                case ']': 
                    iCurrCodePos = Stack[StackLen - 1];  // 取出栈顶保存的指令指针，作为当前指针
                    iCurrCodePos--;       // 指令指针后退一位，指向上一条指令。（此处减1的原因的下一条语句要加加—— ++iCurrCodePos;）
                    StackLen--;        // 移动栈指针
                    break;
                    
                default:
                    break;
			} // end of switch
            iCurrCodePos++;
        } // end of while
        
    }
};

#pragma mark OC code begin
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
    NSString *result = compiler->getResult();
    NSLog(@"compiler result:%@",result);
    free(compiler);
    return(result);
}

@end
