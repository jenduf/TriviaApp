//
//  DrawingHelper.m
//  Trivie
//
//  Created by Jennifer Duffey on 3/20/12.
//  Copyright (c) 2012 Trivie. All rights reserved.
//

#import "DrawingHelper.h"

CGRect rectFor1PxStroke(CGRect rect)
{
	return CGRectMake(rect.origin.x + 0.5, rect.origin.y + 0.5, rect.size.width - 1, rect.size.height - 1);
}

CGSize getAdjustedScale(float width, float height)
{
	const CGFloat scale = [UIScreen mainScreen].scale;
	
	return CGSizeMake(width * scale, height * scale);
}

void drawTrivieBackground(CGContextRef context, CGRect rect, UIColor *color, BOOL showBorder, float borderStart)
{
    CGRect strokeRect =  CGRectMake(0, 0, MENU_STROKE_GAP, rect.size.height);
    CGRect highlightRect = CGRectMake(MENU_STROKE_GAP, 0, 1, rect.size.height);
    CGRect highlightRectEnd = CGRectMake(rect.size.width - 1 - (MENU_STROKE_GAP), 0, 1, rect.size.height);
    CGRect strokeRectEnd = CGRectMake(rect.size.width - MENU_STROKE_GAP, 0, MENU_STROKE_GAP, rect.size.height);
    
    // next fill background
    CGContextSaveGState(context);
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    CGContextRestoreGState(context);
    
    // Highlight and Shadow
    // left vertical border
    CGContextSaveGState(context);
    CGContextSetFillColorWithColor(context, [[UIColor blackColor] colorWithAlphaComponent:0.2].CGColor);
    CGContextFillRect(context, strokeRect);
    CGContextRestoreGState(context);
    
    //left vertical highlight
    CGContextSaveGState(context);
    CGContextSetFillColorWithColor(context,  [[UIColor whiteColor] colorWithAlphaComponent:0.25].CGColor);
    CGContextFillRect(context, highlightRect);
    CGContextRestoreGState(context);
    
    // right highlight
    CGContextSaveGState(context);
    CGContextSetFillColorWithColor(context,  [[UIColor whiteColor] colorWithAlphaComponent:0.25].CGColor);
    CGContextFillRect(context, highlightRectEnd);
    CGContextRestoreGState(context);
    
    // right shadow
    CGContextSetFillColorWithColor(context, [[UIColor blackColor] colorWithAlphaComponent:0.2].CGColor);
    CGContextSaveGState(context);
    CGContextFillRect(context, strokeRectEnd);
    CGContextRestoreGState(context);
    
    // bottom border
    
    if(showBorder)
    {
        CGRect borderRect = CGRectMake(0, borderStart, rect.size.width, 1);
        
        CGContextSaveGState(context);
        CGContextSetStrokeColorWithColor(context, [UIColor colorWithHexString:COLOR_DARK_STROKE].CGColor);
        CGContextSetLineWidth(context, 1);
        CGContextStrokeRect(context, borderRect);
        CGContextRestoreGState(context);
    }
}

void drawClippedBackground(CGContextRef context, CGPathRef clipPath, CGRect frameRect, CGColorRef fillColor, CGFloat alpha)
{
    float barLength = (frameRect.size.width / 3);
    CGRect highlightedStrokeRect =  CGRectMake(0, 0, MENU_STROKE_GAP, frameRect.size.height);
    CGRect highlightedHighlightRect = CGRectMake(MENU_STROKE_GAP, 0, 1, frameRect.size.height);
    CGRect fillRect1 = CGRectMake(0, 0, barLength + MENU_STROKE_GAP + 1, frameRect.size.height);
    CGRect fillRect2 = CGRectMake(MENU_STROKE_GAP + 1 + barLength, 0, 1.5, frameRect.size.height - 2.5);
    CGRect fillRect3 = CGRectMake(MENU_STROKE_GAP + 1 + barLength + 1.5, 0, barLength - CARD_BORDER_WIDTH, frameRect.size.height);
    CGRect fillRect4 = CGRectMake(MENU_STROKE_GAP + 1 + barLength + 1.5 + barLength - CARD_BORDER_WIDTH, 0, 1.5, frameRect.size.height - 2.5);
    CGRect fillRect5 = CGRectMake(MENU_STROKE_GAP + 1 + barLength + 1.5 + barLength - CARD_BORDER_WIDTH + 1.5, 0, barLength + MENU_STROKE_GAP + 1, frameRect.size.height);
    CGRect highlightedFillRect = CGRectMake(frameRect.size.width - MENU_STROKE_GAP - 1, 0, 1, frameRect.size.height);
    CGRect endHighlightRect = CGRectMake(frameRect.size.width - MENU_STROKE_GAP, 0, MENU_STROKE_GAP, frameRect.size.height);
    
    // fill
    CGContextSaveGState(context);
    CGContextSetFillColorWithColor(context, fillColor);
    CGContextAddPath(context, clipPath);
    CGContextClip(context);
    CGContextFillRect(context, fillRect1);
    CGContextFillRect(context, fillRect2);
    CGContextFillRect(context, fillRect3);
    CGContextFillRect(context, fillRect4);
    CGContextFillRect(context, fillRect5);
    CGContextRestoreGState(context);
    
    // left vertical border
    CGContextSaveGState(context);
    CGContextSetFillColorWithColor(context, [[UIColor blackColor] colorWithAlphaComponent:alpha].CGColor);
    CGContextAddPath(context, clipPath);
    CGContextClip(context);
    CGContextFillRect(context, highlightedStrokeRect);
    CGContextRestoreGState(context);
    
    //left vertical highlight
    CGContextSaveGState(context);
    CGContextSetFillColorWithColor(context,  [[UIColor whiteColor] colorWithAlphaComponent:alpha].CGColor);
    CGContextAddPath(context, clipPath);
    CGContextClip(context);
    CGContextFillRect(context, highlightedHighlightRect);
    CGContextRestoreGState(context);
    
    // right vertical highlight
    CGContextSaveGState(context);
    CGContextSetFillColorWithColor(context,  [[UIColor whiteColor] colorWithAlphaComponent:alpha].CGColor);
    CGContextAddPath(context, clipPath);
    CGContextClip(context);
    CGContextFillRect(context, highlightedFillRect);
    CGContextRestoreGState(context);
    
    // right vertical border
    CGContextSaveGState(context);
    CGContextSetFillColorWithColor(context, [[UIColor blackColor] colorWithAlphaComponent:alpha].CGColor);
    CGContextAddPath(context, clipPath);
    CGContextClip(context);
    CGContextFillRect(context, endHighlightRect);
    CGContextRestoreGState(context);
}

