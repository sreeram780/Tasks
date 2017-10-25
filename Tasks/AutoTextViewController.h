//
//  AutoTextViewController.h
//  Tasks
//
//  Created by SreenivasulaReddy on 24/10/17.
//  Copyright © 2017 SreenivasulaReddy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AutoTextViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIScrollView *textviewScroller;
@property (weak, nonatomic) IBOutlet UITextView *textViewContent;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constrain2Height;

@end
