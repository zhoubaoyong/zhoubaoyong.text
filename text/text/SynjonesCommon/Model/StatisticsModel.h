//
//  StatisticsModel.h
//  SynjonesCommon
//
//  Created by wdh on 14-8-1.
//  Copyright (c) 2014年 synjones. All rights reserved.
//{"NewAddUser":0,"UserCount":67,"DownLoadTime":826,"DownLoadForAndroid":2,"DownLaodForIos":824,"SucceedCount":27,"SucceedAmount":2633137.52,"FailCount":0,"FailAmount":0.01}

#import <Foundation/Foundation.h>
#import "BaseModel.h"
@interface StatisticsModel : BaseModel

@property(copy,nonatomic)NSString *NewAddUser;//新增用户
@property(copy,nonatomic)NSString *UserCount;//用户总数
@property(copy,nonatomic)NSString *DownLoadTime;//下载次数
@property(copy,nonatomic)NSString *DownLoadForAndroid;//android下载次数
@property(copy,nonatomic)NSString *DownLaodForIos;//ios下载次数
@property(copy,nonatomic)NSString *SucceedCount;//成功笔数
@property(copy,nonatomic)NSString *SucceedAmount;//成功金额
@property(copy,nonatomic)NSString *FailCount;//失败笔数
@property(copy,nonatomic)NSString *FailAmount;//失败金额

@end
