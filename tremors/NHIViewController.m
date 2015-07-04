//
//  NHIViewController.m
//  tremors
//
//  Created by David Preece on 4/07/15.
//  Copyright (c) 2015 David Preece. All rights reserved.
//

#import "NHIViewController.h"
#import "NHICell.h"
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
    NHICell* cell=(NHICell*)[tableView dequeueReusableCellWithIdentifier:@"notice_cell" forIndexPath:indexPath];
    cell.textLabel.text=((Notice*)ad().notices[indexPath.row]).title;
    return cell;
}


@end
