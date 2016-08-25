//
//  MCEasing.h
//  MCWave
//
//  Created by Chao Ma on 08/25/2016.
//  Copyright © 2016 iMegatron's Lab. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "easing.h"

@interface MCEasing : NSObject

+ (CGFloat)easingFromValue:(CGFloat)fromValue
                   toValue:(CGFloat)toValue
                 totalTime:(CFTimeInterval)totalTime
                  currTime:(CFTimeInterval)currTime
                  function:(AHEasingFunction)function;

@end
