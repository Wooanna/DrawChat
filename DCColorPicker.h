//
//  DCColorPicker.h
//  DrawChat
//
//  Copyright (c) 2015 Yoanna Mareva. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainPicker.h"
#import "HuePicker.h"
#import "TransparencyPicker.h"

@interface DCColorPicker : UIView

@property (nonatomic, strong) MainPicker* mainPicker;

@property (nonatomic, strong) TransparencyPicker* transparencyPicker;

@property (nonatomic, strong) HuePicker* huePicker;

@property (nonatomic, strong) UIColor* oldColor;

@property (nonatomic, strong) UIColor* NEWColor;

@property (nonatomic, strong) UIColor* currentColor;

@property (nonatomic) CGFloat transparency;

@property (nonatomic, strong) UIColor* hueColor;

@property (nonatomic) CGFloat width;

@end
