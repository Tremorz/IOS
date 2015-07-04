//
//  ViewController.h
//  tremors
//
//  Created by David Preece on 4/07/15.
//  Copyright (c) 2015 David Preece. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MapViewController : UIViewController<MKMapViewDelegate>

@property IBOutlet MKMapView* map;
@property MKAnnotationView* annotation;

@end

