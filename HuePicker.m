//
//  HuePicker.m
//  DrawChat
//
//  Created by Yoanna Mareva on 5/19/15.
//  Copyright (c) 2015 Yoanna Mareva. All rights reserved.
//

#import "HuePicker.h"
#import "DCColorPicker.h"

@implementation HuePicker 
{
UIPanGestureRecognizer* _panGesture;
}
-(instancetype)init
{
    self = [super init];
    
    if (self) {
        _panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panned:)];
        [self addGestureRecognizer:_panGesture];
        _colors = [NSMutableArray new];
        _gradient = [CAGradientLayer layer];
         [self.layer insertSublayer:_gradient atIndex:0];
        _colors = [self colors];
        _gradient.colors = _colors;
        
        _picker = [[UIView alloc] init];
        [self addSubview:_picker];
        [self setupPicker];

    }
    return self;
}


-(NSMutableArray*)colors
{
    float INCREMENT = 0.05;
    for (float hue = 0.0; hue < 1.0; hue += INCREMENT) {
        UIColor *color = [UIColor colorWithHue:hue
                                    saturation:1.0
                                    brightness:1.0
                                         alpha:1.0];
        [_colors addObject:(id)color.CGColor];
    }
    
    return _colors;
}

-(void)layoutSubviews
{
    [super layoutSubviews];

    _gradient.frame = self.bounds;
    _picker.frame = CGRectMake(-2, 0, self.frame.size.width + 4, 4);
}

- (void)update
{
    _pickedColor = [self colorOfPoint:_picker.center];
    ((DCColorPicker*)self.superview).mainPicker.backgroundColor = _pickedColor;
    [((DCColorPicker*)self.superview).mainPicker update];
}

-(void)panned:(UIPanGestureRecognizer*)recognizer
{
    CGPoint translation = [recognizer translationInView:recognizer.view];
    if( _picker.center.y + translation.y > 0 && _picker.center.y + translation.y < self.frame.size.height) {
    _picker.center= CGPointMake(_picker.center.x, _picker.center.y + translation.y);
    [recognizer setTranslation:CGPointMake(0, 0) inView:recognizer.view];
    }
    [self update];
}

-(UIColor *) colorOfPoint:(CGPoint)point
{
    unsigned char pixel[4] = {0};
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(pixel,
                                                 1, 1, 8, 4, colorSpace, (CGBitmapInfo)kCGImageAlphaPremultipliedLast);
    
    CGContextTranslateCTM(context, -point.x, -point.y);
    
    [self.layer renderInContext:context];
    
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    UIColor *color = [UIColor colorWithRed:pixel[0]/255.0
                                     green:pixel[1]/255.0 blue:pixel[2]/255.0
                                     alpha:pixel[3]/255.0];
    return color;
}

-(void)setupPicker
{
    _picker.layer.cornerRadius = 2;
    _picker.layer.borderColor = [UIColor whiteColor].CGColor;
    _picker.layer.borderWidth = 1;
    _picker.backgroundColor = [UIColor clearColor];
}
@end
