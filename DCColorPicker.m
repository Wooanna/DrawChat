//
//  DCColorPicker.m
//  DrawChat
//

//  Copyright (c) 2015 Yoanna Mareva. All rights reserved.
//

#import "DCColorPicker.h"
#import "HuePicker.h"
#import "TransparencyPicker.h"
#import "MainPicker.h"
#import "DCDrawPlot.h"

@implementation DCColorPicker
{
    UIView* _colorMetricsView;
    UILabel* _transparencyLabel;
    UIView* _newColorView;
    UIView* _oldColorView;
    UITapGestureRecognizer* _tapRecognizer;
    UILabel* _widthLabel;
    UISlider *_slider;

}

-(instancetype)init
{
    self = [super init];
    if (self) {
        
        _huePicker = [[HuePicker alloc] init];
        _huePicker.backgroundColor = [UIColor yellowColor];
        _mainPicker = [[MainPicker alloc] init];
        _transparencyPicker = [[TransparencyPicker alloc] init];
        _colorMetricsView = [[UIView alloc] init];
        self.backgroundColor = [UIColor colorWithRed:0.3 green:0.3 blue:0.3 alpha:1];
        _mainPicker.backgroundColor = [UIColor redColor];
        _transparencyPicker.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"checkerboard.png"]];
        _transparencyLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 330, 90, 20)];
        _transparencyLabel.text = @"Transparency:";
        _transparencyLabel.textColor = [UIColor whiteColor];
        _transparencyLabel.font = [UIFont fontWithName:@"GillSans" size:14];
        _tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped:)];
        [self addSubview:_transparencyLabel];
        [self addSubview:_huePicker];
        [self addSubview:_mainPicker];
        [self addSubview:_transparencyPicker];
        _NEWColor = [UIColor blackColor];
        _newColorView = [[UIView alloc] init];
        _oldColorView = [[UIView alloc] init];
        _newColorView.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"checkerboard.png"]];
        _newColorView.backgroundColor = _NEWColor;
        _oldColorView.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"checkerboard.png"]];
        [_newColorView addGestureRecognizer:_tapRecognizer];
        [self addSubview:_newColorView];
        [self addSubview:_oldColorView];
        
        _widthLabel = [[UILabel alloc] init];
        _widthLabel.text = [NSString stringWithFormat: @"Width: %f", _width ];
        _widthLabel.font = [UIFont fontWithName:@"GillSans" size:14];
        _widthLabel.textColor = [UIColor whiteColor];
        _slider = [[UISlider alloc] init];
        [_slider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
        [_slider setBackgroundColor:[UIColor clearColor]];
        _slider.continuous = YES;
        _slider.tintColor = [UIColor colorWithRed:0.976 green:0.416 blue:0.267 alpha:1];
        _slider.minimumValue = 1;
        _slider.maximumValue = 100;
        [self addSubview:_slider];
        [self addSubview:_widthLabel];
        
        _transparency = 1;
    
    }
    return self;
}
- (IBAction)sliderValueChanged:(UISlider *)sender {
    
    ((DCDrawPlot*)self.superview).lineWidth = sender.value;
    _widthLabel.text = [NSString stringWithFormat:@"Width: %f", sender.value];
}

-(void)setCurrentColor:(UIColor *)currentColor
{
    _mainPicker.backgroundColor = currentColor;
}

-(void)setNEWColor:(UIColor *)NEWColor
{
    _NEWColor = NEWColor;
    _newColorView.backgroundColor = NEWColor;
    ((DCDrawPlot*)self.superview).currentColor = _NEWColor;
}

-(void)tapped:(UITapGestureRecognizer*)recognizer
{
    _oldColor = _NEWColor;
    _oldColorView.backgroundColor = _oldColor;
    _NEWColor = recognizer.view.backgroundColor;    
    self.hidden = YES;
    
}

-(void)layoutSubviews
{
    _huePicker.frame = CGRectMake(self.frame.size.width - 60, 20, 30, 300);
    _mainPicker.frame = CGRectMake(20, 20,  self.frame.size.width - 90, 300);
    _transparencyPicker.frame = CGRectMake(20, 350,  self.frame.size.width - 50, 30);
    _colorMetricsView.frame = CGRectMake(0, 420,  self.frame.size.width, 100);
    _oldColorView.frame = CGRectMake(20, 450, self.frame.size.width/2-30, 35);
    _newColorView.frame = CGRectMake(20 + self.frame.size.width/2-30, 450, self.frame.size.width/2-20, 35);
    _widthLabel.frame = CGRectMake(20, 390, self.frame.size.width - 40, 20);
    _slider.frame = CGRectMake(20, 420, self.bounds.size.width - 50, 10);
}
@end
