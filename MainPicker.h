//
//  MainPicker.h
//  DrawChat
//
//  Created by Yoanna Mareva on 5/19/15.
//  Copyright (c) 2015 Yoanna Mareva. All rights reserved.
//

#import "BasePicker.h"

@interface MainPicker : UIView <UIGestureRecognizerDelegate>

@property (nonatomic, strong) CAGradientLayer* gradientW;

@property (nonatomic, strong) CAGradientLayer* gradientB;

@property (nonatomic, strong) UIView* picker;

@property (nonatomic, strong) UIColor* pickedColor;

@property (nonatomic, strong) NSArray* colors;

-(void)update;
@end
