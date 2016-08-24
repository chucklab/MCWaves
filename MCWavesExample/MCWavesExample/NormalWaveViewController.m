//
//  NormalWaveViewController.m
//  MCWavesExample
//
//  Created by Chao Ma on 08/24/2016.
//  Copyright © 2016 iMegatron's Lab. All rights reserved.
//

#import "NormalWaveViewController.h"
#import "MCConstants.h"
#import "MCWaveView.h"
#import <Masonry.h>

@interface NormalWaveViewController ()

@property (nonatomic, strong) MCWaveView *waveView;

@end

@implementation NormalWaveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"NormalWave";
    
    // Header view
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, MainScreenWidth, 150)];
    [self.view addSubview:headerView];
    headerView.backgroundColor = UIColorFromRGB(0x61c3d4);
    
    // Wave view
    MCWaveView *waveView = [[MCWaveView alloc] initWithFrame:CGRectMake(0, 150 - 20, MainScreenWidth, 20)];
    self.waveView = waveView;
    [self.view addSubview:waveView];
    waveView.printStatus = YES;
    [waveView startWave];
    
    // Tap gesture
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backgroundTapped)];
    [self.view addGestureRecognizer:tapGestureRecognizer];
    
    // Tip label
    UILabel *tipLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, MainScreenHeight-50, 1, 1)];
    [self.view addSubview:tipLabel];
    tipLabel.backgroundColor = [UIColor clearColor];
    tipLabel.textColor = [UIColor lightGrayColor];
    tipLabel.text = @"Tap to pause.";
    [tipLabel sizeToFit];
    tipLabel.center = self.view.center;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions
- (void)backgroundTapped {
    [self.waveView pause];
}

@end
