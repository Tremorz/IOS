//
//  NHIViewController.m
//  tremors
//
//  Created by David Preece on 4/07/15.
//  Copyright (c) 2015 David Preece. All rights reserved.
//

#import "NHIViewController.h"
#import "Notice.h"
#import "AppDelegate.h"

@implementation NHIViewController

- (void)viewWillAppear:(BOOL)animated
{
    self.sorted=[ad().notices sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        float first_distance=[(Notice*)obj1 distanceFrom:_location];
        float second_distance=[(Notice*)obj2 distanceFrom:_location];
        if (first_distance>second_distance) return NSOrderedDescending;
        return NSOrderedAscending;}];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView*)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
    return _sorted.count;
}

- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
    UITableViewCell* cell=[tableView dequeueReusableCellWithIdentifier:@"notice_cell" forIndexPath:indexPath];
    Notice* notice=_sorted[indexPath.row];
    cell.textLabel.text=notice.title;
    if (notice.type==have) cell.backgroundColor=[[UIColor greenColor] colorWithAlphaComponent:0.4];
    if (notice.type==need) cell.backgroundColor=[[UIColor redColor] colorWithAlphaComponent:0.6];
    if (notice.type==info) cell.backgroundColor=[[UIColor yellowColor] colorWithAlphaComponent:0.2];
    cell.textLabel.backgroundColor=[UIColor clearColor];
    cell.detailTextLabel.text=[NSString stringWithFormat:@"%.2fkm away", [notice distanceFrom:_location]/1000];
    cell.detailTextLabel.backgroundColor=[UIColor clearColor];
    return cell;
}


@end
