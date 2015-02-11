//
//  GameOverlayView.m
//  MyTrivie
//
//  Created by Jennifer Duffey on 1/18/15.
//  Copyright (c) 2015 Jennifer Duffey. All rights reserved.
//

#import "GameOverlayView.h"
#import "TrivieBackgroundView.h"

@implementation GameOverlayView

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if(self)
    {
        
    }
    
    return self;
}

- (void)setCurrentQuestion:(Question *)currentQuestion
{
    _currentQuestion = currentQuestion;
    
    self.category.text = currentQuestion.categoryName;
    
    self.questionNumber.text = [NSString stringWithFormat:@"%ld", (long)currentQuestion.questionIndex];
    
    NSInteger fixedIndex = currentQuestion.questionIndex + 1;
    
    [self.trivieBackgroundView setTrivieColor:(TrivieColor)fixedIndex];
    
    NSString *imageName = [NSString stringWithFormat:@"overlay_bottom_%ld", (long)fixedIndex];
    self.bottomImageView.image = [UIImage imageNamed:imageName];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Bezier 3 Drawing
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(rect.size.width, rect.size.height)];
    [bezierPath addLineToPoint: CGPointMake(190.27, 369.62)];
    [bezierPath addCurveToPoint: CGPointMake(185.47, 376.47) controlPoint1: CGPointMake(189.12, 372.1) controlPoint2: CGPointMake(187.52, 374.42)];
    [bezierPath addCurveToPoint: CGPointMake(151.53, 376.47) controlPoint1: CGPointMake(176.1, 385.84) controlPoint2: CGPointMake(160.9, 385.84)];
    [bezierPath addCurveToPoint: CGPointMake(145.12, 364.95) controlPoint1: CGPointMake(148.24, 373.18) controlPoint2: CGPointMake(146.1, 369.17)];
    [bezierPath addLineToPoint: CGPointMake(24.5, 352.48)];
    [bezierPath addLineToPoint: CGPointMake(24.5, 1.64)];
    [bezierPath addLineToPoint: CGPointMake(316.71, -0.5)];
    [bezierPath addLineToPoint: CGPointMake(rect.size.width, rect.size.height)];
    [bezierPath closePath];
    
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, CGSizeMake(0, 0), 4, [[UIColor colorWithHexString:COLOR_DARK_STROKE] colorWithAlphaComponent:0.3].CGColor);
    CGContextSetFillColorWithColor(context, [Utils fillColorForTrivieColor:TrivieColorBlue].CGColor);
    CGContextSetStrokeColorWithColor(context, [UIColor colorWithHexString:COLOR_DARK_STROKE].CGColor);
    CGContextSetLineWidth(context, 1);
    CGContextAddPath(context, bezierPath.CGPath);
    CGContextDrawPath(context, kCGPathFillStroke);
    CGContextRestoreGState(context);
    
    
    //// Bezier Drawing
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(6.5, -0.5)];
    [bezierPath addLineToPoint: CGPointMake(6.5, 80)];
    [bezierPath addLineToPoint: CGPointMake(95.5, 96)];
    [bezierPath addLineToPoint: CGPointMake(95.5, -0.5)];
    [bezierPath addLineToPoint: CGPointMake(6.5, -0.5)];
    [bezierPath closePath];
    [[UIColor grayColor] setFill];
    [bezierPath fill];
    [[UIColor blackColor] setStroke];
    bezierPath.lineWidth = 1;
    [bezierPath stroke];
 
}
*/

@end
