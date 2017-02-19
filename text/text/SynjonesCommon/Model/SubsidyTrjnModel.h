//
//  SubsidyTrjnModel.h
//  SynjonesCommon
//
//  Created by wdh on 14-8-4.
//  Copyright (c) 2014年 synjones. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"
@interface SubsidyTrjnModel : BaseModel

@property(copy,nonatomic)NSString *AccType;//账户类型
@property(copy,nonatomic)NSString *FromAccount;//补助账号
@property(copy,nonatomic)NSString *JndateTime;//时间
@property(copy,nonatomic)NSString *SchCode;//金额
@property(copy,nonatomic)NSString *SubAmt;//金额（整数、分）
@property(copy,nonatomic)NSString *SubType;//补助类型
@property(copy,nonatomic)NSString *Subjnstatus;//交易状态
@property(copy,nonatomic)NSString *SysCode;//子系统代码
@property(copy,nonatomic)NSString *SysName;//子系统名称
@property(copy,nonatomic)NSString *ToAccount;//
@property(copy,nonatomic)NSString *TranCode;//交易代码
@property(copy,nonatomic)NSString *TranName;//交易名称

@end
