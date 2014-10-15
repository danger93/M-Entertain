//
//  VdoViewController.m
//  M Entertain
//
//  Created by Pongsakorn Phophool on 8/28/2557 BE.
//  Copyright (c) 2557 Lao Telecom.co.,ltd. All rights reserved.
//

#import "VdoViewController.h"
#import "FetchJSON.h"
#import "NewsInfo.h"
#import "NewsViewCell.h"
#import "AppDelegate.h"

@interface VdoViewController ()
{
    NSMutableArray *VdoMuArray;
}
@end

@implementation VdoViewController

AppDelegate *delegate;
FetchJSON *fetchJson;
UIRefreshControl *refreshControl;

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
    
    VdoMuArray = [[NSMutableArray alloc]initWithObjects: nil];
    
    self.tableView.backgroundColor = [UIColor blackColor];
    // self.tableView.backgroundView = nil;
    
    [self refreshTable];
    
    refreshControl = [[UIRefreshControl alloc]init];
    [self.tableView addSubview:refreshControl];
    [refreshControl addTarget:self action:@selector(refreshTable) forControlEvents:UIControlEventValueChanged];
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
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [VdoMuArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    NewsViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[NewsViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    UIImage *cellImg;
    if (indexPath.row % 2 == 0) {
        cellImg = [UIImage imageNamed:@"container_bg_icon_line_vdo.png"];
    }else{
        cellImg = [UIImage imageNamed:@"container_icon_bg_line_vdo.png"];
    }
    
    cell.cellImg.image = cellImg;
    
    cell.lbFeedName.text = [[VdoMuArray objectAtIndex:indexPath.row]feedTitle];
    cell.lbFeedContent.text = [[VdoMuArray objectAtIndex:indexPath.row]feedContent];
    
    @try {
       
        
        NSURL* url = [NSURL URLWithString:[[VdoMuArray objectAtIndex:indexPath.row]feedAttach]];
        NSURLRequest* request = [NSURLRequest requestWithURL:url];
        
        [NSURLConnection sendAsynchronousRequest:request
                                           queue:[NSOperationQueue mainQueue]
                               completionHandler:^(NSURLResponse * response,
                                                   NSData * data,
                                                   NSError * error) {
                                   if (!error){
                                       cell.feedImg.image = [[UIImage alloc] initWithData:data];
                                       cell.feedImg.contentMode = UIViewContentModeScaleAspectFit;
                                       // do whatever you want with image
                                   }
                                   
                               }];
    }
    @catch (NSException *exception) {
        
    }
    @finally {
        
    }
    cell.cellBtn.tag = indexPath.row;
    [cell.cellBtn addTarget:self action:@selector(cellClick:) forControlEvents:UIControlEventTouchUpInside];
    
    //    [[cell contentView] setBackgroundColor:[UIColor clearColor]];
    //    [[cell backgroundView] setBackgroundColor:[UIColor clearColor]];
    //    [cell setBackgroundColor:[UIColor clearColor]];
    return cell;
}
-(IBAction)cellClick:(id)sender
{
    delegate.feedTitle = [[VdoMuArray objectAtIndex:[sender tag]]feedTitle];
    delegate.feedAttach = [[VdoMuArray objectAtIndex:[sender tag]]feedAttach];
    delegate.feedContent = [[VdoMuArray objectAtIndex:[sender tag]]feedContent];
    delegate.feedVdo =[[VdoMuArray objectAtIndex:[sender tag]]feedVdo];
    
    NSString *deviceType = [UIDevice currentDevice].model;
    CGSize iOSDeviceScreenSize = [[UIScreen mainScreen] bounds].size;
    UIStoryboard *story;
    
    if ([deviceType isEqualToString:@"iPhone"] || [deviceType isEqualToString:@"iPhone Simulator"]) {
        if (iOSDeviceScreenSize.height == 480)
        {
            story = [UIStoryboard storyboardWithName:@"Main_iPhone35" bundle:nil];
            
        }else{
            story = [UIStoryboard storyboardWithName:@"Main_iPhone4" bundle:nil];
            
        }
    }else{
        story = [UIStoryboard storyboardWithName:@"Main_iPad" bundle:nil];
        
    }
    
    UIViewController * UIVC = [story instantiateViewControllerWithIdentifier:@"ClipDetailViewController"];
    [UIVC setModalPresentationStyle:UIModalPresentationFullScreen];
    UIVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:UIVC animated:YES completion:nil];
    
}

- (void)refreshTable {
    //TODO: refresh your data
    [self testInternetConnection];
    
    @try
    {
        [VdoMuArray removeAllObjects];
        
        NSArray *newsArr= [NSJSONSerialization JSONObjectWithData:[FetchJSON getVdoFeed] options:0 error:nil];
        
        for (NSDictionary *news in newsArr) {
            // THE REST OF YOUR CODE
             NewsInfo * info = [[NewsInfo alloc]initWithID:news[@"feed_id"] Title:news[@"feedtitle"] FeedContent:news[@"feedcontent"] FeedAttach:news[@"feedattach"] FeedVdo:news[@"feedvid"]];
            [VdoMuArray addObject:info];
        }
    }
    @catch (NSException * e) {
        NSLog(@"Exception: %@", e);
    }
    @finally {
        // Added to show finally works as well
    }
    
    [refreshControl endRefreshing];
    [self.tableView reloadData];
}

- (void)testInternetConnection
{
    
    NSURL *scriptUrl = [NSURL URLWithString:@"http://115.84.101.118:8080/entertainment/index.php/entertainment/getNewsFeed"];
    NSData *data = [NSData dataWithContentsOfURL:scriptUrl];
    if (data)
    {
        NSLog(@"Device is connected to the internet");
        
    }else{
        NSLog(@"Device is not connected to the internet");
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No network connection"
                                                        message:@"You must be connected to the internet to use this app."
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
}

@end
