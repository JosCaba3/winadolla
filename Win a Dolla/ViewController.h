//
//  ViewController.h
//  Win a Dolla
//
//  Created by Jose Caballero on 6/13/14.
//  Copyright (c) 2014 SOHacks. All rights reserved.
//
//

#import <UIKit/UIKit.h>
//#import <DwollaAPI.h>
//#import <DwollaOAuth2Client.h>
#import "DwollaAPI.h"
#import "DwollaOAuth2Client.h"

<<<<<<< HEAD
@interface ViewController : UIViewController

=======
@interface ViewController : UIViewController <IDwollaMessages, UITextFieldDelegate>
>>>>>>> master

@property (nonatomic, retain) IBOutlet UILabel *pinLabel;
@property (nonatomic, retain) IBOutlet UIButton *WinOrLoseButton;
@property (nonatomic, retain) IBOutlet UIButton *Dwolla;
<<<<<<< HEAD

-(IBAction):(id)sender;
-(IBAction)changebackPressed:(id)sender;
=======
@property (nonatomic, strong) NSString *destinationID;
@property (nonatomic,strong) DwollaAPI *dwollaAPI;
@property (nonatomic,strong) NSString *userAccessToken;
@property (nonatomic,strong) NSString *userPin;
@property (nonatomic, strong) IBOutlet UITextField *pinTextField;
-(IBAction)playPress:(id)sender;
>>>>>>> master



@end
