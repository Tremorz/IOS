//
//  DetailViewController.m
//  tremors
//
//  Created by David Preece on 5/07/15.
//  Copyright (c) 2015 David Preece. All rights reserved.
//

#import "DetailViewController.h"
#import "AppDelegate.h"


@implementation DetailViewController


- (void)viewWillAppear:(BOOL)animated
{
    _titleView.text=_notice.title;
    _titleView.backgroundColor=_notice.backgroundColor;
    _detailView.text=_notice.details;
    MKCoordinateRegion cr=MKCoordinateRegionMake(_notice.coordinate, MKCoordinateSpanMake(0.002, 0.002));
    [_mapView setRegion:cr];
    [_mapView addAnnotation:_notice];
}

-(MKAnnotationView*)mapView:(MKMapView*)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    MKPinAnnotationView* mav=[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"pin"];
    mav.pinColor=((Notice*)annotation).pinColor;
    return mav;
}

@end
