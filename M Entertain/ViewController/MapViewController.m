//
//  MapViewController.m
//  M Entertain
//
//  Created by Pongsakorn Phophool on 10/13/2557 BE.
//  Copyright (c) 2557 Lao Telecom.co.,ltd. All rights reserved.
//

#import "MapViewController.h"
#import "AppDelegate.h"
#import "MapPinAnnotation.h"

@interface MapViewController ()

@end

@implementation MapViewController
@synthesize mapView;

AppDelegate *delegate;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    delegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    MKCoordinateRegion region = {{0.0, 0.0}, {0.0,0.0}};
    region.center.latitude = delegate.feedLat;
    region.center.longitude = delegate.feedLon;
    region.span.latitudeDelta = 0.01f;
    region.span.longitudeDelta = 0.01f;
    [mapView setRegion:region animated:YES];
    
    MapPinAnnotation *ann = [[MapPinAnnotation alloc] init];
    ann.coordinate = region.center;
    [mapView addAnnotation:ann];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(IBAction)backClick
{
    [self dismissViewControllerAnimated:NO completion:nil];
}

@end
