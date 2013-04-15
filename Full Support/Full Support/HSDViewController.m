//
//  HSDViewController.m
//  Full Support
//
//  Created by Suman Raj on 12/04/13.
//  Copyright (c) 2013 Helpshift, Inc.,. All rights reserved.
//

#import "HSDViewController.h"
#import <QuartzCore/QuartzCore.h>

@implementation HSDViewController

static NSArray *hsFeatures = nil;

- (void) initAllFeatures {
    if (hsFeatures == nil) {
        hsFeatures = [[NSArray alloc] initWithObjects:
                        [NSDictionary dictionaryWithObjectsAndKeys:
                            @"You can use the showSupport: api call to provide a way for the user to invoke the purpose built help/support section in your app. This is the easiest approach to enable help in your app as it bundles all the capabilities of the Helpshift SDK in a simple and intuitive interface.", @"description",
                            @"Show Support", @"title",
                            UIColorFromRGB(0xA7C5BD), @"bgcolor", nil],
                        [NSDictionary dictionaryWithObjectsAndKeys:
                            @"You can use the reportIssue: api call to provide a way for the user to send feedback or report an issue directly to you. This has been provided if you want to embed a \"Send Feedback\" or \"Report an Issue\" action in your app and want to lead the user to this action directly without having to go to the FAQ and search/browse the FAQ before they can send you feedback.", @"description",
                            @"Report Issue", @"title",
                            UIColorFromRGB(0xE5DDCB), @"bgcolor",nil],
                        [NSDictionary dictionaryWithObjectsAndKeys:
                            @"You can use the showInbox: api call to show the inbox of all the conversations between your customer and you. Any reply / message that an agent sends to the user will show as notification badges for each issue in the inbox.", @"description",
                            @"Show Inbox", @"title",
                            UIColorFromRGB(0xEB7B59), @"bgcolor", nil],
                        [NSDictionary dictionaryWithObjectsAndKeys:
                            @"You can use the showFAQs: api call to show the Helpshift support screen with only the FAQs. Users will be able to browse and search through all the FAQ sections.", @"description",
                            @"Show All FAQs", @"title",
                            UIColorFromRGB(0xCF4647), @"bgcolor", nil],
                        [NSDictionary dictionaryWithObjectsAndKeys:
                            @"You can use showFAQSection:withController: api call to show faqs from a particular FAQ section. You will need the publish-id of the FAQ section in this case. The publish-id will be the id of the FAQ section which is shown under FAQs (_yourcompany_.helpshift.com/admin/faq/).", @"description",
                            @"Show FAQ Section", @"title",
                            UIColorFromRGB(0x524656), @"bgcolor", nil],
                      [NSDictionary dictionaryWithObjectsAndKeys:
                            @"You can use the showFAQ:withController: api call to show a single faq question. You will need the publish-id of the FAQ. The publish-id will be the id of the FAQ which is shown under FAQs (_yourcompany_.helpshift.com/admin/faq/). ", @"description",
                            @"Show Single FAQ", @"title",
                            UIColorFromRGB(0xA7C5BD), @"bgcolor", nil],
                      nil];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initAllFeatures];
	[self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"paper"]]];
    __block CGFloat prevHeight = 0;
    [hsFeatures enumerateObjectsUsingBlock:^(id featuresDict, NSUInteger idx, BOOL *stop) {
        CGSize maxTxtSize = CGSizeMake(self.view.frame.size.width - 40,9999);
        CGSize minTxtSize = CGSizeMake(self.view.frame.size.width - 40, 120);
        if([[featuresDict valueForKey:@"description"] length] > 1)
        {
            UIFont *labelFont = [UIFont systemFontOfSize:14.0f];
            minTxtSize = [[featuresDict valueForKey:@"description"] sizeWithFont:labelFont constrainedToSize:maxTxtSize lineBreakMode:UILineBreakModeWordWrap];
        }
        UIView *showSupportView = [[[UIView alloc] initWithFrame:CGRectMake(0, prevHeight, self.view.frame.size.width, (minTxtSize.height + 100))] autorelease];
        [showSupportView setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
        [showSupportView setBackgroundColor:[featuresDict valueForKey:@"bgcolor"]];
        
        UITextView *descView = [[[UITextView alloc] init] autorelease];
        [descView setScrollEnabled:NO];
        [descView setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
        [descView setBackgroundColor:[UIColor clearColor]];
        [descView setEditable:NO];
        [descView setFont:[UIFont systemFontOfSize:14.0f]];
        [descView setText:[featuresDict valueForKey:@"description"]];
        [descView setFrame:CGRectMake(10, 10, minTxtSize.width + 20, minTxtSize.height + 20)];
        [showSupportView addSubview:descView];
        
        UIButton *btnShowFeature = [UIButton buttonWithType:UIButtonTypeCustom];
        [btnShowFeature setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
        [btnShowFeature setTag:(idx + 11)];
        [btnShowFeature.titleLabel setFont:[UIFont boldSystemFontOfSize:14.0f]];
        [btnShowFeature setBackgroundColor:[UIColor redColor]];
        [btnShowFeature addTarget:self action:@selector(btnSupportClick:) forControlEvents:UIControlEventTouchUpInside];
        [btnShowFeature setTitle:[featuresDict valueForKey:@"title"] forState:UIControlStateNormal];
        [btnShowFeature setFrame:CGRectMake((self.view.frame.size.width/2) - 75, (minTxtSize.height + 40), 150, 40)];
        [showSupportView addSubview:btnShowFeature];
        prevHeight = prevHeight + minTxtSize.height + 100;
        [scrollView addSubview:showSupportView];
    
    }];
    [scrollView setContentSize:CGSizeMake(self.view.frame.size.width, prevHeight)];
}

//Showing the support screens in app [http://www.helpshift.com/docs/howto/ios/v2.x/#decomposition]
- (void)btnSupportClick:(id)sender {
    UIButton *button = (UIButton *) sender;
    switch (button.tag) {
        case HS_SHOW_SUPPORT:
            [[Helpshift sharedInstance] showSupport:self];
            break;
        case HS_SHOW_REPORTISSUE:
            [[Helpshift sharedInstance] reportIssue:self];
            break;
        case HS_SHOW_FAQS:
            [[Helpshift sharedInstance] showFAQs:self];
            break;
        case HS_SHOW_INBOX:
            [[Helpshift sharedInstance] showInbox:self];
            break;
        case HS_SHOW_FAQSECTION:
            //The PUBLISH-ID will be the id of the FAQ section which is shown under FAQs (_yourcompany_.helpshift.com/admin/faq/).
            [[Helpshift sharedInstance] showFAQSection:@"<PUBLISH-ID>" withController:self];
            break;
        case HS_SHOW_SINGLEFAQ:
            //The PUBLISH-ID will be the id of the FAQ which is shown under FAQs (_yourcompany_.helpshift.com/admin/faq/)
            [[Helpshift sharedInstance] showFAQ:@"<PUBLISH-ID>" withController:self];
            break;
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)dealloc {
    [scrollView release];
    [super dealloc];
}
@end
