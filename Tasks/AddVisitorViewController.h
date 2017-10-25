//
//  AddVisitorViewController.h
//  Tasks
//
//  Created by SreenivasulaReddy on 24/10/17.
//  Copyright © 2017 SreenivasulaReddy. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol VisitorDelegate <NSObject>

-(void)updatedVisitor:(NSMutableArray*)visitor;

@end

@interface AddVisitorViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *visitorNameField;

@property (nonatomic) id<VisitorDelegate> delegate;

@property (nonatomic,assign) NSMutableArray *visitedVisitors;

@end
