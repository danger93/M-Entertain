//
//  NewsInfo.m
//  M Entertain
//
//  Created by Pongsakorn Phophool on 8/29/2557 BE.
//  Copyright (c) 2557 Lao Telecom.co.,ltd. All rights reserved.
//

#import "NewsInfo.h"

@implementation NewsInfo
@synthesize feedAttach,feedContent,feedId,feedTitle,feedVdo;

-(id)initWithID:(NSString*)_feedId Title:(NSString*)_feedTitle FeedContent:(NSString*)_feedContent FeedAttach:(NSString*)_feedAttach FeedVdo:(NSString*)_feedVdo
{
    self.feedId = _feedId;
    self.feedTitle = _feedTitle;
    self.feedContent = _feedContent;
    self.feedAttach = _feedAttach;
    self.feedVdo = _feedVdo;
    
    return self;
}
@end
