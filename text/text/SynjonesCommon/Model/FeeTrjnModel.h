//
//  FeeTrjnModel.h
//  SynjonesCommon
//
//  Created by wdh on 14-8-1.
//  Copyright (c) 2014年 synjones. All rights reserved.
//{"SN":"PEo140731153314000","Code":"PowerFee","NameMemo":"江宁校区1至9号搂江宁1号楼00102","Amount":0.01,"PayState":false,"FeeState":false,"CreateTime":"\/Date(1406791994007)\/","StrCreateTime":"2014-07-31 15:33:14"}

#import <Foundation/Foundation.h>
#import "BaseModel.h"

@interface FeeTrjnModel : BaseModel

@property(copy,nonatomic)NSString *SN;//流水号
@property(copy,nonatomic)NSString *Code;//代码
@property(copy,nonatomic)NSString *NameMemo;//名称
@property(copy,nonatomic)NSString *Amount;//金额
@property(copy,nonatomic)NSString *PayState;//支付状态
@property(copy,nonatomic)NSString *FeeState;//缴费状态
@property(copy,nonatomic)NSString *CreateTime;//创建时间
@property(copy,nonatomic)NSString *Date;//时间
@property(copy,nonatomic)NSString *StrCreateTime;//时间

@end
