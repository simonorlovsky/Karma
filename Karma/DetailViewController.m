//
//  DetailViewController.m
//  Karma
//
//  Created by Simon Orlovsky on 9/20/14.
//  Copyright (c) 2014 simonorlovsky. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController
{
    NSString *_userName;
    NSString *_userImageURL;
}

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
    
    self.typeLabel.text = self.titleName;
    
    _locationTextField.delegate = self; // ADD THIS LINE
    [self.view addSubview:_locationTextField];
    
    _descriptionTextField.delegate = self; // ADD THIS LINE
    [self.view addSubview:_descriptionTextField];
    
    
    
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"touchesBegan:withEvent:");
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    NSLog(@"textFieldShouldBeginEditing");
    textField.backgroundColor = [UIColor colorWithRed:220.0f/255.0f green:220.0f/255.0f blue:220.0f/255.0f alpha:1.0f];
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    NSLog(@"textFieldDidBeginEditing");
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    NSLog(@"textField:shouldChangeCharactersInRange:replacementString:");
    if ([string isEqualToString:@"#"]) {
        return NO;
    }
    else {
        return YES;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)SubmitButton:(id)sender {
    //    [[FBRequest requestForMe] startWithCompletionHandler:^(FBRequestConnection *connection, NSDictionary<FBGraphUser> *FBuser, NSError *error) {
//        if (error) {
//            // Handle error
//        }
//        
//        else {
//            NSString *_userName = [FBuser name];
//            NSString *_userImageURL = [NSString stringWithFormat:@"https://graph.facebook.com/%@/picture?type=large", [FBuser objectID]];
//        }
//    }];
    
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
        [self sendRequest];
    }
    
}

-(void)sendRequest{
    NSString *description = _descriptionTextField.text;
    NSString *location = _locationTextField.text;
    PFUser *currentUser = [PFUser currentUser];
    if (currentUser) {
        // do stuff with the user
    } else {
        // show the signup or login screen
    }

    if ([self.titleName isEqualToString:@"Random karma"]) {
        PFObject *request = [PFObject objectWithClassName:@"request"];
        request[@"type"] = @"Tough Situation";
        request[@"description"] = description;
        request[@"location"] = location;
        request[@"User"] = currentUser.username;
        //request[@"name"] = _userName;
        //request[@"image"] = _userImageURL;
        [request saveInBackground];
        NSLog(@"Success!!");
        NSLog(currentUser.username);
    }
    else if([self.titleName isEqualToString:@"Store karma"]){
        PFObject *request = [PFObject objectWithClassName:@"request"];
        request[@"type"] = @"Life Gear";
        request[@"description"] = description;
        request[@"location"] = location;
        request[@"User"] = currentUser.username;
        //        request[@"name"] = _userName;
        //        request[@"image"] = _userImageURL;
        [request saveInBackground];
        
    }
    else if([self.titleName isEqualToString:@"Print karma"]){
        PFObject *request = [PFObject objectWithClassName:@"request"];
        request[@"type"] = @"Print Me";
        request[@"description"] = description;
        request[@"location"] = location;
        request[@"User"] = currentUser.username;
        //        request[@"name"] = _userName;
        //        request[@"image"] = _userImageURL;
        [request saveInBackground];
    }
    else{
        PFObject *request = [PFObject objectWithClassName:@"request"];
        request[@"type"] = @"Munchies";
        request[@"description"] = description;
        request[@"location"] = location;
        request[@"User"] = currentUser.username;
        //        request[@"name"] = _userName;
        //        request[@"image"] = _userImageURL;
        [request saveInBackground];
    }
    
    [self performSegueWithIdentifier:@"confirmSegue" sender:self];

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
