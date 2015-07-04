//
//  Notice.m
//  tremors
//
//  Created by David Preece on 4/07/15.
//  Copyright (c) 2015 David Preece. All rights reserved.
//

#import "Notice.h"
#import <CoreLocation/CoreLocation.h>

@implementation Notice

-(float)distanceFrom:(CLLocation*)location
{
    CLLocation* my_location=[[CLLocation alloc] initWithLatitude:_coordinate.latitude longitude:_coordinate.longitude];
    return [my_location distanceFromLocation:location];
}

@end
