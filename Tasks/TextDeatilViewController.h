//
//  TextDeatilViewController.h
//  Tasks
//
//  Created by SreenivasulaReddy on 24/10/17.
//  Copyright © 2017 SreenivasulaReddy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TextDeatilViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *textDetailTable;

@property(nonatomic) NSString *textViewtext;
@property(nonatomic) NSString *textCreatedDate;

@end
