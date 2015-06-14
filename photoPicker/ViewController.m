//
//  ViewController.m
//  photoPicker
//
//  Created by Chensh on 15/6/13.
//  Copyright (c) 2015年 Chensh. All rights reserved.
//

#import "ViewController.h"
#import "LogManager.h"


@interface ViewController ()
{
    NSTimer *timer;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    for (int i = 0; i < 30; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.tag = i;
        button.frame = CGRectMake((40 + 10) * (i % 5), (40 + 10) * (i / 5), 40, 40);
        button.backgroundColor = [UIColor redColor];
        [button setTitle:[NSString stringWithFormat:@"%d", i] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonDidTouch:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }
    
    [self startTimer];
}

- (void)startTimer
{
    [[LogManager defaultManager] addPage:@"page_timer" op:@"op_timer"];
    [self performSelector:@selector(startTimer) withObject:nil afterDelay:1.0f];
}

- (void)buttonDidTouch:(UIButton*)sender
{
    if (sender.tag == 29) {
        [[LogManager defaultManager] uploadFile];
    } else {
        [[LogManager defaultManager] addPage:[NSString stringWithFormat:@"page_%ld",(long)sender.tag] op:[NSString stringWithFormat:@"op_%ld", (long)sender.tag]];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
