//
//  ViewController.m
//  MCWavesExample
//
//  Created by Chao Ma on 08/23/2016.
//  Copyright © 2016 iMegatron's Lab. All rights reserved.
//

#import "ViewController.h"
#import "MCConstants.h"
#import "MCCommonTableView.h"
#import "WaveViewController.h"
#import "MCSinusoid.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"MCWaves";
    
    // Example
    MCCommonTableView *tableView = [MCCommonTableView tableViewWithFrame:self.view.bounds];
    [self.view addSubview:tableView];
    tableView.dataMap = @{
                          @"Day One" : @{
                                  @"1. None" : ^(){
                                      WaveViewController *vc = [[WaveViewController alloc] init];
                                      vc.sinusoidType = MCSinusoidTypeNone;
                                      [self.navigationController pushViewController:vc animated:YES];
                                  },
                                  @"2. Normal" : ^(){
                                      WaveViewController *vc = [[WaveViewController alloc] init];
                                      vc.sinusoidType = MCSinusoidTypeNormal;
                                      [self.navigationController pushViewController:vc animated:YES];
                                  },
                                  @"3. Decay" : ^(){
                                      WaveViewController *vc = [[WaveViewController alloc] init];
                                      vc.sinusoidType = MCSinusoidTypeDecay;
                                      [self.navigationController pushViewController:vc animated:YES];
                                  },
                                  @"4. Decay Two" : ^(){
                                      WaveViewController *vc = [[WaveViewController alloc] init];
                                      vc.sinusoidType = MCSinusoidTypeDecayTwo;
                                      [self.navigationController pushViewController:vc animated:YES];
                                  },
                                  },
                          @"Day two" : @{
                                  @"1. Normal" : ^(){ NSLog(@"Normal, tapped."); },
                                  @"2. Multi lines" : ^(){ NSLog(@"Multi, tapped."); },
                                  @"3. Long single line" : ^(){ NSLog(@"Long, tapped."); },
                                  @"4. Very long text" : ^(){ NSLog(@"Very, tapped."); },
                                  @"5. No message" : ^(){ NSLog(@"No, tapped."); }
                                  }
                          };
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
