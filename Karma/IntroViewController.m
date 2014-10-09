//
//  IntroViewController.m
//  Karma
//
//  Created by Simon Orlovsky on 9/19/14.
//  Copyright (c) 2014 simonorlovsky. All rights reserved.
//

#import "IntroViewController.h"
#import <FacebookSDK/FacebookSDK.h>
#import "SecondViewController.h"
#import <Parse/Parse.h>



@interface IntroViewController ()
{
    NSString *_username;
    NSString *_email;
}
@end

@implementation IntroViewController

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
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleLightContent;

       // Do any additional setup after loading the view.
    //set bar color
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:22/255.0 green:56/255.0 blue:80/255.0 alpha:1.0]];
    //optional, i don't want my bar to be translucent
    [self.navigationController.navigationBar setTranslucent:NO];
    //set title and title color
    [self.navigationItem setTitle:@"Login"];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:UITextAttributeTextColor]];
    //set back button color
    [[UIBarButtonItem appearanceWhenContainedIn:[UINavigationBar class], nil] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], UITextAttributeTextColor,nil] forState:UIControlStateNormal];
    //set back button arrow color
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    FBLoginView *loginView = [[FBLoginView alloc] init];
    // Align the button in the center horizontally
    [self preferredStatusBarStyle];
    
    
}
- (IBAction)loginButtonPressed:(id)sender {
    UIAlertView * alert =[[UIAlertView alloc ] initWithTitle:@"Login" message:@"Enter Email & Password" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles: nil];
    alert.tag = 1234;
    alert.alertViewStyle = UIAlertViewStyleLoginAndPasswordInput;
    [alert addButtonWithTitle:@"Login"];
    [alert show];
}
- (IBAction)registerButtonPressed:(id)sender {
//    UIAlertView * alert =[[UIAlertView alloc ] initWithTitle:@"Register" message:@"Enter Email & Password" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles: nil];
//    alert.tag = 3456;
//    alert.alertViewStyle = UIAlertViewStyleLoginAndPasswordInput;
//    [alert addButtonWithTitle:@"Register"];
//    [alert show];
//
//    
//    UIAlertView * alert2 =[[UIAlertView alloc ] initWithTitle:@"Register2" message:@"Enter Email & Password" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles: nil];
//    alert.tag = 4567;
//    alert.alertViewStyle = UIAlertViewStyleLoginAndPasswordInput;
//    [alert addButtonWithTitle:@"Register"];
//    [alert show];
    
    
    }


- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    UITextField *username = [alertView textFieldAtIndex:0];
    UITextField *password = [alertView textFieldAtIndex:1];


    if (alertView.tag == 1234) {  //First Dialog
        [PFUser logInWithUsernameInBackground:username.text password:password.text
                                        block:^(PFUser *user, NSError *error) {
                                            if (user) {
                                                // Do stuff after successful login.
                                                [self performSegueWithIdentifier:@"segue" sender:self];
                                            } else {
                                                // The login failed. Check error to see why.
                                                UIAlertView * alert =[[UIAlertView alloc ] initWithTitle:@"Invalid Login"
                                                                                                 message:@"Sorry"
                                                                                                delegate:self
                                                                                       cancelButtonTitle:@"HELP"
                                                                                       otherButtonTitles: nil];
                                                [alert addButtonWithTitle:@"OK"];
                                                [alert show];
                                            }
                                        }];    }
    
    if (alertView.tag == 3456) {  // Dialog
        if (buttonIndex == 1)  //Clicked OK
        {
            UITextField *username = [alertView textFieldAtIndex:0];
            UITextField *email = [alertView textFieldAtIndex:1];
            _username = username.text;
            _email= email.text;
        }
    }

    else  if (alertView.tag == 4567) //Second Dialog.
    {
        UITextField *password = [alertView textFieldAtIndex:0];
        
                
    }
}
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
