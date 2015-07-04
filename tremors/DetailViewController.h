//
//  DetailViewController.h
//  tremors
//
//  Created by David Preece on 5/07/15.
//  Copyright (c) 2015 David Preece. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "Notice.h"

@interface DetailViewController : UIViewController

@property Notice* notice;
@property (nonatomic) IBOutlet UITextView* titleView;
@property (nonatomic) IBOutlet UITextView* detailView;
@property (nonatomic) IBOutlet MKMapView* mapView;


@end
