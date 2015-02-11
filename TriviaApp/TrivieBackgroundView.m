//
//  TrivieBackgroundView.m
//  MyTrivie
//
//  Created by Jennifer Duffey on 1/15/15.
//  Copyright (c) 2015 Jennifer Duffey. All rights reserved.
//

#import "TrivieBackgroundView.h"

@implementation TrivieBackgroundView

- (void)awakeFromNib
{
    if(self.colorIndex > 0)
    {
        [self setTrivieColor:(TrivieColor)self.colorIndex];
    }
    else if(self.tag > 0)
    {
        [self setTrivieColor:(TrivieColor)self.tag];
    }
    else
    {
        [self setFillColor:self.backgroundColor];
    }
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if(self)
    {
        
    }
    
    return self;
}

- (void)setTrivieColor:(TrivieColor)trivieColor
{
    _trivieColor = trivieColor;
    
    self.selectedFillGradient = [Utils selectedGradientForTrivieColor:trivieColor];
    
    [self setFillColor:[Utils fillColorForTrivieColor:trivieColor]];
}

- (void)setFillColor:(UIColor *)fillColor
{
    _fillColor = fillColor;
    
    [self setNeedsDisplay];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
 
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    float rectHeight = (self.footerView ? rect.size.height - self.footerView.height : rect.size.height);
    float rectStart = 0;
    
    if(self.isHighlighted)
    {
        rectStart = MENU_PADDING;
        
        CGRect highlightedStrokeRect =  CGRectMake(0, rectStart, MENU_STROKE_GAP, rectHeight);
        CGRect highlightedHighlightRect = CGRectMake(MENU_STROKE_GAP, rectStart, 1, rectHeight);
        CGRect highlightedFillRect = CGRectMake(0, rectStart, self.width, rectHeight);
        CGRect endHighlightedRect = CGRectMake(self.width - 1 - (MENU_STROKE_GAP), rectStart, 1, rectHeight);
        CGRect endStrokedRect = CGRectMake(self.width - MENU_STROKE_GAP, rectStart, MENU_STROKE_GAP, rectHeight);
        
        // fill cell background
        CGContextSaveGState(context);
        drawLinearGradient(context, highlightedFillRect, [(UIColor *)self.selectedFillGradient[GRADIENT_COLOR_ONE] CGColor], [(UIColor *)self.selectedFillGradient[GRADIENT_COLOR_TWO] CGColor]);
        CGContextRestoreGState(context);
        
        // left vertical border
        CGContextSaveGState(context);
        CGContextSetFillColorWithColor(context, [[UIColor blackColor] colorWithAlphaComponent:0.25].CGColor);
        CGContextFillRect(context, highlightedStrokeRect);
        CGContextRestoreGState(context);
        
        //left vertical highlight
        CGContextSaveGState(context);
        CGContextSetFillColorWithColor(context,  [[UIColor whiteColor] colorWithAlphaComponent:0.25].CGColor);
        CGContextFillRect(context, highlightedHighlightRect);
        CGContextRestoreGState(context);
        
        // right highlight
        CGContextSaveGState(context);
        CGContextSetFillColorWithColor(context,  [[UIColor whiteColor] colorWithAlphaComponent:0.25].CGColor);
        CGContextFillRect(context, endHighlightedRect);
        CGContextRestoreGState(context);
        
        // right shadow
        CGContextSetFillColorWithColor(context, [[UIColor blackColor] colorWithAlphaComponent:0.25].CGColor);
        CGContextSaveGState(context);
        CGContextFillRect(context, endStrokedRect);
        CGContextRestoreGState(context);
        
        rectStart = 0;
        rectHeight = MENU_PADDING;
    }
    
    //float shadowSpace = (self.showShadow ? SMALL_SPACING : 0);
    
    drawTrivieBackground(context, rect, self.fillColor, NO, 0);
}

@end
