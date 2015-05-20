//
//  DCDrawPlot.h
//  DrawChat
//
//  Created by Yoanna Mareva on 5/20/15.
//  Copyright (c) 2015 Yoanna Mareva. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DCColorPicker.h"

@interface DCDrawPlot : UIView

@property (nonatomic, strong) UIColor* currentColor;

@property (nonatomic) CGFloat lineWidth;

@property (nonatomic, strong) DCColorPicker* colorPicker;
@end
