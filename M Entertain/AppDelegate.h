//
//  AppDelegate.h
//  M Entertain
//
//  Created by Pongsakorn Phophool on 8/28/2557 BE.
//  Copyright (c) 2557 Lao Telecom.co.,ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    NSString *feedId;
    NSString *feedTitle;
    NSString *feedContent;
    NSString *feedAttach;
    NSString *feedVdo;
    double feedLat;
    double feedLon;
}

@property(nonatomic,retain) NSString *feedId;
@property(nonatomic,retain) NSString *feedTitle;
@property(nonatomic,retain) NSString *feedContent;
@property(nonatomic,retain) NSString *feedAttach;
@property(nonatomic,retain) NSString *feedVdo;

@property(nonatomic,assign) double feedLat;
@property(nonatomic,assign) double feedLon;

@property (strong, nonatomic) UIWindow *window;

@end
