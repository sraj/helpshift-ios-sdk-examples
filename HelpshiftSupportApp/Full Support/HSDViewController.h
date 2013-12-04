//
//  HSDViewController.h
//  Full Support
//
//  Created by Suman Raj on 12/04/13.
//  Copyright (c) 2013 Helpshift, Inc.,. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Helpshift.h"

typedef enum {
    HS_SHOW_HELP  = 11,
    HS_SHOW_CONTACTUS = 12,
    HS_SHOW_FAQSECTION = 13,
    HS_SHOW_SINGLEFAQ = 14,
} HSAPICALLS;

@interface HSDViewController : UIViewController {
    IBOutlet UIScrollView *scrollView;
}
@end
