//
//  HSDViewController.m
//  UA Notification
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

- (IBAction)btnHelpClick:(id)sender {
    [[Helpshift sharedInstance] showSupport:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)dealloc {
    [super dealloc];
}

@end
