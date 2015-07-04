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
    self.map.delegate=self;
    
    //set up the map
    self.map.zoomEnabled=true;
    self.map.rotateEnabled=false;
    self.map.visibleMapRect=MKMapRectMake(264512480, 168016434, 93891, 118302);
    
    //stick pins in it
    for (Notice* notice in ad().notices) [self.map addAnnotation:notice];
}

-(MKAnnotationView*)mapView:(MKMapView*)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    MKAnnotationView* mav=[mapView dequeueReusableAnnotationViewWithIdentifier:@"pin"];
    if (!mav) mav=[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"pin"];
    if (((Notice*)annotation).type==need) ((MKPinAnnotationView*)mav).pinColor=MKPinAnnotationColorRed;
    if (((Notice*)annotation).type==have) ((MKPinAnnotationView*)mav).pinColor=MKPinAnnotationColorGreen;
    if (((Notice*)annotation).type==info) ((MKPinAnnotationView*)mav).pinColor=MKPinAnnotationColorPurple;
    return mav;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    CGPoint tapped_point=[(UITapGestureRecognizer*)sender locationInView:self.map];
    CLLocationCoordinate2D coord=[self.map convertPoint:tapped_point toCoordinateFromView:self.map];
    ((NHIViewController*)segue.destinationViewController).location=[[CLLocation alloc] initWithLatitude:coord.latitude longitude:coord.longitude];
}

@end
