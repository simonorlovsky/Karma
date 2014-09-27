//
//  DetailViewController.h
//  Karma
//
//  Created by Simon Orlovsky on 9/20/14.
//  Copyright (c) 2014 simonorlovsky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <FacebookSDK/FacebookSDK.h>

@interface DetailViewController : UIViewController<UITextFieldDelegate, UIAlertViewDelegate>

@property (strong, nonatomic) IBOutlet UILabel *typeLabel;
@property (strong, nonatomic) IBOutlet NSString *titleName;

@property (strong, nonatomic) IBOutlet UITextField *descriptionTextField;
@property (strong, nonatomic) IBOutlet UITextField *locationTextField;


@end
