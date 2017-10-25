//
//  AnalogClock.m
//  Tasks
//
//  Created by SreenivasulaReddy on 24/10/17.
//  Copyright © 2017 SreenivasulaReddy. All rights reserved.
//

#import "AnalogClock.h"
#import "Hand.h"

@interface AnalogClock ()
{
    /// Skip one cycle when the real time feature is on. Here to avoid animation conflicts.
    BOOL skipOneCycle;
}
/// The minute hand. Subclass of UIView.
@property (nonatomic) Hand *hourHand;

/// The minute hand. Subclass of UIView.
@property (nonatomic) Hand *minuteHand;

/// The second hand. Subclass of UIView.
@property (nonatomic) Hand *secondHand;


@end

@implementation AnalogClock


#pragma mark - Initialization

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit
{
    _faceBackgroundColor = [UIColor blackColor];// [UIColor colorWithRed:0 green:122.0/255.0 blue:255/255 alpha:1];
    _faceBackgroundAlpha = 0.95;
    
    _borderColor = [UIColor whiteColor];
    _borderAlpha = 1.0;
    _borderWidth = 3;
    
     skipOneCycle = NO;

    _digitColor = [UIColor redColor];
    _digitFont  = [UIFont fontWithName:@"HelveticaNeue-Thin" size:17];
    _digitOffset = 0.0;
}

- (void)layoutSubviews
{
    [self setClockToCurrentTimeAnimated:YES];

    [self timeFormatVerification];
    
    self.hourHand = [[Hand alloc] initWithFrame:self.bounds];
    self.hourHand.degree = [self degreesFromHour:self.hours andMinutes:self.minutes];
    self.hourHand.color = [UIColor whiteColor];
    self.hourHand.alpha = 1.0;
    self.hourHand.width = 4;
    self.hourHand.length = 30;
    self.hourHand.offsetLength = 10;
    [self addSubview:self.hourHand];
    
    self.minuteHand = [[Hand alloc] initWithFrame:self.bounds];
    self.minuteHand.degree = [self degreesFromMinutes:self.minutes];
    self.minuteHand.color = [UIColor whiteColor];
    self.minuteHand.alpha = 1.0;
    self.minuteHand.width = 3;
    self.minuteHand.length = 55;
    self.minuteHand.offsetLength = 20;
    [self addSubview:self.minuteHand];
    
    self.secondHand = nil;
    self.secondHand = [[Hand alloc] initWithFrame:self.bounds];
    self.secondHand.degree = [self degreesFromMinutes:self.seconds];
    self.secondHand.color = [UIColor whiteColor];
    self.secondHand.alpha = 1.0;
    self.secondHand.width = 1;
    self.secondHand.length = 60;
    self.secondHand.offsetLength = 20;
    [self addSubview:self.secondHand];
}

- (void)startRealTime
{
        [NSTimer scheduledTimerWithTimeInterval:1.0
                                         target:self
                                       selector:@selector(updateAnalogEverySecond)
                                       userInfo:nil
                                        repeats:YES];
}

- (void)setClockToCurrentTimeAnimated:(BOOL)animated
{
    NSDate *currentTime = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"hh"];
    NSString *currentHour = [dateFormatter stringFromDate: currentTime];
    [dateFormatter setDateFormat:@"mm"];
    NSString *currentMinute = [dateFormatter stringFromDate: currentTime];
    [dateFormatter setDateFormat:@"ss"];
    NSString *currentSecond = [dateFormatter stringFromDate: currentTime];
    skipOneCycle = animated;

    self.hours = [currentHour integerValue];
    self.minutes = [currentMinute integerValue];
    self.seconds = [currentSecond integerValue];
}
#pragma mark - Real Time
- (void)reloadClock
{
    for (UIView *subview in [self subviews]) {
        [subview removeFromSuperview];
    }
    [self setNeedsLayout];
    [self setNeedsDisplay];
}
- (void)updateAnalogEverySecond
{
    self.seconds = self.seconds + 1;
    if (skipOneCycle == YES)
    {
        skipOneCycle = NO;
    }
    else
    {
        [self.secondHand setDegree:[self degreesFromMinutes:self.seconds] animated:YES];

            [self timeFormatVerification];
    }
}

