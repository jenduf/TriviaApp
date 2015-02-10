//
//  ProfileImageView.m
//  MyTrivie
//
//  Created by Jennifer Duffey on 1/15/15.
//  Copyright (c) 2015 Jennifer Duffey. All rights reserved.
//

#import "ProfileImageView.h"

@implementation ProfileImageView

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if(self)
    {
        
    }
    
    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if(self.delegate)
    {
        UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showAvatars:)];
        [self addGestureRecognizer:recognizer];
    }
}

- (void)setAvatarID:(NSInteger)avatarID
{
    _avatarID = avatarID;
    
    [self setNeedsDisplay];
}

- (void)setSelected:(BOOL)selected
{
    _selected = selected;
    
    [self setNeedsDisplay];
}

- (void)showAvatars:(UIGestureRecognizer *)recognizer
{
    [self.delegate profileImageViewDidRequestShowAvatars:self];
}

/*
- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
{
    layer.masksToBounds = YES;
    layer.backgroundColor = [Utils backgroundColorForAvatarID:self.avatarID].CGColor;
    layer.cornerRadius = self.cornerRadius;
    layer.borderWidth = PROFILE_BORDER_WIDTH;
    layer.borderColor = [Utils fillColorForTrivieColor:(TrivieColor)self.tag].CGColor;
    
    if(self.selected)
    {
        layer.shadowColor = [UIColor colorWithHexString:COLOR_AVATAR_BORDER].CGColor;
        layer.shadowRadius = 4.0;
        layer.shadowOpacity = 1.0;
        layer.shadowOffset = CGSizeZero;
    }
    else
    {
        layer.shadowOpacity = 0.4;
        layer.shadowRadius = 0.0;
        layer.shadowColor = [UIColor blackColor].CGColor;
        layer.shadowOffset = CGSizeMake(0, 1);
    }
}
*/

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGRect innerRect = CGRectInset(rect, 4, 4);
    CGPathRef innerPath = createRoundedRectForRect(innerRect, self.cornerRadius);
    
    // background
    UIColor *bgColor = [Utils backgroundColorForAvatarID:self.avatarID];
    UIColor *borderColor = [Utils fillColorForTrivieColor:(TrivieColor)self.tag];
    UIColor *shadowColor = (self.selected ? [UIColor colorWithHexString:COLOR_AVATAR_BORDER] : [[UIColor blackColor] colorWithAlphaComponent:0.4]);
    CGFloat blur = (self.selected ? 3.0 : 0.0);
    CGSize shadowOffset = (self.selected ? CGSizeZero : CGSizeMake(0, 1));
    
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, shadowOffset, blur, shadowColor.CGColor);
    CGContextSetFillColorWithColor(context, bgColor.CGColor);
    CGContextSetStrokeColorWithColor(context, borderColor.CGColor);
    CGContextSetLineWidth(context, PROFILE_BORDER_WIDTH);
    CGContextAddPath(context, innerPath);
   // CGContextEOClip(context);
    CGContextDrawPath(context, kCGPathFillStroke);
    CGContextRestoreGState(context);
    
    
    CGRect avatarRect = CGRectInset(innerRect, 2, 1);
    CGPathRef avatarPath = createRoundedRectForRect(avatarRect, self.cornerRadius);
    
    // avatar image
    NSString *imageName = [NSString stringWithFormat:@"%@%ld", IMAGE_AVATAR, (long)self.avatarID];
    UIImage *avatarImage = [UIImage imageNamed:imageName];
    
    CGContextSaveGState(context);
    
    // flip coordinates so image isn't drawn upside down
    CGContextTranslateCTM(context, 0.0f, CGRectGetHeight(rect));
    CGContextScaleCTM(context, 1.0f, -1.0f);
    CGContextAddPath(context, avatarPath);
    CGContextClip(context);
    CGContextAddPath(context, innerPath);
    CGContextDrawImage(context, innerRect, avatarImage.CGImage);
    CGContextRestoreGState(context);
}


@end
