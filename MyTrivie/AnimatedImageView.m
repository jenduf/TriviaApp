//
//  AnimatedImageView.m
//  MyTrivie
//
//  Created by Jennifer Duffey on 1/17/15.
//  Copyright (c) 2015 Jennifer Duffey. All rights reserved.
//

#import "AnimatedImageView.h"

@interface AnimatedImageView ()

@property (nonatomic, strong) NSString *imageName;
@property (nonatomic, strong) CADisplayLink *displayLink;
@property (nonatomic, assign) NSInteger currentCount, totalCount;
@property (nonatomic, assign) BOOL isAutoRepeat, isAutoReverse, inReverse;

@end

@implementation AnimatedImageView

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if(self)
    {
        
    }
    
    return self;
}

- (void)startPlayingImageName:(NSString *)name totalImages:(NSInteger)total frames:(NSTimeInterval)frames autoReverse:(BOOL)autoReverse autoRepeat:(BOOL)autoRepeat andDelegate:(id)delegate
{
    self.delegate = delegate;
    
    self.currentCount = 0;
    
    self.totalCount = total;
    
    self.imageName = name;
    
    self.isAutoReverse = autoReverse;
    
    self.isAutoRepeat = autoRepeat;
    
    [self updateImage];
    
    if(self.displayLink == nil)
    {
        self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(update)];
    }
    
    self.displayLink.frameInterval = frames;
    
    [self.displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    
    self.isPlaying = YES;
}

- (void)resumePlaying
{
    [self.displayLink setPaused:NO];
}

- (void)stopPlaying
{
    [self.displayLink removeFromRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    
    [self.displayLink invalidate];
    
    self.displayLink = nil;
    
    [self.delegate imageView:self didFinishAnimation:self.imageName];
}

- (void)update
{
    if(self.inReverse)
        self.currentCount--;
    else
        self.currentCount++;
    
    if (self.currentCount < 0)
    {
        self.inReverse = NO;
        
        self.currentCount = 0;
        
        if(self.isAutoRepeat)
        {
            self.displayLink.paused = YES;
            
            [self performSelector:@selector(resumePlaying) withObject:nil afterDelay:1.0];
        }
        else
        {
            NSString *imageName = [NSString stringWithFormat:@"%@_0", self.imageName];
            
            self.animatedImage.image = [UIImage imageNamed:imageName];
            
            [self stopPlaying];
        }
        
        return;
    }
    else if(self.currentCount == self.totalCount)
    {
        if(self.isAutoReverse)
        {
            self.inReverse = YES;
            
            self.currentCount = self.totalCount - 1;
        }
        else if(self.isAutoRepeat)
        {
            self.currentCount = 0;
        }
        else
        {
            NSString *imageName = [NSString stringWithFormat:@"%@_%ld", self.imageName, self.totalCount - 1];
            
            self.animatedImage.image = [UIImage imageNamed:imageName];
            
            [self.delegate imageView:self didPauseAnimation:self.imageName];
            
            return;
        }
    }
    
    [self updateImage];
}

- (void)updateImage
{
    NSString *imageName = [NSString stringWithFormat:@"%@_%ld", self.imageName, self.currentCount];
    self.animatedImage.image = [UIImage imageNamed:imageName];
}

@end


