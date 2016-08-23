//
//  ViewController.m
//  MCWavesExample
//
//  Created by Chao Ma on 08/23/2016.
//  Copyright © 2016 iMegatron's Lab. All rights reserved.
//

#import "ViewController.h"
#import "MCWaveView.h"

// Colors
#define UIColorFromRGB(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0x00FF00) >>  8))/255.0 \
blue:((float)((rgbValue & 0x0000FF) >>  0))/255.0 \
alpha:1.0]

//Main Screen Size.
#define MainScreenWidth             ([[UIScreen mainScreen] bounds].size.width)
#define MainScreenHeight            ([[UIScreen mainScreen] bounds].size.height)

//Adapter Utils.
#define Scale2X                     (MainScreenWidth/320.0)
#define Scale2X_4_7_Inch            (MainScreenWidth/375.0)

// Fonts
//static UIFont *font(CGFloat size) {
//    return [UIFont fontWithName:@"Helvetica" size:size];
//}

// Colors
//static UIColor *buttonTitleColor() {
//    return UIColorFromRGB(0x337af0);
//}


@interface ViewController ()

@property (nonatomic, strong) MCWaveView *waveView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, MainScreenWidth, 150)];
    [self.view addSubview:headerView];
    headerView.backgroundColor = UIColorFromRGB(0x61c3d4);
    
    MCWaveView *waveView = [[MCWaveView alloc] initWithFrame:CGRectMake(0, 150 - 10, MainScreenWidth, 10)];
    self.waveView = waveView;
    [self.view addSubview:waveView];
    [waveView startWave];
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backgroundTapped)];
    [self.view addGestureRecognizer:tapGestureRecognizer];
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
