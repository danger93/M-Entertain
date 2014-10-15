//
//  NewsInfo.h
//  M Entertain
//
//  Created by Pongsakorn Phophool on 8/29/2557 BE.
//  Copyright (c) 2557 Lao Telecom.co.,ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsInfo : NSObject
{
    NSString *feedId;
    NSString *feedTitle;
    NSString *feedContent;
    NSString *feedAttach;
    NSString *feedVdo;
}

@property(nonatomic,retain) NSString *feedId;
@property(nonatomic,retain) NSString *feedTitle;
@property(nonatomic,retain) NSString *feedContent;
@property(nonatomic,retain) NSString *feedAttach;
@property(nonatomic,retain) NSString *feedVdo;

-(id)initWithID:(NSString*)_feedId Title:(NSString*)_feedTitle FeedContent:(NSString*)_feedContent FeedAttach:(NSString*)_feedAttach FeedVdo:(NSString*)_feedVdo;
@end
