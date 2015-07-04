//
//  ViewController.m
//  tremors
//
//  Created by David Preece on 4/07/15.
//  Copyright (c) 2015 David Preece. All rights reserved.
//

// This is set as delegate in the storyboard
#import "NHIViewController.h"


@interface NHIViewController ()
-(IBAction)mapTapped:(id)sender;
@end

@implementation NHIViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UITapGestureRecognizer* tapRec = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(mapTapped:)];
    [map addGestureRecognizer:tapRec];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)mapTapped:(id)sender
{
    CGPoint tapped_point=[(UITapGestureRecognizer*)sender locationInView:map];
    CLLocationCoordinate2D tapped_location=[map convertPoint:tapped_point toCoordinateFromView:map];
    NSLog(@"tappity latitude=%f longitude=%f", tapped_location.latitude, tapped_location.longitude);
}

@end
