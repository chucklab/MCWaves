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
#import "NormalWaveViewController.h"


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
                                  @"1. Normal" : ^(){
                                      NormalWaveViewController *vc = [[NormalWaveViewController alloc] init];
                                      [self.navigationController pushViewController:vc animated:YES];
                                  },
                                  @"2. Multi lines" : ^(){ NSLog(@"Multi, tapped."); },
                                  @"3. Long single line" : ^(){ NSLog(@"Long, tapped."); },
                                  @"4. Very long text" : ^(){ NSLog(@"Very, tapped."); },
                                  @"5. No message" : ^(){ NSLog(@"No, tapped."); }
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
