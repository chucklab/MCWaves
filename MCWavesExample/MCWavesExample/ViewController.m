//
//  ViewController.m
//  MCWavesExample
//
//  Created by Chao Ma on 08/23/2016.
//  Copyright © 2016 iMegatron's Lab. All rights reserved.
//

#import "ViewController.h"
#import "WavesTableView.h"
#import "MCConstants.h"
#import "NormalWaveViewController.h"


@interface ViewController ()

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"MCWaves";
    
    WavesTableView *tableView = [[WavesTableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView = tableView;
    [self.view addSubview:tableView];
    tableView.backgroundColor = [UIColor whiteColor];
    tableView.cellTappedBlock = ^(NSIndexPath *indexPath, NSString *cellData){
        switch (indexPath.row) {
            case 0: { // Normal
                NormalWaveViewController *vc = [[NormalWaveViewController alloc] init];
                [self.navigationController pushViewController:vc animated:YES];
            } break;
                
            case 1: { // Multi lines
            } break;
                
            case 2: { // Long single line
            } break;
                
            case 3: { // Very long text
            } break;
                
            case 4: { // No message
            } break;
                
            default: {
                NormalWaveViewController *vc = [[NormalWaveViewController alloc] init];
                [self.navigationController pushViewController:vc animated:YES];
            } break;
        }
    };
    tableView.dataArray = @[
                            @"Normal",
                            @"Multi lines",
                            @"Long single line",
                            @"Very long text",
                            @"No message",
                            ];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
