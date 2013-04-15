//
//  HSDViewController.m
//  Notification Count
//
//  Created by Suman Raj on 11/04/13.
//  Copyright (c) 2013 Helpshift, Inc.,. All rights reserved.
//

#import "HSDViewController.h"

@interface HSDViewController ()

@end

@implementation HSDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"paper"]]];
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[Helpshift sharedInstance] setDelegate:self];
    [[Helpshift sharedInstance] startNotificationCountPolling:5];
    dispatch_async(dispatch_get_main_queue(), ^{
        [lblNotification setText:@"Notification Started..."];
    });
    
}

- (void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [[Helpshift sharedInstance] stopNotificationCountPolling];
    dispatch_async(dispatch_get_main_queue(), ^{
        [lblNotification setText:@"Notification Stopped..."];
    });

}

- (void) notificationCountAsyncReceived:(NSInteger)count {
    dispatch_async(dispatch_get_main_queue(), ^{
        [btnHelp setTitle:(count > 0 ? [NSString stringWithFormat:@"Help (%d)",count] : @"Help") forState:UIControlStateNormal];
    });
}

- (IBAction)btnHelpClick:(id)sender {
    [[Helpshift sharedInstance] showSupport:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)dealloc {
    [btnHelp release];
    [lblNotification release];
    [super dealloc];
}
- (void)viewDidUnload {
    [lblNotification release];
    lblNotification = nil;
    [super viewDidUnload];
}
@end
