//
//  JLResultViewController.h
//  BrainFuck
//
//  Created by Jesse Luo on 12-10-19.
//  Copyright (c) 2012年 Jesse Luo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JLBFCompiler.h"

@interface JLResultViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextView *ResultPad;
@property (strong, nonatomic) NSString *Source;

@end
