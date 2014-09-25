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
    PanStyle_LeftCancel,
    PanStyle_LeftToggle,
    PanStyle_RightCancel,
    PanStyle_RightToggle
} panStyle_t;

@interface NXTableViewCell () {
	BOOL animating;
	panStyle_t panStyle;
    
    BOOL beMarked;
    BOOL beClocked;
}
@property (strong, nonatomic) UIPanGestureRecognizer* panGesture;
@end

@implementation NXTableViewCell
//@synthesize userBackgroundView;
@synthesize panGesture;
@synthesize markView;
@synthesize clockView;
@synthesize foregroundCenter;

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        
        panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(didPanInCell:)];
        panGesture.maximumNumberOfTouches = 1;
        panGesture.minimumNumberOfTouches = 1;
        panGesture.delaysTouchesBegan = NO;
        panGesture.delaysTouchesEnded = YES;
        panGesture.delegate = self;
        
        [self.contentView addGestureRecognizer:panGesture];

        animating = NO;
        
        self.backgroundView = [[UIView alloc] initWithFrame:self.frame];
        self.backgroundView.backgroundColor = [UIColor grayColor];
//        [self.backgroundView addSubview:userBackgroundView];

//        userBackgroundView = [[UIView alloc] initWithFrame:self.contentView.bounds];
//        userBackgroundView.backgroundColor = [UIColor grayColor];
        
        markView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetHeight(self.frame), CGRectGetHeight(self.frame))];
        [markView setImage:[UIImage imageNamed:@"Mark"]];
        markView.contentMode = UIViewContentModeScaleToFill;
        markView.alpha = 0;
        [self.backgroundView addSubview:markView];

        clockView = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.contentView.frame) - CGRectGetHeight(self.frame),
                                                                  0,
                                                                  CGRectGetHeight(self.frame),
                                                                  CGRectGetHeight(self.frame))];
        [clockView setImage:[UIImage imageNamed:@"Clock"]];
        clockView.contentMode = UIViewContentModeScaleToFill;
        clockView.alpha = 0;
        [self.backgroundView addSubview:clockView];
        
        
        beMarked = NO;
        beClocked = NO;


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

- (BOOL)markChecked {
    return beMarked;
}

- (BOOL)clockChecked {
    return beClocked;
}

- (void)markToggle {
    beMarked = !beMarked;
    // post notification...

}

- (void)clockToggle {
    beClocked = !beClocked;
    // remind clock is on/off...

}

- (void)didPanInCell:(UIPanGestureRecognizer*)gesture {
    
    switch (gesture.state)
    {
        case UIGestureRecognizerStatePossible: {
            
        } break;
        case UIGestureRecognizerStateBegan:
        case UIGestureRecognizerStateChanged: {
            
            CGPoint newCenter = self.contentView.center;
            
            CGPoint translation = [gesture translationInView:self.contentView.superview];
            CGFloat positionX = newCenter.x+translation.x;
            CGFloat offsetX = positionX - foregroundCenter.x;
            
            if ( offsetX >0 && offsetX < CELL_PAN_WIDTH) {
                markView.alpha = [self markChecked] ? 1.0f : offsetX/CELL_PAN_WIDTH;

                panStyle = PanStyle_RightCancel;
            }else if (offsetX > CELL_PAN_WIDTH) {
                positionX = CELL_PAN_WIDTH + foregroundCenter.x;
				panStyle = PanStyle_RightToggle;
            }else if (offsetX < 0 && offsetX > -CELL_PAN_WIDTH) {
                clockView.alpha = [self clockChecked] ? 1.0f : offsetX/(-CELL_PAN_WIDTH);

                panStyle = PanStyle_LeftCancel;
            }else if (offsetX < -CELL_PAN_WIDTH) {
                positionX = -CELL_PAN_WIDTH + foregroundCenter.x;
				panStyle = PanStyle_LeftToggle;
            }
            
            animating = YES;

            [gesture setTranslation:CGPointMake(0, 0) inView:self.contentView.superview];
            self.contentView.center = CGPointMake(positionX, foregroundCenter.y);
            
        } break;
        case UIGestureRecognizerStateEnded: {

            if (!animating) {
                break;
            }
            
            if (panStyle == PanStyle_RightCancel) {
                [self performCancelAnimation:foregroundCenter.x - 4];
            }else if (panStyle == PanStyle_LeftCancel) {
                [self performCancelAnimation:foregroundCenter.x + 4];
            }else if (panStyle == PanStyle_RightToggle) {
                [self markToggle];
                
                markView.alpha = 1.0f;
                [self performToggleAnimation:foregroundCenter.x - 4];
            }else {	// PanStyle_LeftToggle
                [self clockToggle];
                
                clockView.alpha = 1.0f;
                [self performToggleAnimation:foregroundCenter.x + 4];
            }

        } break;
        case UIGestureRecognizerStateCancelled: {

        } break;
        case UIGestureRecognizerStateFailed: {

        } break;
    }

}

- (void)performCancelAnimation:(CGFloat)offsetOnEdge {
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    
    [UIView animateWithDuration:0.5
                     animations:^ {
                         self.contentView.center = CGPointMake(offsetOnEdge, foregroundCenter.y);
                     }
                     completion:^(BOOL finished) {
                         [UIView animateWithDuration:0.2
                                          animations:^(){
                                              self.contentView.center = foregroundCenter;
                                              animating = NO;
                                          }
                          ];
                     }
     ];

}

- (void)performToggleAnimation:(CGFloat)offsetOnEdge {
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    
    [UIView animateWithDuration:0.5
                     animations:^ {
                         // toggle effect
                         // 1 scale large
                         // 2 fast scale orign
                         
                         self.contentView.center = CGPointMake(offsetOnEdge, foregroundCenter.y);
                     }
                     completion:^(BOOL finished) {
                         [UIView animateWithDuration:0.2
                                          animations:^(){
                                              self.contentView.center = foregroundCenter;
                                              animating = NO;
                                          }
                          ];
                     }
     ];
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
