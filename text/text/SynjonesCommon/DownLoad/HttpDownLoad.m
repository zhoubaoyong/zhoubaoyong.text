//
//  HttpDownLoad.m
//  2
//
//  Created by Liang Haiyan on 13-11-28.
//  Copyright (c) 2013年 Synjones. All rights reserved.
//

#import "HttpDownLoad.h"

@implementation HttpDownLoad

@synthesize mNumber = _mNumber;
@synthesize mDownLoadData = _mDownLoadData;
@synthesize mDownLoadDelegate = _mDownLoadDelegate;

// get
- (void)downLoadWithUrl:(NSString *)url andTag:(NSInteger)number {
    
    NSLog(@"get Url:%@",url);
    
    if (!self.mDownLoadData) {
        
        self.mDownLoadData = [[NSMutableData alloc] initWithData:0];
    }
    else {
        
        [self.mDownLoadData setLength:0];
    }
    
//    if (_asiHttpRequest) {
//        
//        [_asiHttpRequest release], _asiHttpRequest = nil;
//    }
    
    _asiHttpRequest = [[ASIHTTPRequest alloc] initWithURL:[NSURL URLWithString:[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
    _asiHttpRequest.delegate = self;
    _asiHttpRequest.timeOutSeconds = 20.0f;
    [_asiHttpRequest setAllowResumeForFileDownloads:YES];
    
    self.mNumber = number;
    
    [_asiHttpRequest startAsynchronous];
}
// post
- (void)downLoadWithUrl:(NSString *)url withData:(NSDictionary *)dict andTag:(NSInteger)number {
    
    NSLog(@"post Url:%@",url);
    
    if (!self.mDownLoadData) {
        
        self.mDownLoadData = [[NSMutableData alloc] initWithData:0];
    }
    else {
        
        [self.mDownLoadData setLength:0];
    }

//    if (_asiFormDataRequest) {
//        
//        [_asiFormDataRequest release],_asiFormDataRequest = nil;
//    }
    
    _asiFormDataRequest = [[ASIFormDataRequest alloc] initWithURL:[NSURL URLWithString:[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
    _asiFormDataRequest.delegate = self;
    _asiFormDataRequest.timeOutSeconds = 20.0f;
    
    self.mNumber = number;
    
    [_asiFormDataRequest setAllowResumeForFileDownloads:YES];
    
    if (dict) {
        
        for (id key in dict) {
            
            id obj = [dict objectForKey:key];
            
            if ([obj isKindOfClass:[NSData class]]) {
                
                [_asiFormDataRequest setData:obj forKey:key];
            }
            else {
                
                [_asiFormDataRequest setPostValue:obj forKey:key];
            }
        }
    }
    
    [_asiFormDataRequest startAsynchronous];
}

#pragma mark - ASIHTTPRequestDelegate
- (void)requestFinished:(ASIHTTPRequest *)request {
    
    NSLog(@"请求成功");
    NSLog(@"%@",request.responseString);
    
    [self.mDownLoadData appendData:request.responseData];
    if ([self.mDownLoadDelegate respondsToSelector:@selector(downLoadComplete:)]) {
        
        [self.mDownLoadDelegate downLoadComplete:self];
    }

}
- (void)requestFailed:(ASIHTTPRequest *)request {
    
    NSLog(@"请求失败");
//    NSLog(@"%d",request.responseStatusCode);
    if ([self.mDownLoadDelegate respondsToSelector:@selector(downLoadFailed:)]) {
        
        [self.mDownLoadDelegate downLoadFailed:self];
    }
}

- (void)dealloc {
    
    self.mDownLoadData = nil;
    [_asiHttpRequest clearDelegatesAndCancel];
    [_asiHttpRequest release],_asiHttpRequest = nil;
    [_asiFormDataRequest clearDelegatesAndCancel];
    [_asiFormDataRequest release], _asiFormDataRequest = nil;
    
    [super dealloc];
}






@end
