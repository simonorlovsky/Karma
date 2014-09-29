//
//  NewsDetailViewController.h
//  Karma
//
//  Created by Simon Orlovsky on 9/27/14.
//  Copyright (c) 2014 simonorlovsky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface NewsDetailViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (strong, nonatomic) IBOutlet UILabel *peopleLabel;

@property (strong, nonatomic) IBOutlet PFObject *completed;

@end
