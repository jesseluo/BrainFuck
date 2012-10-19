//
//  JLViewController.m
//  BrainFuck
//
//  Created by Jesse Luo on 12-10-16.
//  Copyright (c) 2012年 Jesse Luo. All rights reserved.
//

#import "JLCodeViewController.h"

@interface JLCodeViewController ()

@end

@implementation JLCodeViewController

@synthesize CodePad = _CodePad;
@synthesize CharInputBar = _CharInputBar;

- (void)viewDidLoad
{
    [super viewDidLoad];

    // hide keyboard, it just works= =
    _CodePad.inputView = [[UITabBar alloc] init];
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
    int currentSelectionLength = _CodePad.selectedRange.length;

    if (0 != currentSelectionLength) {
        code = [NSString stringWithFormat:@"%@%@",[code substringToIndex:currentCursorLocation],[code substringFromIndex:currentCursorLocation + currentSelectionLength]];
    }

    if ([charPressed isEqualToString:@"Delete"]) {
        if (0 == currentSelectionLength) {
            // avoid underflow
            if (0 == currentCursorLocation) {
                return;
            }
        
            code = [NSString stringWithFormat:@"%@%@",[code substringToIndex:currentCursorLocation - 1],[code substringFromIndex:currentCursorLocation]];
            currentCursorLocation--;
        }
    }
    else {
        if ([charPressed isEqualToString:@"Return"]) {
            code = [NSString stringWithFormat:@"%@\n%@",[code substringToIndex:currentCursorLocation],[code substringFromIndex:currentCursorLocation]];
        }
        // normal char inputed
        else {
            code = [NSString stringWithFormat:@"%@%@%@",[code substringToIndex:currentCursorLocation],charPressed,[code substringFromIndex:currentCursorLocation]];
        }
        currentCursorLocation++;
    }
    
    _CodePad.text = code;
    // fix cursor location which will be reset after text change
    _CodePad.selectedRange = NSMakeRange(currentCursorLocation, 0);
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    JLBFCompiler *compiler = [[JLBFCompiler alloc] initWithCode:_CodePad.text];
    NSLog(@"Just compiled");
    JLResultViewController *resultViewController = [segue destinationViewController];
    resultViewController.ResultPad.text = [compiler compile];
}
  
@end
