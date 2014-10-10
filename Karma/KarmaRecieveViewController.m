//
//  KarmaRecieveViewController.m
//  Karma
//
//  Created by Simon Orlovsky on 9/21/14.
//  Copyright (c) 2014 simonorlovsky. All rights reserved.
//

#import "KarmaRecieveViewController.h"
#import <Parse/Parse.h>

@interface KarmaRecieveViewController ()
{
    NSMutableArray *_requests;
    NSMutableArray *_descArray;
}


@end

@implementation KarmaRecieveViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    // Do any additional setup after loading the view.
    _requests = [[NSMutableArray alloc] init];
    _descArray= [[NSMutableArray alloc] init];
    PFQuery *query = [PFQuery queryWithClassName:@"request"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        
        if (!error) {
            // The find succeeded.
            NSLog(@"Successfully retrieved %ld requests.", objects.count);
            NSLog(@"Type is.... %@",_request[@"description"]);
            // Do something with the found objects
            for (PFObject *object in objects) {
                
                [_requests addObject:object[@"type"]];
                
            }
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    
    _titleLabel.text = _request[@"type"];
    _descriptionLabel.text = _request[@"description"];
    _locationLabel.text = _request[@"location"];
    _userLabel.text = _request[@"User"];
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)confirmButtonPressed:(id)sender {
    UIAlertView * alert =[[UIAlertView alloc ] initWithTitle:@"Are you sure?"
                                                     message:@"Please confirm request"
                                                    delegate:self
                                           cancelButtonTitle:@"Cancel"
                                           otherButtonTitles: nil];
    [alert addButtonWithTitle:@"I'm sure"];
    [alert show];
    
    
    
    }

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    NSLog(@"Button Index =%ld",buttonIndex);
    if (buttonIndex == 0)
    {
        NSLog(@"You have clicked Cancel");
    }
    else if(buttonIndex == 1)
    {
        NSLog(@"You have clicked I'm sure");
    }
    
    [self sendCompleted];
    
}

-(void)sendCompleted{
    [self performSegueWithIdentifier:@"confirmSegue" sender:self];
    NSLog(@"%i",_rowSelected);
    
    
    PFObject *completed = [PFObject objectWithClassName:@"completed"];
    completed[@"type"] = _request[@"type"];
    completed[@"description"] = _request[@"description"];

    [completed saveInBackground];
    NSLog(@"type %@", completed[@"type"]);
    NSLog(@"Success!!");

}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
