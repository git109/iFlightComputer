//
//  IFCFirstViewController.m
//  iFlightComp
//
//  Created by Tercio Esperandio on 1/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "IFCConversionViewController.h"

@implementation IFCConversionViewController
@synthesize mph;
@synthesize kmh;
@synthesize knot;
@synthesize distance;
@synthesize speed;
@synthesize flightTime;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"First", @"First");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}
							
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setMph:nil];
    [self setKmh:nil];
    [self setKnot:nil];
    [self setDistance:nil];
    [self setSpeed:nil];
    [self setFlightTime:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [[self view] endEditing:YES];
}
    

- (IBAction)speedValueChanged:(id)sender {
    
    if ([[kmh text] length] != 0) {
                
        NSString *sMPH = [NSString stringWithFormat:@"%.0f",[FlightComputer mphFromKmh:[[kmh text] doubleValue]]];
        NSString *sKNOT = [NSString stringWithFormat:@"%.0f",[FlightComputer knotFromKmh:[[kmh text] doubleValue]]];
        [mph setText:sMPH];
        [knot setText:sKNOT];
        [kmh resignFirstResponder];
    }
    
    if ([[mph text] length] != 0) {
        
        NSString *sKMH = [NSString stringWithFormat:@"%.0f",[FlightComputer kmhFromMph:[[mph text] doubleValue]]];
        NSString *sKNOT = [NSString stringWithFormat:@"%.0f",[FlightComputer knotFromMph:[[mph text] doubleValue]]];
        [kmh setText:sKMH];
        [knot setText:sKNOT];
        [mph resignFirstResponder];
        
    }
    
    if ([[knot text] length] != 0) {

        NSString *sMPH = [NSString stringWithFormat:@"%.0f",[FlightComputer mphFromKnot:[[knot text] doubleValue]]];
        NSString *sKMH = [NSString stringWithFormat:@"%.0f",[FlightComputer kmhFromKnot:[[knot text] doubleValue]]];
        [mph setText:sMPH];
        [kmh setText:sKMH];
        [knot resignFirstResponder];
        
    }

}

- (IBAction)calculateFlightTime:(id)sender {
    
    float ft = [FlightComputer flightTimeForDistance:[[distance text] floatValue]
                                            andSpeed:[[speed text] floatValue]];
    NSString *sFT = [NSString stringWithFormat:@"%02d:%02d",[FlightComputer getHours:ft],[FlightComputer getMinutes:ft]];
    [flightTime setText:sFT];
    [speed resignFirstResponder];
    [distance resignFirstResponder];
    
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    [kmh setText:@""];
    [mph setText:@""];
    [knot setText:@""];
    
    return YES;
}

@end
