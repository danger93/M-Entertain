//
//  ClipDetailViewController.m
//  M Entertain
//
//  Created by Pongsakorn Phophool on 8/28/2557 BE.
//  Copyright (c) 2557 Lao Telecom.co.,ltd. All rights reserved.
//

#import "ClipDetailViewController.h"
#import "AppDelegate.h"

@interface ClipDetailViewController (Private)

@end

@implementation ClipDetailViewController
@synthesize youTubeWebView,txtDetail,lbTitle,backBtn;

AppDelegate *delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    delegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    youTubeWebView.allowsInlineMediaPlayback=YES;
    youTubeWebView.mediaPlaybackRequiresUserAction=NO;
    youTubeWebView.mediaPlaybackAllowsAirPlay=YES;
//    youTubeWebView.delegate=self;
    youTubeWebView.scrollView.bounces=NO;
    youTubeWebView.backgroundColor= [UIColor clearColor];
    [youTubeWebView setOpaque:NO];
    
    NSString *linkObj = delegate.feedVdo;
    
    linkObj = [linkObj stringByReplacingOccurrencesOfString:@"http://youtu.be/"
                                         withString:@""];
    
    NSLog(@"linkObj1_________________%@",linkObj);
    
    CGSize iOSDeviceScreenSize = [[UIScreen mainScreen] bounds].size;
    
    NSString *embedHTML;
    
    if (iOSDeviceScreenSize.height > 568)
    {
        embedHTML = [NSString stringWithFormat:@"<iframe width=\"655\" height=\"410\" src=\"http://www.youtube.com/embed/%@\" frameborder=\"0\" allowfullscreen></iframe>",linkObj];
    }else
    {
        embedHTML = [NSString stringWithFormat:@"<iframe width=\"285\" height=\"145\" src=\"http://www.youtube.com/embed/%@\" frameborder=\"0\" allowfullscreen></iframe>",linkObj];
    }
    
    [youTubeWebView loadHTMLString:embedHTML baseURL:nil];
    [self.view addSubview:youTubeWebView];
    
    lbTitle.text = delegate.feedTitle;
    txtDetail.text = delegate.feedContent;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(IBAction)backClick
{
    [self dismissViewControllerAnimated:NO completion:nil];
}
@end
