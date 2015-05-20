//
//  BasePicker.m
//  DrawChat
//
//  Created by Yoanna Mareva on 5/19/15.
//  Copyright (c) 2015 Yoanna Mareva. All rights reserved.
//

#import "BasePicker.h"

@implementation BasePicker

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _gradient = [CAGradientLayer layer];
    }
    
    return self;
}
@end
