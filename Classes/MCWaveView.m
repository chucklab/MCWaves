//
//  MCWaveView.m
//  MCWaveExample
//
//  Created by Chao Ma on 08/23/2016.
//  Copyright © 2016 iMegatron's Lab. All rights reserved.
//

#import "MCWaveView.h"

@interface MCWaveView ()

@property (nonatomic, strong) CADisplayLink *waveDisplayLink;
@property (nonatomic, strong) CAShapeLayer *waveShapeLayer;

@property (nonatomic, assign) BOOL waving;
@property (nonatomic, assign) CGFloat offsetX;
@property (nonatomic, assign) CGFloat offsetY;

@end

@implementation MCWaveView

#pragma mark - Main inits.
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self == nil) {
        return nil;
    }
    
    self.angularSpeed = 1.5;
    self.waveSpeed = 12;
    self.waveColor = [UIColor whiteColor];
    self.waveTime = 0;
    
    return self;
}

- (instancetype)init {
    self = [self initWithFrame:CGRectMake(0, 0, 1, 1)];
    if (self == nil) {
        return nil;
    }
    
    return self;
}

#pragma mark - Getters && Setters
- (CAShapeLayer *)waveShapeLayer {
    if (_waveShapeLayer) {
        return _waveShapeLayer;
    }
    
    _waveShapeLayer = [CAShapeLayer layer];
    _waveShapeLayer.fillColor = self.waveColor.CGColor;
    
    [self.layer addSublayer:_waveShapeLayer];
    
    return _waveShapeLayer;
}

#pragma mark - Wave life cycle.
- (BOOL)startWave {
    if (self.waving) {
        return NO;
    }
    
    self.waving = YES;
    
    [self updateWave];
    self.waveDisplayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(updateWave)];
    [self.waveDisplayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    
    if (self.waveTime > 0.0) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(self.waveTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self stopWave];
        });
    }
    
    return YES;
}

- (void)updateWave {
    //NSLog(@"duration:%@", @(self.waveDisplayLink.duration));
    NSLog(@"fps:%@", @(1 / self.waveDisplayLink.duration));
    
    self.offsetX -= self.waveSpeed;
    CGFloat width = CGRectGetWidth(self.frame);
    CGFloat height = CGRectGetHeight(self.frame);
    
    CGMutablePathRef path = CGPathCreateMutable();
    
    // Move to start point
    CGPathMoveToPoint(path, nil, 0, height / 2);
    
    // Sinusoid
    CGFloat y = 0.0;
    for (CGFloat x = 0.0; x < width + 0.000001; x++) {
        y = height * sin(.01 * (self.angularSpeed * x + self.offsetX));
        CGPathAddLineToPoint(path, nil, x, y);
    }
    
    // Move to right bottom corner
    CGPathAddLineToPoint(path, nil, width, height);
    
    // Move to left bottom corner
    CGPathAddLineToPoint(path, nil, 0, height);
    
    // Connect current point to start point
    CGPathCloseSubpath(path);
    
    self.waveShapeLayer.path = path;
    CGPathRelease(path);
}

- (void)pause {
    self.waveDisplayLink.paused = !self.waveDisplayLink.paused;
}

- (void)stopWave {
    [UIView animateWithDuration:2.0
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^(){
                     }completion:^(BOOL finished){
                         self.waving = NO;
                         [self.waveDisplayLink invalidate];
                         self.waveDisplayLink = nil;
                         self.waveShapeLayer.path = nil;
                     }];
}

@end
