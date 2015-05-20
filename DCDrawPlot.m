//
//  DCDrawPlot.m
//  DrawChat
//
//  Created by Yoanna Mareva on 5/20/15.
//  Copyright (c) 2015 Yoanna Mareva. All rights reserved.
//

#import "DCDrawPlot.h"
#import "Line.h"
#import "DCColorPicker.h"

@implementation DCDrawPlot
{
    NSMutableArray * _lines;
    CGPoint lastPoint;
    
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _colorPicker = [[DCColorPicker alloc] init];
        _colorPicker.frame = CGRectMake(40, 40, 300, 500);
        _colorPicker.hidden = YES;
        [self addSubview:_colorPicker];

        self.backgroundColor = [UIColor yellowColor];
        _lines = [NSMutableArray new];
        _currentColor = [UIColor blackColor];
      
        _lineWidth = 10;
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    lastPoint = [[touches anyObject] locationInView:self];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint newPoint = [[touches anyObject] locationInView:self];
    [ _lines addObject:[[Line alloc] initWithStart:lastPoint end:newPoint width:_lineWidth color:_currentColor transparency: _colorPicker.transparency]];
    lastPoint = newPoint;
    
    [self setNeedsDisplay];
}

-(void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    for (Line* line in _lines) {
        //OPTIMIZATION NEEDED> IF COLOR IS DIFFERENT BEGINPATH/STROKEPATH.
        CGContextBeginPath(ctx);
        CGContextMoveToPoint(ctx, line.start.x, line.start.y);
        CGContextAddLineToPoint(ctx, line.end.x, line.end.y);
        CGContextSetStrokeColorWithColor(ctx, line.color.CGColor);
        CGContextSetLineWidth(ctx, line.width);
        CGContextStrokePath(ctx);
    }
     CGContextSetLineCap(ctx, kCGLineCapRound);
}
@end