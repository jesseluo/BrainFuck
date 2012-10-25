//
//  JLResultViewController.m
//  BrainFuck
//
//  Created by Jesse Luo on 12-10-19.
//  Copyright (c) 2012年 Jesse Luo. All rights reserved.
//

#import "JLResultViewController.h"

@interface JLResultViewController () {
    JLBFCompiler *_Compiler;
}
@end

@implementation JLResultViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // add border for UITextview
    _OutputTextview.layer.borderColor = [UIColor grayColor].CGColor;
    _OutputTextview.layer.borderWidth = 1.0;
    _OutputTextview.layer.cornerRadius = 5.0;

    _InputTextview.layer.borderColor = [UIColor grayColor].CGColor;
    _InputTextview.layer.borderWidth = 1.0;
    _InputTextview.layer.cornerRadius = 5.0;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)runButtonPressed:(UIBarButtonItem *)sender {
    if (!_Compiler) {
        _Compiler = [[JLBFCompiler alloc] initWithCode:_Source];
    }
    _OutputTextview.text = [_Compiler compile];
    NSLog(@"Just compiled\nresult is %@", _OutputTextview.text);    
}
@end
