//
//  EaccInfoModel.h
//  SynjonesCommon
//
//  Created by wdh on 14-7-29.
//  Copyright (c) 2014年 synjones. All rights reserved.
//{"account":"88791","name":"电子账户1","accamt":"10","acctype":"001","createdatetime":"2014-7-29","IsLock":null,"IsBanlace":null,"IsGood":null,"IsSpecial":null,"IsCardMoney":null,"IsDisable":null,"accinfo_flag":null,"acctype_flag":null}


#import <Foundation/Foundation.h>
#import "BaseModel.h"

@interface EaccInfoModel : BaseModel

@property(copy,nonatomic)NSString *account;//账号
@property(copy,nonatomic)NSString *name;//名称
@property(copy,nonatomic)NSString *accamt;//余额
@property(copy,nonatomic)NSString *acctype;//类型
@property(copy,nonatomic)NSString *createdatetime;//创建时间
@property(copy,nonatomic)NSString *IsLock;//锁
@property(copy,nonatomic)NSString *IsBanlace;//存在余额？
@property(copy,nonatomic)NSString *IsGood;//可购物？
@property(copy,nonatomic)NSString *IsSpecial;//特殊？
@property(copy,nonatomic)NSString *IsCardMoney;//是否卡余额？
@property(copy,nonatomic)NSString *IsDisable;//可用
@property(copy,nonatomic)NSString *accinfo_flag;//账户标识
@property(copy,nonatomic)NSString *acctype_flag;//账户类型标识

@end
