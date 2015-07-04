//
//  ViewController.m
//  tremors
//
//  Created by David Preece on 4/07/15.
//  Copyright (c) 2015 David Preece. All rights reserved.
//

// This is set as delegate in the storyboard
#import "MapViewController.h"
#import "NHIViewController.h"


@interface MapViewController ()
@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    CGPoint tapped_point=[(UITapGestureRecognizer*)sender locationInView:self.map];
    ((NHIViewController*)segue.destinationViewController).location=[self.map convertPoint:tapped_point toCoordinateFromView:self.map];
}

@end
