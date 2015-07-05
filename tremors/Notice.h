//
//  Notice.h
//  tremors
//
//  Created by David Preece on 4/07/15.
//  Copyright (c) 2015 David Preece. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

enum notice_type {need, have, info};


@interface Notice : NSObject<MKAnnotation>

@property enum notice_type type;
@property (nonatomic, copy) NSString* title;
@property NSString* details;
@property (nonatomic) CLLocationCoordinate2D coordinate;

-(float)distanceFrom:(CLLocation*)location;
-(UIColor*)backgroundColor;
-(MKPinAnnotationColor)pinColor;

@end
