//
//  HSDViewController.h
//  Notification Count
//
//  Created by Suman Raj on 11/04/13.
//  Copyright (c) 2013 Helpshift, Inc.,. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Helpshift.h"

@interface HSDViewController : UIViewController<HelpshiftDelegate> {
    IBOutlet UIButton *btnHelp;
    IBOutlet UILabel *lblNotification;
}
- (IBAction)btnHelpClick:(id)sender;
@end
