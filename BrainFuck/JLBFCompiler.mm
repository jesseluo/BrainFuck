//
//  JLBFCompiler.m
//  BrainFuck
//
//  Created by Jesse Luo on 12-10-16.
//  Copyright (c) 2012年 Jesse Luo. All rights reserved.
//

#import "JLBFCompiler.h"

#define GOODEND 0
#define INPUTOVERFLOW 1
#define LEFTBRACKETMISS 2
#define RIGHTBRACKETMISS 3

#pragma mark C++ code begin
class BFCompiler {
public:
    BFCompiler() {
        //do nothing here ^ ^
    }
    
    BFCompiler(NSString *code, NSString *input) {
        setCode(code);
        setInput(input);
    }
    
    void setCode(NSString *code) {
        // transfer nsstring to char[]
        const char *codeInChar = [code cStringUsingEncoding:NSASCIIStringEncoding];
        strcpy(CodeSegment, codeInChar);
        CodeLen = code.length;
    }

    void setInput(NSString *input) {
        const char *inputInChar = [input cStringUsingEncoding:NSASCIIStringEncoding];
        strcpy(InputBuffer, inputInChar);
    }

    NSString *getResult() {
        int runningState = compile();
        NSString *result = [[NSString alloc] initWithUTF8String:OutputBuffer];
        
        switch (runningState) {
            case GOODEND:
                break;
            case INPUTOVERFLOW:
                result = [result stringByAppendingString:@"\n[ERROR]Input Pointer Overflow!"];
                break;
            case LEFTBRACKETMISS:
                result = [result stringByAppendingString:@"\n[ERROR]Missing Left Bracket!"];
                break;
            case RIGHTBRACKETMISS:
                result = [result stringByAppendingString:@"\n[ERROR]Missing Right Bracket!"];
                break;

            default:
                break;
        }
        return result;
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
    int StackTop = 0;           // first element should be at [1]
   
    // private methods
    int compile() {
        NSLog(@"code in compiler is:\n%@",[[NSString alloc] initWithUTF8String:CodeSegment]);
        NSLog(@"input in compiler is:\n%@",[[NSString alloc] initWithUTF8String:InputBuffer]);
        
        // avoid underflow
        char *pCurrData = DataSegment + 10000;
        int iCurrentCodePostion = 0;
        
        while (iCurrentCodePostion < CodeLen) {
            switch (CodeSegment[iCurrentCodePostion]) {
                case '+':
                    (*pCurrData)++;
                    break;
                case '-':
                    (*pCurrData)--;
                    break;
                case '>':
                    pCurrData++;
                    break;
                case '<':
                    pCurrData--;
                    break;
                
                case '.':
                    OutputBuffer[OutputBufferTail] = (int)(*pCurrData);
                    OutputBufferTail++;
                    break;
                    
                case ',':
                    *pCurrData = InputBuffer[InputBufferTail];
                    InputBufferTail++;

                    if ('\0' == *pCurrData) {
                        return INPUTOVERFLOW;
                    }
                    break;
                    
                case '[':
                    // if CurrData != 0 then go on
                    if (*pCurrData) {
                        Stack[++StackTop] = iCurrentCodePostion;
                    }
                    //else jump to paired ']'
                    else {
                        int iPos, numOfPair;
                        for (iPos = iCurrentCodePostion, numOfPair = 0; iPos < CodeLen; iPos++) {
                            if ('[' == CodeSegment[iPos]) numOfPair++;
                            if (']' == CodeSegment[iPos]) numOfPair--;
                            // paired ']' found
                            if (0 == numOfPair) break;
                        }
                        
                        if (0 == numOfPair) { 
                            iCurrentCodePostion = iPos;
                        }
                        else {
                            return RIGHTBRACKETMISS;
                        }
                    } // end of if (*pCurrData)
                    break;
                    
                case ']':
                    // if CurrData == 0 then go on                    
                    if (!*pCurrData) break;

                    if (0 >= StackTop) {
                        return LEFTBRACKETMISS;
                    }
                    
                    // jump to paired '['
                    iCurrentCodePostion = Stack[StackTop--];
                    iCurrentCodePostion--;
                    break;
                    
                default:
                    break;
			} // end of switch
            
            iCurrentCodePostion++;
        } // end of while
        return GOODEND;
    }
};

#pragma mark OC code begin
@implementation JLBFCompiler 

- (id)initWithCode:(NSString *) code {
    if(self = [super init])
    {
        _Code = code;
    }
    return self;
}

- (NSString *) compileCode:(NSString *) code withInput:(NSString *) input{
    _Code = code;
    _Input = input;
    return [self compile];
}

- (NSString *) compileCode:(NSString *) code {
    _Code = code;
    return [self compile];
}

- (NSString *) compile {
    BFCompiler *compiler;
    compiler = new BFCompiler(_Code, _Input);
    
    NSString *result = compiler->getResult();
    NSLog(@"compiler result:%@",result);

    free(compiler);
    return(result);
}

@end
