//
//  IFCSecondViewController.h
//  iFlightComp
//
//  Created by Tercio Esperandio on 1/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IFCWindViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *acftHeading;
@property (weak, nonatomic) IBOutlet UITextField *acftSpeed;
@property (weak, nonatomic) IBOutlet UITextField *windDirection;
@property (weak, nonatomic) IBOutlet UITextField *windSpeed;
@property (weak, nonatomic) IBOutlet UILabel *acftNewHeading;
@property (weak, nonatomic) IBOutlet UILabel *acftNewAirspeed;

- (IBAction)calculateWind:(id)sender;
-(void)setViewMovedUp:(BOOL)movedUp;
@end
