//
//  NXTableViewCell.m
//  GestureOnTableViewCell
//
//  Created by CornerZhang on 14-9-15.
//  Copyright (c) 2014年 NeXtreme.com. All rights reserved.
//

#import "NXTableViewCell.h"
#import <Foundation/Foundation.h>

#define DEBUG 1

typedef enum panStyle_e {
    PanStyle_Left,
    PanStyle_Right
} panStyle_t;

@interface NXTableViewCell () {
	BOOL animating;
	panStyle_t panStyle;
}

@end

@implementation NXTableViewCell
@synthesize foregroundView;
@synthesize backgroundView;
@synthesize foregroundCenter;

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        
        UIPanGestureRecognizer* panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(didPanInCell:)];
        panGesture.maximumNumberOfTouches = 1;
        panGesture.minimumNumberOfTouches = 1;
        panGesture.delaysTouchesBegan = NO;
        panGesture.delaysTouchesEnded = YES;
        panGesture.delegate = self;
        
        [self.contentView addGestureRecognizer:panGesture];

        animating = NO;
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)didPanInCell:(UIPanGestureRecognizer*)gesture {
    
    switch (gesture.state)
    {
        case UIGestureRecognizerStatePossible: {
            
        } break;
        case UIGestureRecognizerStateBegan:
        case UIGestureRecognizerStateChanged: {
            
            CGPoint newCenter = foregroundView.center;
            
            CGPoint translation = [gesture translationInView:foregroundView.superview];
            CGFloat positionX = newCenter.x+translation.x;
            CGFloat offsetX = positionX - foregroundCenter.x;
            if (offsetX > 50) {
                positionX = 50+foregroundCenter.x;
                animating = YES;
				panStyle = PanStyle_Right;
            }else if (offsetX < -50) {
                positionX = -50+foregroundCenter.x;
                animating = YES;
				panStyle = PanStyle_Left;
            }
            [gesture setTranslation:CGPointMake(0, 0) inView:foregroundView.superview];
            foregroundView.center = CGPointMake(positionX, foregroundCenter.y);
            
        } break;
        case UIGestureRecognizerStateEnded: {

            if (!animating) {
                break;
            }
            
            if (panStyle == PanStyle_Right) {

                [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
                
                [UIView animateWithDuration:0.5
                                 animations:^ {
                                     foregroundView.center = CGPointMake(foregroundCenter.x - 10, foregroundCenter.y);
                                 }
                                 completion:^(BOOL finished) {
                                     [UIView animateWithDuration:0.2
                                                      animations:^(){
                                                          foregroundView.center = foregroundCenter;
                                                          animating = NO;
                                                      }
                                      ];
                                 }
                 ];
                
            }else {	// PanStyle_Left

                [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
                
                [UIView animateWithDuration:0.5
                                 animations:^ {
                                     foregroundView.center = CGPointMake(foregroundCenter.x + 10, foregroundCenter.y);
                                 }
                                 completion:^(BOOL finished) {
                                     [UIView animateWithDuration:0.2
                                                      animations:^(){
                                                          foregroundView.center = foregroundCenter;
                                                          animating = NO;
                                                      }
                                      ];
                                     
                                 }
                 ];
                
            }

        } break;
        case UIGestureRecognizerStateCancelled: {
            
        } break;
        case UIGestureRecognizerStateFailed: {
            
        } break;
    }

}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
	if ([gestureRecognizer isKindOfClass:[UILongPressGestureRecognizer class]])
		return YES;

    if (animating) {
        return NO;
    }
    
    UIPanGestureRecognizer* gesturePan = (UIPanGestureRecognizer*)gestureRecognizer;
    CGPoint v = [gesturePan velocityInView:self.contentView];

    if (fabs(v.x)<8.0f) {
        return NO;
    }else
        return YES;

}

@end
