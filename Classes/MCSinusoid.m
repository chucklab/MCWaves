//
//  MCSinusoid.m
//  MCWave
//
//  Created by Chao Ma on 08/25/2016.
//  Copyright © 2016 iMegatron's Lab. All rights reserved.
//

#import "MCSinusoid.h"

@interface MCSinusoid ()

@property (nonatomic) CGFloat decayedA;

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
    self.angularSpeed = 1.5;
    
    self.ω = self.angularSpeed;
    
    return self;
}

- (void)reset {
    self.startTimestamp = 0.0;
}

- (void)setAngularSpeed:(CGFloat)angularSpeed {
    _angularSpeed = angularSpeed;
    _ω = angularSpeed;
}

- (void)setX:(CGFloat)x {
    _x = x;
    
    CGFloat A = self.A;
    CGFloat ω = self.ω;
    CGFloat φ = self.φ;
    CGFloat k = self.k;
    
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
            
            // decay
            CGFloat decay = 10.0;
            self.decayedA = self.A - decay * elapsedTime;
            self.decayedA = self.decayedA > 0 ? self.decayedA : 0;
        } break;
    }
}

@end
