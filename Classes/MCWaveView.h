//
//  MCWaveView.h
//  MCWave
//
//  Created by Chao Ma on 08/23/2016.
//  Copyright © 2016 iMegatron's Lab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MCSinusoid.h"

@interface MCWaveView : UIView

@property (nonatomic, strong) UIColor *waveColor;
@property (nonatomic) NSTimeInterval waveTime;
@property (nonatomic) MCSinusoidType sinusoidType;

@property (nonatomic) BOOL printStatus;

#pragma mark - Wave life cycle.
- (BOOL)startWave;
- (void)pause;
- (void)stopWave;

@end
