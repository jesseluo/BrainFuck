//
//  JLResultViewController.h
//  BrainFuck
//
//  Created by Jesse Luo on 12-10-19.
//  Copyright (c) 2012年 Jesse Luo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "JLBFCompiler.h"

@interface JLResultViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextView *OutputTextview;
@property (strong, nonatomic) IBOutlet UITextView *InputTextview;
- (IBAction)runButtonPressed:(UIBarButtonItem *)sender;

@property (strong, nonatomic) NSString *Source;
@end
