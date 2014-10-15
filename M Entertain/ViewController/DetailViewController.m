//
//  DetailViewController.m
//  M Entertain
//
//  Created by Pongsakorn Phophool on 8/28/2557 BE.
//  Copyright (c) 2557 Lao Telecom.co.,ltd. All rights reserved.
//

#import "DetailViewController.h"
#import "AppDelegate.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

@synthesize backBtn,imgDetail,txtDetail,titleDetail;

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
    
    @try {
        
        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:delegate.feedAttach]]];
        imgDetail.image =image;
        imgDetail.contentMode = UIViewContentModeScaleAspectFit;
    }
    @catch (NSException *exception) {
        
    }
    @finally {
        
    }
    titleDetail.text = delegate.feedTitle;
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
