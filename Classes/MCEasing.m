//
//  MCEasing.m
//  MCWave
//
//  Created by Chao Ma on 08/25/2016.
//  Copyright © 2016 iMegatron's Lab. All rights reserved.
//

#import "MCEasing.h"

@implementation MCEasing

+ (CGFloat)easingFromValue:(CGFloat)fromValue
                   toValue:(CGFloat)toValue
                 totalTime:(CFTimeInterval)totalTime
                  currTime:(CFTimeInterval)currTime
                  function:(AHEasingFunction)function
{
    if (currTime > totalTime) {
        return toValue;
    }
    
    CGFloat t = currTime / totalTime;
    CGFloat value = fromValue + function(t) * (toValue - fromValue);
    return value;
}

@end
