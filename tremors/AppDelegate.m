//
//  AppDelegate.m
//  tremors
//
//  Created by David Preece on 4/07/15.
//  Copyright (c) 2015 David Preece. All rights reserved.
//

#import "AppDelegate.h"
#import "Notice.h"
#import <Foundation/Foundation.h>

AppDelegate* ad() {
    return (AppDelegate*)[UIApplication sharedApplication].delegate;
}


@interface AppDelegate ()

@end


@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.notices=[[NSMutableArray alloc] init];
/*    Notice* incoming;
    
    incoming = [[Notice alloc] init];
    incoming.title = @"Are chickens helpful?";
    incoming.type = have;
    incoming.meta=@"4 July 2013, 3.5km away";
    incoming.details=@"I've got me some chickens, if you need chickens. They lay well :)";
    incoming.coordinate=CLLocationCoordinate2DMake(-41.295967, 174.787468);
    [self.notices addObject:incoming];
    
    incoming = [[Notice alloc] init];
    incoming.title = @"Ow! Ow! Ow!";
    incoming.type = need;
    incoming.meta=@"4 July 2013, 6km away";
    incoming.details=@"My leg's fallen off. I have to bite their ankles.";
    incoming.coordinate=CLLocationCoordinate2DMake(-41.306203, 174.778648);
    [self.notices addObject:incoming];
    
    incoming = [[Notice alloc] init];
    incoming.title = @"From the department of highways";
    incoming.type= info;
    incoming.meta=@"4 July 2013, 8km away";
    incoming.details=@"A truck has dropped it's load, as it were";
    incoming.coordinate=CLLocationCoordinate2DMake(-41.298491, 174.777388);
    [self.notices addObject:incoming];*/
    
    NSString* path=[[NSBundle mainBundle] pathForResource:@"server_reply" ofType:@"json"];
    NSData* server_reply=[NSData dataWithContentsOfFile:path];
    NSDictionary* json=[NSJSONSerialization JSONObjectWithData:server_reply options:0 error:nil];
    NSDictionary* meat=json[@"Rows"];
    for (id incoming in meat) {
        Notice* new_notice=[[Notice alloc] init];
        new_notice.title=incoming[@"Title"];
        NSString* type=incoming[@"Type"];
        new_notice.type=info;
        if ([type isEqual:@"N"]) new_notice.type=need;
        if ([type isEqual:@"S"]) new_notice.type=have;
        new_notice.details=incoming[@"Description"];
        new_notice.coordinate=CLLocationCoordinate2DMake([incoming[@"Lat"] floatValue], [incoming[@"Lon"] floatValue]);
        [_notices addObject:new_notice];
    }

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
