//
//  FetchJSON.h
//  M Score
//
//  Created by Pongsakorn Phophool on 5/19/2557 BE.
//  Copyright (c) 2557 Pongsakorn Phophool. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FetchJSON : NSObject

+(NSData *)getNewsFeed;
+(NSData *)getGossipFeed;
+(NSData *)getVdoFeed;
+(NSData *)getEventFeed;
+(NSData *)getLatLonByID:(NSString*)_feedId;

@end
