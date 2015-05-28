//
//  ViewController.m
//  DrawChat
//
//  Created by Yoanna Mareva on 5/18/15.
//  Copyright (c) 2015 Yoanna Mareva. All rights reserved.
//

#import "ViewController.h"
#import "DCColorPicker.h"
#import "DCDrawPlot.h"
@interface ViewController ()

@end

@implementation ViewController
{
    
    DCDrawPlot* _drawPlot;
}

- (void)viewDidLoad {
    [super viewDidLoad];
       
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeInfoDark];
    btn.frame = CGRectMake(0, 0, 60, 30);
    [btn addTarget:self action:@selector(showColorPicker) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:btn];
    
    
    UIButton* back = [UIButton buttonWithType:UIButtonTypeCustom];
    [back setTitle:@"Back" forState:UIControlStateNormal];
    [back setBackgroundColor:[UIColor redColor]];
    back.frame = CGRectMake(0, self.view.frame.size.height - 30, 60, 30);
    [back addTarget:self action:@selector(backToPrev) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:back];

    _drawPlot = [[DCDrawPlot alloc] initWithFrame:CGRectMake(0, 40, self.view.frame.size.width, 500)];
    [self.view addSubview:_drawPlot];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

-(void)showColorPicker
{
    ((DCDrawPlot*)_drawPlot).colorPicker.hidden = NO;
    [self.view bringSubviewToFront:((DCDrawPlot*)_drawPlot).colorPicker];
}

-(void)backToPrev
{
 [self dismissViewControllerAnimated:YES completion:nil];
}
@end
