//
//  AnalogClock.h
//  Tasks
//
//  Created by SreenivasulaReddy on 24/10/17.
//  Copyright © 2017 SreenivasulaReddy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnalogClock : UIView

/// The background color of the clock's face.
@property (strong, nonatomic) IBInspectable UIColor *faceBackgroundColor;

/// The alpha of the clock's face.
@property (nonatomic) IBInspectable CGFloat faceBackgroundAlpha;

/// The color of the clock's border.
@property (strong, nonatomic) IBInspectable UIColor *borderColor;

/// The alpha of the clock's border.
@property (nonatomic) IBInspectable CGFloat borderAlpha;

/// The width of the clock's border.
@property (nonatomic) IBInspectable CGFloat borderWidth;

/// The font of the digits appearing inside the clock
@property (strong, nonatomic) IBInspectable UIFont *digitFont;

/// The color of the digits appearing inside the clock
@property (strong, nonatomic) IBInspectable UIColor *digitColor;

@property (nonatomic) IBInspectable CGFloat digitOffset;


/// The hours property. Used to set up the hour hand.
@property (nonatomic, assign) NSInteger hours;

/// The minutes property. Used to set up the minute hand.
@property (nonatomic, assign) NSInteger minutes;

/// The seconds property. Used to set up the second hand.
@property (nonatomic, assign) NSInteger seconds;

- (void)startRealTime;

@end
