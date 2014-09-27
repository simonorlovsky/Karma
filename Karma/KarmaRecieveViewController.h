//
//  KarmaRecieveViewController.h
//  Karma
//
//  Created by Simon Orlovsky on 9/21/14.
//  Copyright (c) 2014 simonorlovsky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface KarmaRecieveViewController : UIViewController


@property (strong, nonatomic) IBOutlet PFObject *request;


@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (strong, nonatomic) IBOutlet UILabel *locationLabel;

@property (nonatomic) int rowSelected;

@end
