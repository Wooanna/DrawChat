//
//  MainPicker.m
//  DrawChat
//
//  Created by Yoanna Mareva on 5/19/15.
//  Copyright (c) 2015 Yoanna Mareva. All rights reserved.
//

#import "MainPicker.h"
#import "DCColorPicker.h"

@implementation MainPicker {
    UIPanGestureRecognizer* _panGesture;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
          _gradientW = [CAGradientLayer layer];
          _gradientB = [CAGradientLayer layer];
        _gradientW.colors = @[(id)[UIColor whiteColor].CGColor, (id)[UIColor clearColor].CGColor];
        _gradientW.startPoint = CGPointMake(0.0, 0.5);
        _gradientW.endPoint = CGPointMake(1.0, 0.5);
        _gradientB.colors = @[(id)[UIColor clearColor].CGColor, (id)[UIColor blackColor].CGColor];
     
          [self.layer insertSublayer:_gradientB atIndex:0];
           [self.layer insertSublayer:_gradientW atIndex:0];
        _panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panned:)];
        [self addGestureRecognizer:_panGesture];
        
        _picker = [[UIView alloc] init];
        [self addSubview:_picker];
        [self setupPicker];
    }
    return self;
}

- (void)update
{
    _pickedColor = [self colorOfPoint:_picker.center];
    
    ((DCColorPicker*)self.superview).transparencyPicker.mainColor = _pickedColor;
    ((DCColorPicker*)self.superview).NEWColor = _pickedColor;
}

-(void)panned:(UIPanGestureRecognizer*)recognizer
{
    CGPoint translation = [recognizer translationInView:recognizer.view];
    if( _picker.center.x + translation.x > 0 && _picker.center.x + translation.x < self.frame.size.width &&
       _picker.center.y + translation.y > 0 && _picker.center.y + translation.y < self.frame.size.height) {
        _picker.center= CGPointMake( _picker.center.x + translation.x, _picker.center.y + translation.y);
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

-(void)layoutSubviews
{
    [super layoutSubviews];
    _gradientW.frame = self.bounds;
    _gradientB.frame = self.bounds;
    _picker.frame = CGRectMake(0, 0, 10, 10);
}

-(void)setupPicker
{
    _picker.layer.cornerRadius = 5;
    _picker.layer.borderColor = [UIColor whiteColor].CGColor;
    _picker.layer.borderWidth = 2;
    _picker.backgroundColor = [UIColor clearColor];
}
@end
