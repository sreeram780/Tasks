//
//  StackViewController.m
//  Tasks
//
//  Created by SreenivasulaReddy on 25/10/17.
//  Copyright © 2017 SreenivasulaReddy. All rights reserved.
//

#import "StackViewController.h"

@interface StackViewController ()
{
    UIStackView *stackView;
}
@property (weak, nonatomic) IBOutlet UIStackView *testStack;
@end

@implementation StackViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(adjustForRotation:)
                                                 name:UIDeviceOrientationDidChangeNotification
                                               object:nil];
    //View 1
    UIView *view1 = [[UIView alloc] init];
    view1.backgroundColor = [UIColor blueColor];
    [view1.heightAnchor constraintEqualToConstant:100].active = true;
    [view1.widthAnchor constraintEqualToConstant:120].active = true;
    
    
    //View 2
    UIView *view2 = [[UIView alloc] init];
    view2.backgroundColor = [UIColor greenColor];
    [view2.heightAnchor constraintEqualToConstant:100].active = true;
    [view2.widthAnchor constraintEqualToConstant:70].active = true;
    
    //View 3
    UIView *view3 = [[UIView alloc] init];
    view3.backgroundColor = [UIColor magentaColor];
    [view3.heightAnchor constraintEqualToConstant:100].active = true;
    [view3.widthAnchor constraintEqualToConstant:180].active = true;
    
    //Stack View
    stackView = [[UIStackView alloc] init];
    
    stackView.axis = UILayoutConstraintAxisVertical;
    stackView.distribution = UIStackViewDistributionEqualSpacing;
    stackView.alignment = UIStackViewAlignmentCenter;
    stackView.spacing = 30;
    
    
    [stackView addArrangedSubview:view1];
    [stackView addArrangedSubview:view2];
    [stackView addArrangedSubview:view3];
    
    stackView.translatesAutoresizingMaskIntoConstraints = false;
    [self.view addSubview:stackView];
    
    
    //Layout for Stack View
    [stackView.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = true;
    [stackView.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor].active = true;
}
-(void)adjustForRotation:(NSNotification*)notification
{
    UIDeviceOrientation orientation = [[UIDevice currentDevice] orientation];
    
    switch (orientation) {
        case UIDeviceOrientationLandscapeLeft:
        {
            // UPDATE UI
            NSLog(@"UIDeviceOrientationLandscapeLeft");
            //            [self updateViewlandScape];
            stackView.axis = UILayoutConstraintAxisHorizontal;
            [self.view setNeedsLayout];
            [self.view setNeedsFocusUpdate];
            
            _testStack.axis = UILayoutConstraintAxisHorizontal;
        }
            break;
        case UIDeviceOrientationLandscapeRight:
        {
            // UPDATE UI
            //            [self updateViewlandScape];
            stackView.axis = UILayoutConstraintAxisHorizontal;
            [self.view setNeedsLayout];
            [self.view setNeedsFocusUpdate];
            _testStack.axis = UILayoutConstraintAxisHorizontal;NSLog(@"UIDeviceOrientationLandscapeRight");
            
        }
            break;
        default: // All other orientations - Portrait, Upside Down, Unknown
        {
            // UPDATE UI
            //            [self updateViewPortrait];
            NSLog(@"UIDeviceOrientationPortrait");
            stackView.axis = UILayoutConstraintAxisVertical;
            [self.view setNeedsLayout];
            [self.view setNeedsFocusUpdate];
            _testStack.axis = UILayoutConstraintAxisVertical;
        }
            break;
    }
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskLandscapeRight | UIInterfaceOrientationMaskLandscape | UIInterfaceOrientationMaskLandscapeLeft | UIInterfaceOrientationMaskPortraitUpsideDown;
}


@end
