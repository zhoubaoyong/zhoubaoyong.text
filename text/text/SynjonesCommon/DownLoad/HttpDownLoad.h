//
//  HttpDownLoad.h
//  2
//
//  Created by Liang Haiyan on 13-11-28.
//  Copyright (c) 2013年 Synjones. All rights reserved.
//




#import <Foundation/Foundation.h>
#import "ASIFormDataRequest.h"
#import "HttpUrl.h"

@class HttpDownLoad;
@protocol HttpDownLoadDelegate <NSObject>

- (void)downLoadComplete:(HttpDownLoad *)hd;
- (void)downLoadFailed:(HttpDownLoad *)hd;

@end
@interface HttpDownLoad : NSObject <ASIHTTPRequestDelegate>
{
    ASIHTTPRequest *_asiHttpRequest;
    ASIFormDataRequest *_asiFormDataRequest;
}


@property (assign, nonatomic) NSInteger mNumber;
@property (strong, nonatomic) NSMutableData *mDownLoadData;
@property (assign, nonatomic) id<HttpDownLoadDelegate> mDownLoadDelegate;

// get
- (void)downLoadWithUrl:(NSString *)url andTag:(NSInteger)number;
// post
- (void)downLoadWithUrl:(NSString *)url withData:(NSDictionary *)dict andTag:(NSInteger)number;
@end






