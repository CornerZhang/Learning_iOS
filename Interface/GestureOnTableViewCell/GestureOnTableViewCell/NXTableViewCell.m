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

#define CELL_PAN_WIDTH 44

typedef enum panStyle_e {
    PanStyle_Left,
    PanStyle_LeftToggle,
    PanStyle_Right,
    PanStyle_RightToggle
} panStyle_t;

@interface NXTableViewCell () {
	BOOL animating;
	panStyle_t panStyle;
    BOOL beMarked;
    BOOL beClocked;
}

@end

@implementation NXTableViewCell
@synthesize foregroundView;
@synthesize backgroundView;
@synthesize markView;
@synthesize clockView;
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
        beMarked = NO;
        beClocked = NO;
        
        markView.alpha = 0;
        clockView.alpha = 0;
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
            
            if ( offsetX >0 && offsetX < CELL_PAN_WIDTH) {
                markView.alpha = beMarked ? 1.0f : offsetX/CELL_PAN_WIDTH;

                panStyle = PanStyle_Right;
            }else if (offsetX > CELL_PAN_WIDTH) {
                positionX = CELL_PAN_WIDTH+foregroundCenter.x;
				panStyle = PanStyle_RightToggle;
            }else if (offsetX < 0 && offsetX > -CELL_PAN_WIDTH) {
                clockView.alpha = beClocked ? 1.0f : offsetX/(-CELL_PAN_WIDTH);

                panStyle = PanStyle_Left;
            }else if (offsetX < -CELL_PAN_WIDTH) {
                positionX = -CELL_PAN_WIDTH+foregroundCenter.x;
				panStyle = PanStyle_LeftToggle;
            }
            
            animating = YES;

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
                                     foregroundView.center = CGPointMake(foregroundCenter.x - 4, foregroundCenter.y);
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
            }else if (panStyle == PanStyle_Left) {
                
                [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
                
                [UIView animateWithDuration:0.5
                                 animations:^ {
                                     foregroundView.center = CGPointMake(foregroundCenter.x + 4, foregroundCenter.y);
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

            }else if (panStyle == PanStyle_RightToggle) {
				markView.alpha = 1.0f;
                beMarked = !beMarked;
                
                [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
                
                [UIView animateWithDuration:0.5
                                 animations:^ {
                                     // toggle effect
                                     // 1 scale large
                                     // 2 fast scale orign
                                     
                                     foregroundView.center = CGPointMake(foregroundCenter.x - 4, foregroundCenter.y);
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
                
            }else {	// PanStyle_LeftToggle
				clockView.alpha = 1.0f;
                beClocked = !beClocked;
                
                [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
                
                [UIView animateWithDuration:0.5
                                 animations:^ {
                                     // toggle effect
                                     // 1 scale large
                                     // 2 fast scale orign

                                     foregroundView.center = CGPointMake(foregroundCenter.x + 4, foregroundCenter.y);
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

    if (fabs(v.x)<4.0f) {
        return NO;
    }else
        return YES;

}

@end
