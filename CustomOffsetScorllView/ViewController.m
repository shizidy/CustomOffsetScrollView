//
//  ViewController.m
//  CustomOffsetScorllView
//
//  Created by wdyzmx on 2018/4/12.
//  Copyright © 2018年 wdyzmx. All rights reserved.
//

#import "ViewController.h"
#import "CustomScrollView.h"
#define kscreenWidth [UIScreen mainScreen].bounds.size.width
#define kscreenHeight [UIScreen mainScreen].bounds.size.height
@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
     CustomScrollView *scrollView = [[CustomScrollView alloc] initWithFrame:CGRectMake(0, 20, kscreenWidth, 300) margin:30 gap:20 sourceArray:@[@"1", @"2", @"3", @"4", @"5", @"6"]];
    [self.view addSubview:scrollView];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
