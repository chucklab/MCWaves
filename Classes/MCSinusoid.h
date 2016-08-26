//
//  MCSinusoid.h
//  MCWave
//
//  Created by Chao Ma on 08/25/2016.
//  Copyright © 2016 iMegatron's Lab. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum MCSinusoidType {
    MCSinusoidTypeNone,
    MCSinusoidTypeNormal,
    MCSinusoidTypeDecay,
    MCSinusoidTypeDecayTwo,
} MCSinusoidType;

@interface MCSinusoid : NSObject

@property (nonatomic) MCSinusoidType sinusoidType;

@property (nonatomic) CGFloat waveSpeed;

// Sinusoid: y=Asin(ωx+φ)+k
@property (nonatomic) CGFloat y;
@property (nonatomic) CGFloat x;

// amplitude
@property (nonatomic) CGFloat A;

// angular velocity
@property (nonatomic) CGFloat ω;

// initial phase
@property (nonatomic) CGFloat φ;

// setover
@property (nonatomic) CGFloat k;

@property (nonatomic) CFTimeInterval currTimestamp;

- (void)reset;

@end
