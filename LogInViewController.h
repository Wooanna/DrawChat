//
//  LogInViewController.h
//  DrawChat
//
//  Created by Yoanna Mareva on 5/27/15.
//  Copyright (c) 2015 Yoanna Mareva. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface LogInViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@property (strong, nonatomic) IBOutlet FBSDKLoginButton *loginButton;

@property (strong, nonatomic) IBOutlet UIButton *continueButton;
- (IBAction)showMain:(id)sender;

@end
