//
//  Line.m
//  DrawChat
//
//  Created by Yoanna Mareva on 5/20/15.
//  Copyright (c) 2015 Yoanna Mareva. All rights reserved.
//

#import "Line.h"

@implementation Line

-(instancetype)initWithStart:(CGPoint)start end:(CGPoint)end width:(CGFloat)width color:(UIColor*)color transparency:(CGFloat) transparency
{
    self = [super init];
    if (self) {
        _start = start;
        _end = end;
        _width = width;
        _color = [color colorWithAlphaComponent:transparency];
    }
    return self;
}

@end
