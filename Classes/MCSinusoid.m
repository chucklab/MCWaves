//
//  MCSinusoid.m
//  MCWave
//
//  Created by Chao Ma on 08/25/2016.
//  Copyright © 2016 iMegatron's Lab. All rights reserved.
//

#import "MCSinusoid.h"
#import "MCEasing.h"

@interface MCSinusoid ()

@property (nonatomic) CGFloat decayedA;
@property (nonatomic) CGFloat increasedAngularVelocity;
@property (nonatomic) CGFloat increasedWaveSpeed;

@property (nonatomic) CFTimeInterval startTimestamp;

@end

@implementation MCSinusoid

- (instancetype)init {
    self = [super init];
    if (self == nil) {
        return nil;
    }
    
    self.sinusoidType = MCSinusoidTypeNormal;
    
    self.waveSpeed = 820.0;
    self.ω = 1.5;
    
    return self;
}

- (void)reset {
    self.startTimestamp = 0.0;
}

- (void)setX:(CGFloat)x {
    _x = x;
    
    CGFloat A = self.A;
    CGFloat ω = self.ω;
    CGFloat φ = self.φ;
    CGFloat k = self.k;
    
    // Sinusoid: y=Asin(ωx+φ)+k
    switch (self.sinusoidType) {
        case MCSinusoidTypeNone: {
            _y = A * sin(.01 * (ω * x + φ)) + k;
        } break;
            
        case MCSinusoidTypeNormal: {
            _y = A * sin(.01 * (ω * x + φ)) + k;
        } break;
            
        case MCSinusoidTypeDecay: {
            _y = _decayedA * sin(.01 * (ω * x + φ)) + k;
        } break;
            
        case MCSinusoidTypeDecayTwo: {
            _y = _decayedA * sin(.01 * (_increasedAngularVelocity * x + φ)) + k;
        } break;
    }
}

- (void)setCurrTimestamp:(CFTimeInterval)currTimestamp {
    _currTimestamp = currTimestamp;
    
    if (self.startTimestamp < 0.000001) {
        self.startTimestamp = currTimestamp;
        return;
    }
    
    CFTimeInterval elapsedTime = self.currTimestamp - self.startTimestamp;
    if (elapsedTime < 0.000001) {
        return;
    }
    
    switch (self.sinusoidType) {
        case MCSinusoidTypeNone: {
        } break;
            
        case MCSinusoidTypeNormal: {
            // x offset
            self.φ = -self.waveSpeed * elapsedTime;
        } break;
            
        case MCSinusoidTypeDecay: {
            // x offset
            self.φ = -self.waveSpeed * elapsedTime;
            
            // amplitude decay
            self.decayedA = [MCEasing easingFromValue:self.A toValue:0 totalTime:10 currTime:elapsedTime function:QuinticEaseOut];
        } break;
            
        case MCSinusoidTypeDecayTwo: {
            // amplitude decay
            self.decayedA = [MCEasing easingFromValue:self.A toValue:0 totalTime:10 currTime:elapsedTime function:QuinticEaseOut];
            
            // angular velocity increase
            self.increasedAngularVelocity = [MCEasing easingFromValue:self.ω toValue:self.ω * 10 totalTime:10 currTime:elapsedTime function:CubicEaseIn];
            
            // wave speed increase
            self.increasedWaveSpeed = [MCEasing easingFromValue:self.waveSpeed toValue:self.waveSpeed * 5 totalTime:10 currTime:elapsedTime function:CubicEaseIn];
            
            // x offset
            self.φ = -self.increasedWaveSpeed * elapsedTime;
        } break;
    }
}

@end
