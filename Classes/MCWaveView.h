//
//  MCWaveView.h
//  MCWaveExample
//
//  Created by Chao Ma on 08/23/2016.
//  Copyright © 2016 iMegatron's Lab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MCWaveView : UIView

@property (nonatomic, strong) UIColor *waveColor;
@property (nonatomic, assign) NSTimeInterval waveTime;

@property (nonatomic, assign) CGFloat angularSpeed;
@property (nonatomic, assign) CGFloat waveSpeed;

#pragma mark - Wave life cycle.
- (BOOL)startWave;
- (void)pause;
- (void)stopWave;

@end
