//
//  JLViewController.h
//  BrainFuck
//
//  Created by Jesse Luo on 12-10-16.
//  Copyright (c) 2012年 Jesse Luo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JLResultViewController.h"
#import "JLBFCompiler.h"

@interface JLCodeViewController : UIViewController <UITextViewDelegate>

@property (strong, nonatomic) IBOutlet UITextView *CodePad;
@property (strong, nonatomic) IBOutlet UIToolbar *CharInputBar;

- (IBAction)charBtnPressed:(UIBarButtonItem *)sender;

@end
