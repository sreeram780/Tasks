//
//  AutoTextViewController.m
//  Tasks
//
//  Created by SreenivasulaReddy on 24/10/17.
//  Copyright © 2017 SreenivasulaReddy. All rights reserved.
//

#import "AutoTextViewController.h"

@interface AutoTextViewController ()

@end

@implementation AutoTextViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _textViewContent.text = @"Content in the vertical direction — in both portrait and landscape views — is working because the height of my content view is explicit by stacking one control on top of another.But as you can see, I have a problem in the horizontal direction. I am fully constrained in the horizontal direction, however since  UITextFields do not have an intrinsic content size, without any text inside them, my view is collapsed. I need some way to expand my content view in the horizontal direction to fill the width of the device. I could hard code a width constraint, but that will only work for portrait or landscape and not both.The solution is to look outside the scroll view and attach an equal width constraint from the content view to the view controller’s main. Now, when we run, we get the correct behavior in portrait and landscape. The content view will get its width from the main view, and all of the content inside the content view will stretch in the horizontal direction. If you have UITextFields near the bottom of your content view and the keyboard pops up, it blocks the bottom half of your screen; you cannot see what you are typing. The scroll view allows us to scroll the content into view. Content in the vertical direction — in both portrait and landscape views — is working because the height of my content view is explicit by stacking one control on top of another.But as you can see, I have a problem in the horizontal direction. I am fully constrained in the horizontal direction, however since  UITextFields do not have an intrinsic content size, without any text inside them, my view is collapsed. I need some way to expand my content view in the horizontal direction to fill the width of the device. I could hard code a width constraint, but that will only work for portrait or landscape and not both.The solution is to look outside the scroll view and attach an equal width constraint from the content view to the view controller’s main. Now, when we run, we get the correct behavior in portrait and landscape. The content view will get its width from the main view, and all of the content inside the content view will stretch in the horizontal direction. If you have UITextFields near the bottom of your content view and the keyboard pops up, it blocks the bottom half of your screen; you cannot see what you are typing. The scroll view allows us to scroll the content into view.";
    _textViewContent.showsVerticalScrollIndicator = NO;
    _textViewContent.scrollEnabled = NO;

    self.constrain2Height.constant = [_textViewContent sizeThatFits:CGSizeMake(_textViewContent.frame.size.width, CGFLOAT_MAX)].height;

    _textviewScroller.contentSize = CGSizeMake(_textViewContent.contentSize.width, self.constrain2Height.constant) ;
}

@end
