//
//  DetailMapViewController.m
//  M Entertain
//
//  Created by Pongsakorn Phophool on 9/2/2557 BE.
//  Copyright (c) 2557 Lao Telecom.co.,ltd. All rights reserved.
//

#import "DetailMapViewController.h"
#import "MapPinAnnotation.h"
#import "FetchJSON.h"
#import "AppDelegate.h"

@interface DetailMapViewController ()

@end

@implementation DetailMapViewController
@synthesize img,lbTitle,txtDetail,btnMap;

AppDelegate *delegate;
FetchJSON *fetchJson;

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
    
    @try
    {
        
        
        NSDictionary *coordinate= [NSJSONSerialization JSONObjectWithData:[FetchJSON getLatLonByID:delegate.feedId] options:0 error:nil];
        
        delegate.feedLat = [coordinate[@"lat"] doubleValue];
        delegate.feedLon = [coordinate[@"long"] doubleValue];
                
        if ([coordinate[@"lat"] isEqualToString:@"-"]) {
            btnMap.hidden = YES;
        }
       
        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:delegate.feedAttach]]];
        img.image =image;
        img.contentMode = UIViewContentModeScaleAspectFit;
        
    }
    @catch (NSException * e) {
        NSLog(@"Exception: %@", e);
    }
    @finally {
        // Added to show finally works as well
    }

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