void drawLinearGradient(CGContextRef context, CGRect rect, CGColorRef startColor, CGColorRef  endColor)
{
	CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
	CGFloat locations[] = { 0.0, 1.0 };
	
	NSArray *colors = [NSArray arrayWithObjects:(__bridge id)startColor, (__bridge id)endColor, nil];
	
	CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef) colors, locations);
	
	CGPoint startPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMinY(rect));
	CGPoint endPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMaxY(rect));
	
	CGContextSaveGState(context);
	CGContextAddRect(context, rect);
	CGContextClip(context);
	CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
	CGContextRestoreGState(context);
	
	CGGradientRelease(gradient);
	CGColorSpaceRelease(colorSpace);
}

void drawRadialGradient(CGContextRef context, CGRect rect, CGPoint startCenter, CGPoint endCenter, CGFloat startRadius, CGFloat endRadius, CGColorRef startColor, CGColorRef  endColor)
{
	CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
	CGFloat locations[] = { 0.0, 1.0 };
	
	NSArray *colors = [NSArray arrayWithObjects:(__bridge id)startColor, (__bridge id)endColor, nil];
	
	CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef) colors, locations);
	
	CGContextSaveGState(context);
	CGContextAddRect(context, rect);
	CGContextClip(context);
	CGContextDrawRadialGradient(context, gradient, startCenter, startRadius, endCenter, endRadius, kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
	CGContextRestoreGState(context);
	
	CGGradientRelease(gradient);
	CGColorSpaceRelease(colorSpace);
}

void drawStroke(CGContextRef context, CGPoint startPoint, CGPoint endPoint, CGColorRef color, CGFloat lineWidth)
{
	
	CGContextSaveGState(context);
	CGContextSetLineCap(context, kCGLineCapRound);
	CGContextSetStrokeColorWithColor(context, color);
	CGContextSetLineWidth(context, lineWidth);
	CGContextMoveToPoint(context, startPoint.x + 0.5, startPoint.y + 0.5);
	CGContextAddLineToPoint(context, endPoint.x + 0.5, endPoint.y + 0.5);
	CGContextStrokePath(context);
	CGContextRestoreGState(context);
	
}

void drawGlossAndGradient(CGContextRef context, CGRect rect, CGColorRef startColor, CGColorRef endColor)
{
	
	drawLinearGradient(context, rect, startColor, endColor);
	
	CGColorRef glossColor1 = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.35].CGColor;
	CGColorRef glossColor2 = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.1].CGColor;
	
	CGRect topHalf = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height/2);
	
	drawLinearGradient(context, topHalf, glossColor1, glossColor2);
	
}

CGMutablePathRef createRoundedRectForRect(CGRect rect, CGFloat radius)
{
	CGMutablePathRef path = CGPathCreateMutable();
	CGPathMoveToPoint(path, NULL, CGRectGetMidX(rect), CGRectGetMinY(rect));
	CGPathAddArcToPoint(path, NULL, CGRectGetMaxX(rect), CGRectGetMinY(rect), CGRectGetMaxX(rect), CGRectGetMaxY(rect), radius);
	CGPathAddArcToPoint(path, NULL, CGRectGetMaxX(rect), CGRectGetMaxY(rect), CGRectGetMinX(rect), CGRectGetMaxY(rect), radius);
	CGPathAddArcToPoint(path, NULL, CGRectGetMinX(rect), CGRectGetMaxY(rect), CGRectGetMinX(rect), CGRectGetMinY(rect), radius);
	CGPathAddArcToPoint(path, NULL, CGRectGetMinX(rect), CGRectGetMinY(rect), CGRectGetMaxX(rect), CGRectGetMinY(rect), radius);
	CGPathCloseSubpath(path);
	
	return path;
}

#pragma mark -
#pragma mark General Purpose Methods


///////////////////////////////////////////////////////////////////////////////////////////////////
CGFloat boundf(CGFloat value, CGFloat min, CGFloat max)
{
	if (max < min)
	{
		max = min;
	}
	
	CGFloat bounded = value;
	if (bounded > max)
	{
		bounded = max;
	}
	
	if (bounded < min)
	{
		bounded = min;
	}
	
	return bounded;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
NSInteger boundi(NSInteger value, NSInteger min, NSInteger max)
{
	if (max < min)
	{
		max = min;
	}
	
	NSInteger bounded = value;
	if (bounded > max)
	{
		bounded = max;
	}
	
	if (bounded < min)
	{
		bounded = min;
	}
	
	return bounded;
}
