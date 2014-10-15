//
//  FetchJSON.m
//  M Score
//
//  Created by Pongsakorn Phophool on 5/19/2557 BE.
//  Copyright (c) 2557 Pongsakorn Phophool. All rights reserved.
//

#import "FetchJSON.h"

@implementation FetchJSON

+(NSData *)getNewsFeed
{
    @try {
        NSString *urlString = @"http://115.84.101.118:8080/entertainment/index.php/entertainment/getNewsFeed";

        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init] ;
        [request setURL:[NSURL URLWithString:urlString]];
        [request setHTTPMethod:@"POST"];
        
        NSString *boundary = @"---------------------------14737809831466499882746641449";
        NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
        [request addValue:contentType forHTTPHeaderField: @"Content-Type"];
        
        
        NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
        
        return returnData;

    }
    @catch (NSException *exception) {
        return nil;
    }
    @finally {
        NSLog(@"Success.");
    }
}
+(NSData *)getGossipFeed
{
    @try {
        NSString *urlString = @"http://115.84.101.118:8080/entertainment/index.php/entertainment/getGossipFeed";
        
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init] ;
        [request setURL:[NSURL URLWithString:urlString]];
        [request setHTTPMethod:@"POST"];
        
        NSString *boundary = @"---------------------------14737809831466499882746641449";
        NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
        [request addValue:contentType forHTTPHeaderField: @"Content-Type"];
        
        
        NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
        
        return returnData;
        
    }
    @catch (NSException *exception) {
        return nil;
    }
    @finally {
        NSLog(@"Success.");
    }
}
+(NSData *)getVdoFeed
{
    @try {
        NSString *urlString = @"http://115.84.101.118:8080/entertainment/index.php/entertainment/getVideoFeed";
        
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init] ;
        [request setURL:[NSURL URLWithString:urlString]];
        [request setHTTPMethod:@"POST"];
        
        NSString *boundary = @"---------------------------14737809831466499882746641449";
        NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
        [request addValue:contentType forHTTPHeaderField: @"Content-Type"];
        
        
        NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
        
        return returnData;
        
    }
    @catch (NSException *exception) {
        return nil;
    }
    @finally {
        NSLog(@"Success.");
    }
}
+(NSData *)getEventFeed
{
    @try {
        NSString *urlString = @"http://115.84.101.118:8080/entertainment/index.php/entertainment/getEventFeed";
        
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init] ;
        [request setURL:[NSURL URLWithString:urlString]];
        [request setHTTPMethod:@"POST"];
        
        NSString *boundary = @"---------------------------14737809831466499882746641449";
        NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
        [request addValue:contentType forHTTPHeaderField: @"Content-Type"];
        
        
        NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
        
        return returnData;
        
    }
    @catch (NSException *exception) {
        return nil;
    }
    @finally {
        NSLog(@"Success.");
    }
}

+(NSData *)getLatLonByID:(NSString*)_feedId
{
    @try {
        NSString *urlString = @"http://115.84.101.118:8080/entertainment/index.php/entertainment/getEventLocation";
        
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init] ;
        [request setURL:[NSURL URLWithString:urlString]];
        [request setHTTPMethod:@"POST"];
        
        NSString *boundary = @"---------------------------14737809831466499882746641449";
        NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
        [request addValue:contentType forHTTPHeaderField: @"Content-Type"];
        
        NSMutableData *body = [NSMutableData data];
        //------Param UID------
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"feed_id\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"%@",_feedId] dataUsingEncoding:NSUTF8StringEncoding]];
        //----------------
        [request setHTTPBody:body];
        
        NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
        
        return returnData;
        
    }
    @catch (NSException *exception) {
        return nil;
    }
    @finally {
        NSLog(@"Success.");
    }

}
//+(NSData *)sentStatByUID:(NSString*)_uid channel:(NSString*)_channel
//{
//    @try {
//        NSString *urlString = @"http://115.84.101.118:8080/worldcup2014/index.php/feed/puturlviewstat/";
//        
//        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init] ;
//        [request setURL:[NSURL URLWithString:urlString]];
//        [request setHTTPMethod:@"POST"];
//        
//        NSString *boundary = @"---------------------------14737809831466499882746641449";
//        NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
//        [request addValue:contentType forHTTPHeaderField: @"Content-Type"];
//        
//        NSMutableData *body = [NSMutableData data];
//        //------Param UID------
//        [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
//        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"uid\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
//        [body appendData:[[NSString stringWithFormat:@"%@",_uid] dataUsingEncoding:NSUTF8StringEncoding]];
//        //----------------
//        //------Param Channel------
//        [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
//        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"channel\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
//        [body appendData:[[NSString stringWithFormat:@"%@",_channel] dataUsingEncoding:NSUTF8StringEncoding]];
//        //----------------
//        [request setHTTPBody:body];
//        NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
//        
//        return returnData;
//    }
//    @catch (NSException *exception) {
//        return nil;
//    }
//    @finally {
//        NSLog(@"Success.");
//    }
//    
//}

@end
