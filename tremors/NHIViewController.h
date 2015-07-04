//
//  NHIViewController.h
//  tremors
//
//  Created by David Preece on 4/07/15.
//  Copyright (c) 2015 David Preece. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface NHIViewController : UITableViewController

@property NSArray* sorted; //by distance from location, when the controller is created
@property CLLocation* location; //set by the map view before this appears

@end
