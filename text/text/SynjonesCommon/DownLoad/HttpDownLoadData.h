//
//  httpDownLoadData.h
//
//  Created by Liang Haiyan on 13-4-23.
//  Copyright (c) 2013 year Synjones. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"
#import "HttpDownLoadDataDelegate.h"

@interface HttpDownLoadData : NSObject<ASIHTTPRequestDelegate>
{
    ASIHTTPRequest *_httpRequest;
    ASIFormDataRequest *_dataRequest;
}
@property (retain, nonatomic) NSMutableData *mData;
@property (assign, nonatomic) id<HttpDownLoadDataDelegate> delegate;
@property (assign, nonatomic) NSInteger mNumber;

- (void)downLoadDataWithUrl:(NSString *)url andTag:(NSInteger)number;
- (void)downLoadDataWithUrl:(NSString *)url withData:(NSDictionary *)dict andTag:(NSInteger)number;
@end
