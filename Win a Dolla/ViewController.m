//
//  ViewController.m
//  Win a Dolla
//
//  Created by Jose Caballero on 6/13/14.
//  Copyright (c) 2014 SOHacks. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    self.dwollaAPI = [DwollaAPI sharedInstance];
    NSArray *scopes = [[NSArray alloc] initWithObjects:@"send", @"balance", @"accountinfofull", @"contacts", @"funding",  @"request", @"transactions", nil];
    DwollaOAuth2Client *client = [[DwollaOAuth2Client alloc] initWithFrame:CGRectMake(0, 0, 320, 460) key:@"kVTR2fZkl+lhiw4mb1naCklMl8rEorvkuvcWaD1FOoVgJlQTw0" secret:@"0I/HBAJY8spVP2w412rWUJu9R8AFby6OlMNaKDxD2F0kx3zlSf" redirect:@"https://www.dwolla.com" response:@"code" scopes:scopes view:self.view reciever:self];
    [client login];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
-(void)successfulLogin
{
    DwollaUser *user = [[DwollaAPI sharedInstance] getAccountInfo];
    self.destinationID = user.userID;
    self.userAccessToken = [[NSUserDefaults standardUserDefaults] objectForKey:@"user_access_token"];
}
-(void)failedLogin:(NSArray *)errors
{
    NSLog(@"%@",errors);
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    self.userPin = textField.text;
    [textField resignFirstResponder];
    
    [UIView animateWithDuration:0.5 animations:^{
        textField.alpha = 0;
        self.pinLabel.alpha = 0;
        self.WinOrLoseButton.hidden = NO;
    }];

    return NO;
}

-(IBAction)playPress:(id)sender
{
    int randomNumber = arc4random() % 100;
    
    if (randomNumber < 49) {
        //win
        [[DwollaAPI sharedInstance] setAccessToken:[[NSUserDefaults standardUserDefaults]objectForKey:@"jason_access_token"]];
        
        NSString* request = [self.dwollaAPI sendMoneyWithPIN:@"4508" destinationID:self.destinationID destinationType:@"" amount:@"0.01" facilitatorAmount:@"0" assumeCosts:@"false" notes:@"you win!" fundingSourceID:@""];
        NSLog(@"%@", request);
        
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"YOU WIN" message:@"YOU WIN" delegate:nil cancelButtonTitle:@"FUCK YES" otherButtonTitles: nil];
        [alertView show];
        self.view.backgroundColor = [UIColor greenColor];
    }
    else
    {
        //lose
        [[DwollaAPI sharedInstance] setAccessToken:[[NSUserDefaults standardUserDefaults]objectForKey:@"user_access_token"]];
        
        NSString* request = [self.dwollaAPI sendMoneyWithPIN:self.userPin destinationID:@"210-238-0423" destinationType:@"Phone" amount:@"0.01" facilitatorAmount:@"0" assumeCosts:@"false" notes:@"you lost!" fundingSourceID:@""];
        NSLog(@"%@", request);
        
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"YOU LOSE" message:@"YOU LOSE" delegate:nil cancelButtonTitle:@"FUCK NO" otherButtonTitles: nil];
        [alertView show];
        self.view.backgroundColor = [UIColor redColor];

    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
