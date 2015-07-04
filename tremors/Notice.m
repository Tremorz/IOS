//
//  Notice.m
//  tremors
//
//  Created by David Preece on 4/07/15.
//  Copyright (c) 2015 David Preece. All rights reserved.
//

#import "Notice.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@implementation Notice

-(float)distanceFrom:(CLLocation*)location
{
    CLLocation* my_location=[[CLLocation alloc] initWithLatitude:_coordinate.latitude longitude:_coordinate.longitude];
    return [my_location distanceFromLocation:location];
}

-(UIColor*)backgroundColor
{
    if (_type==have) return [[UIColor greenColor] colorWithAlphaComponent:0.4];
    if (_type==need) return [[UIColor redColor] colorWithAlphaComponent:0.6];
    return [[UIColor yellowColor] colorWithAlphaComponent:0.2];
}

-(MKPinAnnotationColor)pinColor
{
    if (_type==need) return MKPinAnnotationColorRed;
    if (_type==info) return MKPinAnnotationColorGreen;
    return MKPinAnnotationColorPurple;
}

@end
