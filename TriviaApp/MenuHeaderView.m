//
//  MenuHeaderView.m
//  MyTrivie
//
//  Created by Jennifer Duffey on 1/15/15.
//  Copyright (c) 2015 Jennifer Duffey. All rights reserved.
//

#import "MenuHeaderView.h"

@implementation MenuHeaderView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if(self)
    {
        self.backgroundColor = [UIColor clearColor];
    }
    
    return self;
}

- (void)setTrivieColor:(TrivieColor)trivieColor
{
    _trivieColor = trivieColor;
    
    self.fillColor = [Utils fillColorForTrivieColor:(trivieColor + 1)];
    
    NSString *imageName = [NSString stringWithFormat:@"%@_%li", IMAGE_MENU_HEADER, (long)trivieColor];
    self.headerImage = [UIImage imageNamed:imageName];
    
    self.headerText = [Utils menuHeaderTextForSection:trivieColor];
    
    [self setNeedsDisplay];
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    drawTrivieBackground(context, rect, self.fillColor, NO, 0);
    
    CGRect imageRect = CGRectMake((rect.size.width - self.headerImage.size.width) / 2, MENU_HEADER_PADDING, self.headerImage.size.width, self.headerImage.size.height);
    CGRect textRect = CGRectMake(0, rect.size.height - MENU_HEADER_PADDING, rect.size.width, rect.size.height / 2);
    
    CGContextSaveGState(context);
    
    // flip coordinates so image isn't drawn upside down
    CGContextTranslateCTM(context, 0.0f, CGRectGetHeight(rect));
    CGContextScaleCTM(context, 1.0f, -1.0f);
    
    CGContextSetShadowWithColor(context, CGSizeMake(0, 0), 1.0, [UIColor colorWithHexString:COLOR_DARK_STROKE].CGColor);
    CGContextDrawImage(context, imageRect, self.headerImage.CGImage);
    CGContextRestoreGState(context);
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.alignment = NSTextAlignmentCenter;
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    
    NSDictionary *drawAttributes = @{NSFontAttributeName: [UIFont fontWithName:FONT_MUSEO_700 size:FONT_SIZE_MENU_HEADER],  NSForegroundColorAttributeName: [UIColor whiteColor], NSParagraphStyleAttributeName: paragraphStyle};
    
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, CGSizeMake(0, 1), 1.0, [UIColor colorWithHexString:COLOR_DARK_STROKE].CGColor);
    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
    [self.headerText drawInRect:textRect withAttributes:drawAttributes];
    CGContextRestoreGState(context);
}

@end
