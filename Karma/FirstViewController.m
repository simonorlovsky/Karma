//
//  FirstViewController.m
//  Karma
//
//  Created by Simon Orlovsky on 9/19/14.
//  Copyright (c) 2014 simonorlovsky. All rights reserved.
//

#import "FirstViewController.h"
#import "DetailViewController.h"

@interface FirstViewController ()

@property(nonatomic, strong) NSString* type;
@property (nonatomic, strong) IBOutlet UILabel *recipeLabel;
@property (nonatomic, strong) NSString *recipeName;

@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationItem setHidesBackButton:YES];
    
    self.navigationController.navigationBar.topItem.title = @"Give Karma";
//	PFObject *request = [PFObject objectWithClassName:@"request"];
//    request[@"type"] = @"coffee";
//    [request saveInBackground];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)coffeeRequest:(id)sender {
//    PFObject *request = [PFObject objectWithClassName:@"request"];
//    request[@"type"] = @"coffee";
//    [request saveInBackground];
    
}
- (IBAction)storeRequest:(id)sender {
//    PFObject *request = [PFObject objectWithClassName:@"request"];
//    request[@"type"] = @"store";
//    [request saveInBackground];
    
}

- (IBAction)randomRequest:(id)sender {
//    PFObject *request = [PFObject objectWithClassName:@"request"];
//    request[@"type"] = @"random";
//    [request saveInBackground];
}

- (IBAction)printRequest:(id)sender {
//    PFObject *request = [PFObject objectWithClassName:@"request"];
//    request[@"type"] = @"print";
//    [request saveInBackground];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSLog(@"Segue %@", segue.identifier);
    
    DetailViewController *detailVC = segue.destinationViewController;
    NSString *titleName = [[NSString alloc] init];
    if ([segue.identifier isEqualToString:@"foodSegue"]){
        titleName = @"Meal karma";
        detailVC.titleName = titleName;
    }
    else if([segue.identifier isEqualToString:@"storeSegue"]){
        titleName = @"Store karma";
        detailVC.titleName = titleName;
    }
    else if([segue.identifier isEqualToString:@"printSegue"]){
        titleName = @"Print karma";
        detailVC.titleName = titleName;
    }
    else{
        titleName = @"Random karma";
        detailVC.titleName = titleName;
    }
    
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
