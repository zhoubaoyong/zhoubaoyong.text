//
//  AWeekAndHistoryModel.h
//  SynjonesCommon
//
//  Created by wdh on 14-8-4.
//  Copyright (c) 2014年 synjones. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"
@interface AWeekAndHistoryModel : BaseModel

@property(copy,nonatomic)NSString *AccAmt;//电子账户余额
@property(copy,nonatomic)NSString *AccTypeName;//电子账户名称
@property(copy,nonatomic)NSString *Account;//一卡通号
@property(copy,nonatomic)NSString *CardBalance;//卡内余额
@property(copy,nonatomic)NSString *ConsumeType;//交易类型
@property(copy,nonatomic)NSString *EffectDate;//补助类型
@property(copy,nonatomic)NSString *FromJnNumber;//交易状态
@property(copy,nonatomic)NSString *JnDateTime;//交易时间
@property(copy,nonatomic)NSString *PosCode;//Pos号
@property(copy,nonatomic)NSString *MercAccount;//商户编号
@property(copy,nonatomic)NSString *MercName;//商户名称
@property(copy,nonatomic)NSString *SysCode;//子系统编号
@property(copy,nonatomic)NSString *SysName;//子系统名称
@property(copy,nonatomic)NSString *TranAmt;//交易金额
@property(copy,nonatomic)NSString *TranName;//交易名称

@end
