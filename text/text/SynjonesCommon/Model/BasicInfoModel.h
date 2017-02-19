//
//  BaseInfoModel.h
//  SynjonesCommon
//
//  Created by wdh on 14-7-29.
//  Copyright (c) 2014年 synjones. All rights reserved.
//{"name":"测试88791","sno":"88791","cardno":"88791","bankno":"6217001*****88686","bankbalance":0,"cardbalance":"5421","tmpbalance":null,"pretmpbalance":null,"showbankbalance":false,"showbankno":true,"showcardno":true,"showusertype":true,"standingname":null,"deptname":null,"state":"0","frozen":"0"}

#import <Foundation/Foundation.h>
#import "BaseModel.h"

@interface BasicInfoModel : BaseModel

@property(copy,nonatomic)NSString *name;//姓名
@property(copy,nonatomic)NSString *sno;//学号
@property(copy,nonatomic)NSString *cardno;//卡号
@property(copy,nonatomic)NSString *bankno;//银行卡号
@property(copy,nonatomic)NSString *bankbalance;//银行卡余额
@property(copy,nonatomic)NSString *cardbalance;//校园卡余额
@property(copy,nonatomic)NSString *tmpbalance;//过渡余额
@property(copy,nonatomic)NSString *pretmpbalance;//上次过渡余额
@property(copy,nonatomic)NSString *showbankbalance;//显示银行卡余额
@property(copy,nonatomic)NSString *showbankno;//显示的银行卡号
@property(copy,nonatomic)NSString *showcardno;//显示的校园卡号
@property(copy,nonatomic)NSString *showusertype;//用户类型
@property(copy,nonatomic)NSString *standingname;//名称
@property(copy,nonatomic)NSString *deptname;//部门
@property(copy,nonatomic)NSString *state;//状态
@property(copy,nonatomic)NSString *frozen;//冻结状态

@end
