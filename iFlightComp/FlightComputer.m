//
//  FlightComputer.m
//  FlightComputerEngine
//
//  Created by Tercio Esperandio on 1/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FlightComputer.h"

@implementation FlightComputer


+ (float) mphFromKmh:(float)aKmh  {
    if (aKmh <= 0.0) return 0.0;
    return aKmh / 1.609;
}

+ (float) kmhFromMph:(float) aMph {
    return aMph * 1.609;
}

+ (float) knotFromMph: (float) aMph {
    if (aMph <= 0.0) return 0.0;
    return aMph / 1.151;
}

+ (float) knotFromKmh: (float) aKmh {
    if (aKmh <= 0.0) return 0.0;
    return aKmh / 1.852;
}

+ (float) kmhFromKnot: (float) aKnot{
    return aKnot * 1.852;
}

+ (float) mphFromKnot: (float) aKnot {
    return aKnot * 1.151;
}

+ (float) gallonFromLiter: (float) aLiter {
    if (aLiter <= 0.0) return 0.0;
    return aLiter / 3.7;
}
+ (float) literFromGallon: (float) aGallon {
    return aGallon * 3.7;
}

+ (float) metersFromFeet: (float) feet {
    if (feet <= 0.0) return 0.0;
    return feet / 3.3;
}   

+ (float) feetFromMeters: (float) meters {
    if (meters <= 0.0) return 0.0;
    return meters * 3.3;
}

// km with speed as km/h will return in hours
+ (float) flightTimeForDistance:(float)km andSpeed:(float) speed {
    return km / speed;
}


+ (int) getHours:(float) n{
    if (n <= 0) return 0;
    return trunc(n);
}

+ (int) getMinutes:(float) n {
    int whole = trunc(n);
    float dec = n - whole;
    return dec * 60;
}

+ (float) fuelConsumedOnHours:(float )h forAutonomy:(float) litersPerHour {
    
    if (h <= 0.0 || litersPerHour <= 0.0) return 0.0;
    return h * litersPerHour;
}

+ (float) celsiusFromFahrenheit:(float) f {
    return (5.0/9.0)*(f-32.0);
}
+ (float) fahrenheitFromCelsius:(float) c {
    return ((9.0/5.0)*c)+32.0;
}


+ (float) distanceForTime:(float) t andSpeed:(float) s {
    if (t <= 0.0 || s <=0.0) return 0.0;
    return t * s;
}

+ (float) timeToTravel:(float) km atSpeed:(float) s {
    if (km <= 0.0 || s <= 0) return 0.0;
    return km/s;
}

+ (float) altitudeDensityForAltitude:(float) a withTrueTemperature:(float) t {
    
    if (a <= 0) return 0.0;
    
    float tempAtFLevel = 15 - (2 * (a / 1000.0));
    float deltaT = t - tempAtFLevel;
    return a + 100.0 * deltaT;
}



+ (NSArray *) windCorrectionForHeading:(double)heading airspeed:(double) aspeed windDir: (double) wd windSpeed: (double) ws {
    
    double  DesiredCourse = M_PI * heading / 180.0;
    double WindDir = M_PI * wd / 180.0 + M_PI;
    if (WindDir > M_PI) WindDir = WindDir - 2 * M_PI;
    double WTAngle = DesiredCourse - WindDir;
    if (WTAngle > M_PI) WTAngle = WTAngle - 2 * M_PI;
    if (WTAngle < (-1 * M_PI)) WTAngle = WTAngle + 2 * M_PI;
    
    double SinWca = ws*sin(WTAngle)/aspeed; 
    double wca,fixedHeading,groundspeed;
    
    if (abs(SinWca) <1) {
    
        wca = asin(SinWca); 
        fixedHeading = DesiredCourse + wca;
        while (fixedHeading > 2*M_PI) { fixedHeading = fixedHeading-2*M_PI;}
        
        while (fixedHeading < 0) { fixedHeading = fixedHeading + 2*M_PI;}
    
        groundspeed = round (aspeed * cos(wca)+ws * cos(WTAngle));
    }
    
    fixedHeading = round (fixedHeading * 180.0 / M_PI);
    
    
    //NSString *str = [NSString stringWithFormat:@"\n\n======= %2.f %2.f : %2.f %.2f ---> heading: %.2f   groundspeed: %2.f\n",heading,aspeed,wd,ws, fixedHeading,groundspeed];
    //NSLog(str);
    
    
    return [NSArray arrayWithObjects:[NSNumber numberWithDouble:fixedHeading], [NSNumber numberWithDouble: groundspeed], nil];
}

@end
