//
//  FirstViewController.m
//  Karma
//
//  Created by Simon Orlovsky on 9/19/14.
//  Copyright (c) 2014 simonorlovsky. All rights reserved.
//

#import "FirstViewController.h"
#import "DetailViewController.h"
#import "Request.h"

@interface FirstViewController ()

@property(nonatomic, strong) NSString* type;

@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	PFObject *request = [PFObject objectWithClassName:@"request"];
    request[@"type"] = @"coffee";
    [request saveInBackground];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)coffeeRequest:(id)sender {
    PFObject *request = [PFObject objectWithClassName:@"request"];
    request[@"type"] = @"coffee";
    [request saveInBackground];
    
}
- (IBAction)storeRequest:(id)sender {
    PFObject *request = [PFObject objectWithClassName:@"request"];
    request[@"type"] = @"store";
    [request saveInBackground];
    
}

- (IBAction)randomRequest:(id)sender {
    PFObject *request = [PFObject objectWithClassName:@"request"];
    request[@"type"] = @"random";
    [request saveInBackground];
}

- (IBAction)printRequest:(id)sender {
    PFObject *request = [PFObject objectWithClassName:@"request"];
    request[@"type"] = @"print";
    [request saveInBackground];
    
}

//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    // Log which segue was triggered
//    NSLog(@"Segue %@", segue.identifier);
//    
//    // Get a reference to the destination VC
//    DetailViewController *detailVC = segue.destinationViewController;
//    
//    // Create a new listing object
//   Request *userRequest = [[Request alloc] init];
//    
//    // Is it the bike segue?
//    if ([segue.identifier isEqualToString:@"coffeeSegue"])
//    {
//        // segue bike happened
//        userRequest.type = @"Coffee";
//        userRequest.description = @"I need coffee!";
//        
//        // Set this listing to the destination VC
//        detailVC.request = userRequest;
//    }
//    else if ([segue.identifier isEqualToString:@"storeSegue"])
//
//    {
//        // segue bike happened
//        userRequest.type = @"Store";
//        userRequest.description = @"I need something from the store!";
//        
//        // Set this listing to the destination VC
//        detailVC.request = userRequest;
//    }
//}


@end
