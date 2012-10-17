//
//  JLViewController.h
//  BrainFuck
//
//  Created by Jesse Luo on 12-10-16.
//  Copyright (c) 2012年 Jesse Luo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JLBFCompiler.h"

@interface JLViewController : UIViewController <UITextViewDelegate>

@property (strong, nonatomic) IBOutlet UITextView *ResultPad;
@property (strong, nonatomic) IBOutlet UITextView *CodePad;
@property (strong, nonatomic) IBOutlet UIToolbar *CharInputBar;

- (IBAction)charBtnPressed:(UIBarButtonItem *)sender;
- (IBAction)runBtnPressed:(UIBarButtonItem *)sender;

@end
