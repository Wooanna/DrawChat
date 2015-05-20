//
//  TransparencyPicker.m
//  DrawChat
//
//  Created by Yoanna Mareva on 5/19/15.
//  Copyright (c) 2015 Yoanna Mareva. All rights reserved.
//

#import "TransparencyPicker.h"
#import "DCColorPicker.h"

@implementation TransparencyPicker
{
UIPanGestureRecognizer* _panGesture;
}
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        _gradient = [CAGradientLayer layer];
        _gradient.colors = @[(id)[UIColor clearColor].CGColor, (id)[UIColor whiteColor].CGColor];
        _gradient.startPoint = CGPointMake(0.0, 0.5);
        _gradient.endPoint = CGPointMake(1.0, 0.5);
        [self.layer insertSublayer:_gradient atIndex:0];
        _panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panned:)];
        [self addGestureRecognizer:_panGesture];
        
        _picker = [[UIView alloc] init];
        [self addSubview:_picker];
        [self setupPicker];

    }
    return self;
}

-(void)panned:(UIPanGestureRecognizer*)recognizer
{
    CGPoint translation = [recognizer translationInView:recognizer.view];
    if( _picker.center.x + translation.x > 0 && _picker.center.x + translation.x < self.frame.size.width) {
        _picker.center= CGPointMake( _picker.center.x + translation.x, _picker.center.y);
        [recognizer setTranslation:CGPointMake(0, 0) inView:recognizer.view];
    }
    _transparency = _picker.center.x / self.frame.size.width;
    ((DCColorPicker*)self.superview).transparency = _transparency;
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

-(void)setMainColor:(UIColor *)mainColor
{
 _gradient.colors = @[(id)[UIColor clearColor].CGColor, (id)mainColor.CGColor];
}

-(void)setupPicker
{
    _picker.layer.cornerRadius = 2;
    _picker.layer.borderColor = [UIColor whiteColor].CGColor;
    _picker.layer.borderWidth = 1;
    _picker.backgroundColor = [UIColor clearColor];
}

-(void)layoutSubviews
{
    _gradient.frame = self.bounds;
    _picker.frame = CGRectMake(self.frame.size.width - 4, -2, 4, self.frame.size.height + 4);
}
@end
