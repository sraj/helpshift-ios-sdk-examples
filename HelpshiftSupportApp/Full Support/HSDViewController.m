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
                            @"You can use the showFAQs:withOptions: api call to show the Helpshift screen with only the faq sections with search with optional arguments, you can use this api. This screen will not show the issues reported by the user. If you do not want to pass any options then just pass nil which will take on the default options.", @"description",
                            @"Help", @"title",
                            UIColorFromRGB(0xA7C5BD), @"bgcolor", nil],
                        [NSDictionary dictionaryWithObjectsAndKeys:
                            @"You can use the showConversation:withOptions: api call to show the Helpshift conversation screen with optional arguments you will need to pass the name of the viewcontroller on which the conversation screen will show up and an options dictionary. If you do not want to pass any options then just pass nil which will take on the default options.", @"description",
                            @"Contact Us", @"title",
                            UIColorFromRGB(0xE5DDCB), @"bgcolor",nil],
                        [NSDictionary dictionaryWithObjectsAndKeys:
                            @"You can use showFAQSection:withController:withOptions: api call To show the Helpshift screen for showing a particular faq section you need to pass the publish-id of the faq section and the name of the viewcontroller on which the faq section screen will show up. For example from inside a viewcontroller you can call the Helpshift faq section screen by passing the argument “self” for the viewController parameter. If you do not want to pass any options then just pass nil which will take on the default options.", @"description",
                            @"Show FAQ Section", @"title",
                            UIColorFromRGB(0x524656), @"bgcolor", nil],
                        [NSDictionary dictionaryWithObjectsAndKeys:
                            @"You can use the showSingleFAQ:withController:withOptions: api call To show the Helpshift screen for showing a single faq you need to pass the publish-id of the faq and the name of the viewcontroller on which the faq screen will show up. For example from inside a viewcontroller you can call the Helpshift faq section screen by passing the argument “self” for the viewController parameter. If you do not want to pass any options then just pass nil which will take on the default options.", @"description",
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
        case HS_SHOW_HELP:
            [[Helpshift sharedInstance] showFAQs:self withOptions:nil];
            break;
        case HS_SHOW_CONTACTUS:
            [[Helpshift sharedInstance] showConversation:self withOptions:nil];
            break;
        case HS_SHOW_FAQSECTION:
            //The PUBLISH-ID will be the id of the FAQ section which is shown under FAQs (_yourcompany_.helpshift.com/admin/faq/).
            [[Helpshift sharedInstance] showFAQSection:@"<PUBLISH-ID>" withController:self withOptions:nil];
            break;
        case HS_SHOW_SINGLEFAQ:
            //The PUBLISH-ID will be the id of the FAQ which is shown under FAQs (_yourcompany_.helpshift.com/admin/faq/)
            [[Helpshift sharedInstance] showSingleFAQ:@"<PUBLISH-ID>" withController:self withOptions:nil];
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
