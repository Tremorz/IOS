//
//  ViewController.m
//  tremors
//
//  Created by David Preece on 4/07/15.
//  Copyright (c) 2015 David Preece. All rights reserved.
//

// This is set as delegate in the storyboard
#import "AppDelegate.h"
#import "Notice.h"
#import "MapViewController.h"
#import "NHIViewController.h"


@interface MapViewController ()
@end

@implementation MapViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    _map.delegate=self;
    
    //set up the map
    _map.zoomEnabled=true;
    _map.rotateEnabled=false;
    _map.visibleMapRect=MKMapRectMake(264512480, 168016434, 93891, 118302);
    
    //stick pins in it
    for (Notice* notice in ad().notices) [_map addAnnotation:notice];
}

-(MKAnnotationView*)mapView:(MKMapView*)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    MKAnnotationView* mav=[mapView dequeueReusableAnnotationViewWithIdentifier:@"pin"];
    if (!mav) mav=[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"pin"];
    ((MKPinAnnotationView*)mav).pinColor=[((Notice*)annotation) pinColor];
    return mav;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    CGPoint tapped_point=[(UITapGestureRecognizer*)sender locationInView:_map];
    CLLocationCoordinate2D coord=[_map convertPoint:tapped_point toCoordinateFromView:_map];
    ((NHIViewController*)segue.destinationViewController).location=[[CLLocation alloc] initWithLatitude:coord.latitude longitude:coord.longitude];
}

@end
