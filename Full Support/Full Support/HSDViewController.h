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
    HS_SHOW_SUPPORT  = 11,
    HS_SHOW_REPORTISSUE = 12,
    HS_SHOW_INBOX = 13,
    HS_SHOW_FAQS = 14,
    HS_SHOW_FAQSECTION= 15,
    HS_SHOW_SINGLEFAQ = 16
} HSAPICALLS;

@interface HSDViewController : UIViewController {
    IBOutlet UIScrollView *scrollView;
}
@end
