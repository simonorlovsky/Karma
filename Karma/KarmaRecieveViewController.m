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
            // Do something with the found objects
            for (PFObject *object in objects) {
                NSLog(@"%@", object.objectId);
                [_requests addObject:object[@"type"]];
                
            }
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
        NSString *desc= _requests[0][@"description"];
        
        NSLog(@"%@",desc);
    }];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
