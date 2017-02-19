//
//  httpDownLoadDataDelegate.h
//
//  Created by Liang Haiyan on 13-4-23.
//  Copyright (c) 2013 year Synjones. All rights reserved.
//

#import <Foundation/Foundation.h>
@class HttpDownLoadData;
@protocol HttpDownLoadDataDelegate <NSObject>

-(void)downLoadComplete:(HttpDownLoadData *)hd;
-(void)downLoadFaild:(HttpDownLoadData *)hd;
@end
