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
    _Compiler = [[JLBFCompiler alloc] initWithCode:_Source];
    _ResultPad.text = [_Compiler compile];
    NSLog(@"Just compiled\nresult is %@", _ResultPad.text);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
