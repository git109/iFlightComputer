//
//  IFCSecondViewController.m
//  iFlightComp
//
//  Created by Tercio Esperandio on 1/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "IFCWindViewController.h"
#import "FlightComputer.h"

#define kOFFSET_FOR_KEYBOARD 90.0 // must change this

@implementation IFCWindViewController
@synthesize acftHeading;
@synthesize acftSpeed;
@synthesize windDirection;
@synthesize windSpeed;
@synthesize acftNewHeading;
@synthesize acftNewAirspeed;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Second", @"Second");
        self.tabBarItem.image = [UIImage imageNamed:@"second"];
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
    [self setAcftHeading:nil];
    [self setAcftSpeed:nil];
    [self setWindDirection:nil];
    [self setWindSpeed:nil];
    [self setAcftNewHeading:nil];
    [self setAcftNewAirspeed:nil];
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

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [[self view] endEditing:YES];
    [self setViewMovedUp:NO];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

-(void)textFieldDidBeginEditing:(UITextField *)sender
{
    if ([sender isEqual:windSpeed])
    {
        //move the main view, so that the keyboard does not hide it.
        if  (self.view.frame.origin.y >= 0)
        {
            [self setViewMovedUp:YES];
        }
    }
}

-(void)setViewMovedUp:(BOOL)movedUp
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5]; // if you want to slide up the view
    
    CGRect rect = self.view.frame;
    if (movedUp)
    {
        // 1. move the view's origin up so that the text field that will be hidden come above the keyboard 
        // 2. increase the size of the view so that the area behind the keyboard is covered up.
        rect.origin.y -= kOFFSET_FOR_KEYBOARD;
        rect.size.height += kOFFSET_FOR_KEYBOARD;
    }
    else
    {
        // revert back to the normal state.
        rect.origin.y += kOFFSET_FOR_KEYBOARD;
        rect.size.height -= kOFFSET_FOR_KEYBOARD;
    }
    self.view.frame = rect;
    
    [UIView commitAnimations];
}


- (IBAction)calculateWind:(id)sender {
    
    NSArray *ret = [FlightComputer windCorrectionForHeading:[[acftHeading text] doubleValue] airspeed:[[acftSpeed text] doubleValue] windDir:[[windDirection text] doubleValue] windSpeed:[[windSpeed text] doubleValue]];
    
    
  
    [acftNewHeading  setText: [[ret objectAtIndex:0] stringValue] ];
    [acftNewAirspeed setText: [[ret objectAtIndex:1] stringValue] ];
    
    [[self view] endEditing:YES];
    [self setViewMovedUp:NO];
    
}
@end
