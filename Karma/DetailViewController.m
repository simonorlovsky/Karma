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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)SubmitButton:(id)sender {
    if ([self.titleName isEqualToString:@"Random karma"]) {
        PFObject *request = [PFObject objectWithClassName:@"request"];
        request[@"type"] = @"random";
        [request saveInBackground];
    }
    else if([self.titleName isEqualToString:@"Store karma"]){
        PFObject *request = [PFObject objectWithClassName:@"request"];
        request[@"type"] = @"store";
        [request saveInBackground];
    }
    else if([self.titleName isEqualToString:@"Print karma"]){
        PFObject *request = [PFObject objectWithClassName:@"request"];
        request[@"type"] = @"print";
        [request saveInBackground];
    }
    else{
        PFObject *request = [PFObject objectWithClassName:@"request"];
        request[@"type"] = @"food";
        [request saveInBackground];
    }

    
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
