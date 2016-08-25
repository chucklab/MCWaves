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
} MCSinusoidType;

@interface MCSinusoid : NSObject

@property (nonatomic) MCSinusoidType sinusoidType;

@property (nonatomic) CGFloat waveSpeed;
@property (nonatomic) CGFloat angularSpeed;

// Sinusoid: y=Asin(ωx+φ)+k
@property (nonatomic) CGFloat y;
@property (nonatomic) CGFloat x;
@property (nonatomic) CGFloat A;
@property (nonatomic) CGFloat ω;
@property (nonatomic) CGFloat φ;
@property (nonatomic) CGFloat k;

@property (nonatomic) CFTimeInterval currTimestamp;

- (void)reset;

@end
