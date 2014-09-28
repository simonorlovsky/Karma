//
//  IntroViewController.m
//  Karma
//
//  Created by Simon Orlovsky on 9/19/14.
//  Copyright (c) 2014 simonorlovsky. All rights reserved.
//

#import "IntroViewController.h"
#import <FacebookSDK/FacebookSDK.h>



@interface IntroViewController ()

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
    UIAlertView * alert =[[UIAlertView alloc ] initWithTitle:@"Login" message:@"Enter Username & Password" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles: nil];
    alert.alertViewStyle = UIAlertViewStyleLoginAndPasswordInput;
    [alert addButtonWithTitle:@"Login"];
    [alert show];
}
- (IBAction)registerButtonPressed:(id)sender {
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1)
    {
        UITextField *username = [alertView textFieldAtIndex:0];
        NSLog(@"username: %@", username.text);
        
        UITextField *password = [alertView textFieldAtIndex:1];
        NSLog(@"password: %@", password.text);
        
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
