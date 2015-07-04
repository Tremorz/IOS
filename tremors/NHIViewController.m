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


- (NSInteger)numberOfSectionsInTableView:(UITableView*)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section {
    return ad().notices.count;
}

- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath {
    UITableViewCell* cell=[tableView dequeueReusableCellWithIdentifier:@"notice_cell" forIndexPath:indexPath];
    Notice* notice=(Notice*)ad().notices[indexPath.row];
    cell.textLabel.text=notice.title;
    cell.detailTextLabel.text=notice.meta;
    if (notice.type==have) cell.backgroundColor=[[UIColor greenColor] colorWithAlphaComponent:0.4];
    if (notice.type==need) cell.backgroundColor=[[UIColor redColor] colorWithAlphaComponent:0.6];
    if (notice.type==info) cell.backgroundColor=[[UIColor yellowColor] colorWithAlphaComponent:0.2];
    cell.textLabel.backgroundColor=[UIColor clearColor];
    cell.detailTextLabel.backgroundColor=[UIColor clearColor];
    return cell;
}


@end
