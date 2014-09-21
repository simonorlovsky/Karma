//
//  SecondViewController.m
//  Karma
//
//  Created by Simon Orlovsky on 9/19/14.
//  Copyright (c) 2014 simonorlovsky. All rights reserved.
//

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
    
	// Do any additional setup after loading the view, typically from a nib.
    _requests = [NSMutableArray arrayWithObjects:@"Egg Benedict", @"Mushroom Risotto", @"Full Breakfast", @"Hamburger", @"Ham and Egg Sandwich", @"Creme Brelee", @"White Chocolate Donut", @"Starbucks Coffee", @"Vegetable Curry", @"Instant Noodle with Egg", @"Noodle with BBQ Pork", @"Japanese Noodle with Pork", @"Green Tea", @"Thai Shrimp Cake", @"Angry Birds Cake", @"Ham and Cheese Panini", nil];
    
    _requests = [[NSMutableArray alloc] init];
    _typeArray= [[NSMutableArray alloc] init];
    PFQuery *query = [PFQuery queryWithClassName:@"request"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        
        if (!error) {
            // The find succeeded.
            NSLog(@"Hello");
            NSLog(@"Successfully retrieved %d requests.", objects.count);
            // Do something with the found objects
            NSInteger counter=0;
            for (PFObject *object in objects) {
                NSLog(@"%@", object.objectId);
                [_requests addObject:object];
                NSLog(_requests[counter][@"description"]);
                counter++;
                
            }
             NSLog(@"ready?");
            
        } else {
            NSLog(@"Yo");
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
        for (int i=0; i<4; i++) {
            NSLog(@"starting the output now...");
            [_typeArray addObject:_requests[i][@"description"]];
            NSLog(_requests[i][@"type"]);
        }
        
        
        NSString *type= _requests[0][@"description"];
        
        NSLog(type);
        [tableView reloadData];
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_requests count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [_requests objectAtIndex:indexPath.row];
    return cell;
}



@end
