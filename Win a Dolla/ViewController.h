//
//  ViewController.h
//  Win a Dolla
//
//  Created by Jose Caballero on 6/13/14.
//  Copyright (c) 2014 SOHacks. All rights reserved.
//
//FUCK SHIT UP

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

{
    UILabel *hellolabel;
}

@property (nonatomic, retain) IBOutlet UILabel *helloLabel;
@property (nonatomic, retain) IBOutlet UIButton *WinOrLoseButton;
@property (nonatomic, retain) IBOutlet UIButton *Dwolla;

-(IBAction)playPress:(id)sender;



@end
