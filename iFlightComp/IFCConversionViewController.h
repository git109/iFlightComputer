//
//  IFCFirstViewController.h
//  iFlightComp
//
//  Created by Tercio Esperandio on 1/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlightComputer.h"

@interface IFCConversionViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *mph;
@property (weak, nonatomic) IBOutlet UITextField *kmh;
@property (weak, nonatomic) IBOutlet UITextField *knot;
@property (weak, nonatomic) IBOutlet UITextField *distance;
@property (weak, nonatomic) IBOutlet UITextField *speed;
@property (weak, nonatomic) IBOutlet UILabel *flightTime;

- (IBAction)speedValueChanged:(id)sender;

- (IBAction)calculateFlightTime:(id)sender;

@end
