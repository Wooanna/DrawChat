//
//  Line.h
//  DrawChat
//
//  Created by Yoanna Mareva on 5/20/15.
//  Copyright (c) 2015 Yoanna Mareva. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Line : NSObject

@property (nonatomic)CGPoint start;

@property (nonatomic)CGPoint end;

@property (nonatomic)CGFloat width;

@property (nonatomic, strong) UIColor* color;

-(instancetype)initWithStart:(CGPoint)start end:(CGPoint)end width:(CGFloat)width color:(UIColor*)color transparency:(CGFloat) transparency;

@end
