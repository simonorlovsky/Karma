//
//  RegisterViewController.m
//  Karma
//
//  Created by Simon Orlovsky on 10/8/14.
//  Copyright (c) 2014 simonorlovsky. All rights reserved.
//

#import "RegisterViewController.h"
#import <Parse/Parse.h>
@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}
- (IBAction)register:(id)sender {
    PFUser *user = [PFUser user];
    user.username = _usernameTextField.text;
    user.password = _passwordTextField.text;
    user.email = _emailTextField.text;
    
    // other fields can be set just like with PFObject
    //user[@"phone"] = @"415-392-0202";
    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            // Hooray! Let them use the app now.
            NSLog(@"Boo yah!");
            [self performSegueWithIdentifier:@"segue" sender:self];
        } else {
            NSString *errorString = [error userInfo][@"error"];
            // Show the errorString somewhere and let the user try again.
        }
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
