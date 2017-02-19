//
//  httpDownLoada.m

//
//  Created by Liang Haiyan on 13-4-23.
//  Copyright (c) 2013 year Liang Haiyan. All rights reserved.
//

#import "HttpDownLoadData.h"

@implementation HttpDownLoadData
@synthesize mData = _mData;
@synthesize delegate = _delegate;
@synthesize mNumber = _mNumber;

- (void)downLoadDataWithUrl:(NSString *)url  andTag:(NSInteger)number {
//    NSLog(@"正在下载url=%@\n number=%d",url,number);
    if (!self.mData)
        self.mData = [[NSMutableData alloc] initWithCapacity:0];
    else
        [self.mData setLength:0];
    
    // 默认为YES, 你可以设定它为NO来禁用gzip压缩
    //    [request setAllowCompressedResponse:YES];

    if (_httpRequest) {
        [_httpRequest release], _httpRequest = nil;
    }
    
    _httpRequest = [[ASIHTTPRequest alloc] initWithURL:[NSURL URLWithString:[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
    _httpRequest.delegate = self;
    self.mNumber = number;
    
    [_httpRequest startAsynchronous];
}
- (void)downLoadDataWithUrl:(NSString *)url withData:(NSDictionary *)dict andTag:(NSInteger)number {
    NSLog(@"正在下载url=%@\n number=%d",url,(int)number);
    NSLog(@"dict:%@",dict);
    
    if (_dataRequest) {
        [_dataRequest release];
        _dataRequest = nil;
    }
    
    if (!self.mData)
        self.mData = [[NSMutableData alloc] initWithCapacity:0];
    else {
        [self.mData setLength:0];
    }

    _dataRequest = [[ASIFormDataRequest alloc] initWithURL:[NSURL URLWithString:[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
    _dataRequest.delegate = self;
    self.mNumber = number;
    _dataRequest.timeOutSeconds = 20.0f;

    if (dict) {
        for (id key in dict) {
            id obj = [dict objectForKey:key];
            if ([obj isKindOfClass:[NSData class]])
                [_dataRequest setData:obj forKey:key];
            else
                [_dataRequest setPostValue:obj forKey:key];
        }
    }
    [_dataRequest startAsynchronous];
}


- (void)requestFinished:(ASIHTTPRequest *)request {
    // 打印返回的东西
    NSLog(@"%@", request.responseString);
    [self.mData appendData:[request responseData]];
    if ([self.delegate respondsToSelector:@selector(downLoadComplete:)])
        [self.delegate downLoadComplete:self];
}
- (void)requestFailed:(ASIHTTPRequest *)request {
    if ([self.delegate respondsToSelector:@selector(downLoadFaild:)])
        [self.delegate downLoadFaild:self];
  
}
- (void)dealloc {
    self.mData = nil;
    [_httpRequest clearDelegatesAndCancel];
    [_dataRequest clearDelegatesAndCancel];
    [_httpRequest release];
    _httpRequest = nil;
    [_dataRequest release];
    _httpRequest = nil;
    [super dealloc];
}
@end
