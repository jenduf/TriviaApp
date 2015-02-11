//
//  AnimatedImageView.h
//  MyTrivie
//
//  Created by Jennifer Duffey on 1/17/15.
//  Copyright (c) 2015 Jennifer Duffey. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AnimatedImageViewDelegate;

@interface AnimatedImageView : UIView

@property (nonatomic, weak) IBOutlet id <AnimatedImageViewDelegate> delegate;

@property (nonatomic, weak) IBOutlet UIImageView *animatedImage;

@property (nonatomic, assign) BOOL isPlaying;

- (void)startPlayingImageName:(NSString *)name totalImages:(NSInteger)total frames:(NSTimeInterval)frames autoReverse:(BOOL)autoReverse autoRepeat:(BOOL)autoRepeat andDelegate:(id)delegate;
- (void)resumePlaying;
- (void)stopPlaying;

@end

@protocol AnimatedImageViewDelegate

- (void)imageView:(AnimatedImageView *)animatedImageView didStartAnimation:(NSString *)animationName;
- (void)imageView:(AnimatedImageView *)animatedImageView didFinishAnimation:(NSString *)animationName;
- (void)imageView:(AnimatedImageView *)animatedImageView didPauseAnimation:(NSString *)animationName;

@end
