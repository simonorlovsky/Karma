//
//  SecondViewController.m
//  Karma
//
//  Created by Simon Orlovsky on 9/19/14.
//  Copyright (c) 2014 simonorlovsky. All rights reserved.
//
// Apple Jason

#import "SecondViewController.h"
#import <Parse/Parse.h>

@interface SecondViewController ()

@end

@implementation SecondViewController
{
    NSMutableArray *_requests;
    NSMutableArray *_requests1;
    NSMutableArray *_typeArray;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBar.topItem.title = @"Get Karma";
    // Do any additional setup after loading the view, typically from a nib.
    _requests1 = [NSMutableArray arrayWithObjects:@"Egg Benedict", @"Mushroom Risotto", @"Full Breakfast", @"Hamburger", @"Ham and Egg Sandwich", @"Creme Brelee", @"White Chocolate Donut", @"Starbucks Coffee", @"Vegetable Curry", @"Instant Noodle with Egg", @"Noodle with BBQ Pork", @"Japanese Noodle with Pork", @"Green Tea", @"Thai Shrimp Cake", @"Angry Birds Cake", @"Ham and Cheese Panini", nil];
    
    _requests = [[NSMutableArray alloc] init];
    _typeArray= [[NSMutableArray alloc] init];
    PFQuery *query = [PFQuery queryWithClassName:@"request"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        
        if (!error) {
            // The find succeeded.
            NSLog(@"Successfully retrieved %ld requests.", objects.count);
            // Do something with the found objects
            for (PFObject *object in objects) {
                NSLog(@"%@", object.objectId);
                [_requests insertObject:object[@"type"] atIndex:0];
                
            }
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
//        for (int i=0; i<50; i++) {
//            [_typeArray addObject:_requests[i][@"type"]];
//            NSLog(_requests[i][@"type"]);
//        }
        [_tableView reloadData];
        
        //NSString *type= _requests[0][@"type"];
        
        //NSLog(@"%@",type);
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"Number of requests: %ld",_requests.count);
    return [_requests count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    NSLog(@"Requests size: %ld and object %@",_requests.count,[_requests objectAtIndex:indexPath.row]);
    cell.textLabel.text = [_requests objectAtIndex:indexPath.row];
    cell.textLabel.font = [UIFont fontWithName:@"ArialMT" size:30];

    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Value Selected by user
    //NSString *selectedValue = [displayValues objectAtIndex:indexPath.row];
    //Initialize new viewController
    [self performSegueWithIdentifier:@"segue" sender:self];
}



@end
