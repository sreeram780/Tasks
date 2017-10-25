//
//  Hand.h
//  Tasks
//
//  Created by SreenivasulaReddy on 24/10/17.
//  Copyright © 2017 SreenivasulaReddy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Hand : UIView

#pragma mark Public Properties

/// The color of the the hand instance
@property (strong, nonatomic) UIColor *color;

/// The widgth of the hand instance
@property (nonatomic) CGFloat width;

/// The length of the hand instance
@property (nonatomic) CGFloat length;

/// The length on the short side of the hand instance.
@property (nonatomic) CGFloat offsetLength;

/// Is there a shadow behind the hand
@property (nonatomic) BOOL shadowEnabled;

// The degree the hand should be rotated by.
@property (nonatomic) float degree;

- (void)setDegree:(float)degree animated:(BOOL)animated;

@end

