//
//  HuePicker.h
//  DrawChat
//
//  Created by Yoanna Mareva on 5/19/15.
//  Copyright (c) 2015 Yoanna Mareva. All rights reserved.
//

#import "BasePicker.h"

@interface HuePicker : UIView <UIGestureRecognizerDelegate>

@property (nonatomic, strong) CAGradientLayer* gradient;

@property (nonatomic, strong) UIView* picker;

@property (nonatomic, strong) UIColor* pickedColor;

@property (nonatomic, strong) NSMutableArray* colors;

- (void)update;
@end
