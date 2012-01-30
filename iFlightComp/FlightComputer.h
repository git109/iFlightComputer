//
//  FlightComputer.h
//  FlightComputerEngine
//
//  Created by Tercio Esperandio on 1/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FlightComputer : NSObject

+ (float) mphFromKmh:(float) aKmh;
+ (float) kmhFromMph:(float) aMph;
+ (float) knotFromMph: (float) aMph;
+ (float) knotFromKmh: (float) aKmh;
+ (float) kmhFromKnot: (float) aKnot;
+ (float) mphFromKnot: (float) aKnot;
+ (float) gallonFromLiter: (float) aLiter;
+ (float) literFromGallon: (float) aGallon;
+ (float) metersFromFeet: (float) feet;
+ (float) feetFromMeters: (float) meters;

+ (float) flightTimeForDistance:(float)km andSpeed:(float) speed;

+ (int) getHours:(float) n;
+ (int) getMinutes:(float) n;

+ (float) fuelConsumedOnHours:(float )h forAutonomy:(float) litersPerHour;

+ (float) celsiusFromFahrenheit:(float) f;
+ (float) fahrenheitFromCelsius:(float) c;

// time in hours and speed in km/h
+ (float) distanceForTime:(float) t andSpeed:(float) s;

+ (float) timeToTravel:(float) km atSpeed:(float) s;

+ (float) altitudeDensityForAltitude:(float) a withTrueTemperature:(float) t;

+ (NSArray *) windCorrectionForHeading:(double)heading airspeed:(double) aspeed windDir: (double) wd windSpeed: (double) ws;


@end
