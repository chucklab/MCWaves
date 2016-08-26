//
//  ScrollWaveViewController.m
//  MCWavesExample
//
//  Created by Chao Ma on 08/26/2016.
//  Copyright © 2016 iMegatron's Lab. All rights reserved.
//

#import "ScrollWaveViewController.h"
#import "MCConstants.h"
#import "MCWaveView.h"
#import "Masonry.h"

@interface ScrollWaveViewController () <UIScrollViewDelegate>

@property (nonatomic, strong) MCWaveView *waveView;

@end

@implementation ScrollWaveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    switch (self.sinusoidType) {
        case MCSinusoidTypeNone: {
            self.title = @"TypeNone";
        } break;
            
        case MCSinusoidTypeNormal: {
            self.title = @"TypeNormal";
        } break;
            
        case MCSinusoidTypeDecay: {
            self.title = @"TypeDecay";
        } break;
            
        case MCSinusoidTypeDecayTwo: {
            self.title = @"TypeDecayTwo";
        } break;
    }
    
    // Scroll view
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:scrollView];
    scrollView.backgroundColor = [UIColor whiteColor];
    scrollView.contentSize = CGSizeMake(MainScreenWidth, 1000);
    scrollView.delegate = self;
    
    // Header view
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, MainScreenWidth, 150)];
    [scrollView addSubview:headerView];
    headerView.backgroundColor = UIColorFromRGB(0x61c3d4);
    
    // Wave view
    MCWaveView *waveView = [[MCWaveView alloc] initWithFrame:CGRectMake(0, -20, MainScreenWidth, 20)];
    self.waveView = waveView;
    [scrollView addSubview:waveView];
    waveView.backgroundColor = [UIColor whiteColor];
    waveView.waveColor = UIColorFromRGB(0x61c3d4);
    waveView.printStatus = NO;
    waveView.sinusoidType = self.sinusoidType;
    [waveView startWave];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [self.waveView stopWave];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"%f", scrollView.contentOffset.y);
    CGFloat amplitude = fabs(scrollView.contentOffset.y) * .2;
    const CGFloat MaxAmplitude = 20;
    self.waveView.amplitude = amplitude < MaxAmplitude ? amplitude : MaxAmplitude;
}


@end
