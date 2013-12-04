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

    //Get the notification count for replies to reported issues.
    //
    //If you want to show your user notifications for replies on the issues posted, you can get the notification count asynchronously by implementing the HelpshiftDelegate in your respective .h and .m files. Use the following method to set the delegate, where self is the object implementing the delegate. [[Helpshift sharedInstance] setDelegate:self]; Now you can call the method [[Helpshift sharedInstance] getNotificationCountFromRemote:YES]; This will return a notification count in the – (void) didReceiveNotificationCount:(NSInteger)count count delegate method. If you want to retrieve the current notification count synchronously, you can call the same method with the parameter set to false, i.e NSInteger count = [[Helpshift sharedInstance] getNotificationCountFromRemote:NO]

    [[Helpshift sharedInstance] setDelegate:self];
    [[Helpshift sharedInstance] getNotificationCountFromRemote:TRUE];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [lblNotification setText:@"Notification Started..."];
    });
}

- (void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    dispatch_async(dispatch_get_main_queue(), ^{
        [lblNotification setText:@"Notification Stopped..."];
    });
}

/**
 *  Delegate method call that should be implemented if you are calling getNotificationCountFromRemote:YES
 *
 *  @param count Returns the number of issues with unread messages.
 */
- (void) didReceiveNotificationCount:(NSInteger)count {
    dispatch_async(dispatch_get_main_queue(), ^{
        [btnHelp setTitle:(count > 0 ? [NSString stringWithFormat:@"Help (%d)",count] : @"Help") forState:UIControlStateNormal];
    });
}

- (IBAction)btnHelpClick:(id)sender {
    [[Helpshift sharedInstance] showFAQs:self withOptions:nil];
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
