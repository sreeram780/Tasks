//
//  ExpantTextTableViewCell.h
//  Tasks
//
//  Created by SreenivasulaReddy on 24/10/17.
//  Copyright © 2017 SreenivasulaReddy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExpantTextTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleMessage;
@property (weak, nonatomic) IBOutlet UILabel *messageText;
@property (weak, nonatomic) IBOutlet UIButton *moreorlessButton;
@property (nonatomic) BOOL isExpanded;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constrainHeightofMessage;

@end
