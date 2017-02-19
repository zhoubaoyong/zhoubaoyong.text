//
//  TransferInfoModel.h
//  SynjonesCommon
//
//  Created by wdh on 14-8-1.
//  Copyright (c) 2014年 synjones. All rights reserved.
//{"limit":300,"isNeedBankNo":false,"isNeedBankPwd":false}

#import <Foundation/Foundation.h>
#import "BaseModel.h"
@interface TransferInfoModel : BaseModel

@property(copy,nonatomic)NSString *limit;// 限制金额
@property(copy,nonatomic)NSString *isNeedBankNo;//需要银行卡号
@property(copy,nonatomic)NSString *isNeedBankPwd;//银行卡密码

@end
