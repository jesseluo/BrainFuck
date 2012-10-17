//
//  JLViewController.m
//  BrainFuck
//
//  Created by Jesse Luo on 12-10-16.
//  Copyright (c) 2012年 Jesse Luo. All rights reserved.
//

#import "JLViewController.h"

@interface JLViewController ()

@end

@implementation JLViewController

@synthesize ResultPad = _ResultPad;
@synthesize CodePad = _CodePad;
@synthesize CharInputBar = _CharInputBar;

- (void)viewDidLoad
{
    [super viewDidLoad];

    // hide keyboard, it just works- -
    _CodePad.inputView = [[UITabBar alloc] init];;
    [_CodePad becomeFirstResponder];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)charBtnPressed:(UIBarButtonItem *)sender {
    NSString *charPressed = sender.title;
    NSString *code = _CodePad.text;
    int currentCursorLocation = _CodePad.selectedRange.location;

    if ([charPressed isEqualToString:@"Delete"]) {
        if (0 == currentCursorLocation) {
            return;
        }
        
        _CodePad.text = [NSString stringWithFormat:@"%@%@",[code substringToIndex:currentCursorLocation - 1],[code substringFromIndex:currentCursorLocation]];
        currentCursorLocation--;
    }
    else {
        if ([charPressed isEqualToString:@"Return"]) {
            _CodePad.text = [NSString stringWithFormat:@"%@\n%@",[code substringToIndex:currentCursorLocation],[code substringFromIndex:currentCursorLocation]];
        }
        // normal char inputed
        else {
            _CodePad.text = [NSString stringWithFormat:@"%@%@%@",[code substringToIndex:currentCursorLocation],charPressed,[code substringFromIndex:currentCursorLocation]];            
        }
        currentCursorLocation++;
    }
    
    // fix cursor location which will be reset after text change
    _CodePad.selectedRange = NSMakeRange(currentCursorLocation, 0);
}

- (IBAction)runBtnPressed:(UIBarButtonItem *)sender {
    JLBFCompiler *compiler = [[JLBFCompiler alloc] initWithCode:_CodePad.text];
    _ResultPad.text = [compiler compile];
    NSLog(@"Just compiled");
}
  
@end