#pragma mark - Conversions/Calculations

- (void)timeFormatVerification {
    if (self.hours > 12 ) // If the time has been set to military time, converts it to 12-hour clock.
        self.hours = self.hours - 12;
    
    if (self.seconds >= 60) {
        self.seconds = 0;
        self.minutes = self.minutes + 1;
        [self.minuteHand setDegree:[self degreesFromMinutes:self.minutes] animated:YES];
        [self.hourHand   setDegree:[self degreesFromHour:self.hours andMinutes:self.minutes] animated:YES];
    }
    else if (self.seconds < 0) {
        self.seconds = 59;
        self.minutes = self.minutes - 1;
        [self.minuteHand setDegree:[self degreesFromMinutes:self.minutes] animated:YES];
        [self.hourHand   setDegree:[self degreesFromHour:self.hours andMinutes:self.minutes] animated:YES];
    }
    
    if (self.minutes >= 60) {
        self.minutes = 0;
        self.hours = self.hours + 1;
    }
    else if (self.minutes < 0) {
        self.minutes = 59;
        self.hours = self.hours - 1;
    }
}

- (float)degreesFromHour:(NSInteger)hour andMinutes:(NSInteger)minutes {
    float degrees = (hour*30) + (minutes/10)*6;
    return degrees;
}

- (float)degreesFromMinutes:(NSInteger)minutes {
    float degrees = minutes*6;
    return degrees;
}
#pragma mark - Drawings

- (void)drawRect:(CGRect)rect
{
    // CLOCK'S FACE
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextAddEllipseInRect(ctx, rect);
    CGContextSetFillColorWithColor(ctx, _faceBackgroundColor.CGColor);
    CGContextSetAlpha(ctx, 1.0);
    CGContextFillPath(ctx);
    
    // CLOCK'S BORDER
    CGContextAddEllipseInRect(ctx, CGRectMake(rect.origin.x + self.borderWidth/2, rect.origin.y + self.borderWidth/2, rect.size.width - self.borderWidth, rect.size.height - self.borderWidth));
    CGContextSetStrokeColorWithColor(ctx, self.borderColor.CGColor);
    CGContextSetAlpha(ctx, self.borderAlpha);
    CGContextSetLineWidth(ctx,self.borderWidth);
    CGContextStrokePath(ctx);
    
    
    // DIGIT DRAWING
    
   
        CGPoint center = CGPointMake(rect.size.width/2.0f, rect.size.height/2.0f);
        CGFloat markingDistanceFromCenter = rect.size.width/2.0f - self.digitFont.lineHeight/4.0f - 15 + self.digitOffset;
        NSInteger offset = 4;
        
        for(unsigned i = 0; i < 12; i ++){
            NSString *hourNumber = [NSString stringWithFormat:@"%@%d", [NSString stringWithFormat:@"%@", i+1<10 ? @" ": @""] , i + 1 ];
            CGFloat labelX = center.x + (markingDistanceFromCenter - self.digitFont.lineHeight/2.0f) * cos((M_PI/180)* (i+offset) * 30 + M_PI);
            CGFloat labelY = center.y + - 1 * (markingDistanceFromCenter - self.digitFont.lineHeight/2.0f) * sin((M_PI/180)*(i+offset) * 30);
            [hourNumber drawInRect:CGRectMake(labelX - self.digitFont.lineHeight/2.0f,labelY - self.digitFont.lineHeight/2.0f,self.digitFont.lineHeight,self.digitFont.lineHeight) withAttributes:@{NSForegroundColorAttributeName: self.digitColor, NSFontAttributeName: self.digitFont}];
        }
}

@end
