//
//  EnterTextViewController.h
//  Tasks
//
//  Created by SreenivasulaReddy on 24/10/17.
//  Copyright © 2017 SreenivasulaReddy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EnterTextViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextView *textViewfield;
- (IBAction)sendButtonTapped:(UIButton *)sender;

@end
