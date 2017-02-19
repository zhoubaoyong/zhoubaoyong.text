//
//  CardTypeModel.h
//  SynjonesCommon
//
//  Created by wdh on 14-7-29.
//  Copyright (c) 2014年 synjones. All rights reserved.
//
//{"ID":8,"Name":"校园卡管理","CreateTime":"\/Date(1396954819070)\/","StrCreateTime":"2014-04-08 19:00","ParentID":2,"Code":"XYKGL","OrderID":2,"IsNeedImg":false,"IsNeedAttach":false,"IsOutsideUrl":false,"Creator":null,"IsDisplay":true,"IsForAllSystem":false,"IsNeedValidateTime":false,"IsNeedOrder":false,"IsDefaultTemplate":false}

#import <Foundation/Foundation.h>
#import "BaseModel.h"

@interface CardNoticeTypeModel : BaseModel

@property(copy,nonatomic)NSString *ID;//id
@property(copy,nonatomic)NSString *Name;//名称
@property(copy,nonatomic)NSString *CreateTime;//创建时间
@property(copy,nonatomic)NSString *Date;//时间
@property(copy,nonatomic)NSString *StrCreateTime;//时间
@property(copy,nonatomic)NSString *ParentID;//上级id
@property(copy,nonatomic)NSString *Code;//编号
@property(copy,nonatomic)NSString *OrderID;//id
@property(copy,nonatomic)NSString *IsNeedImg;//图片
@property(copy,nonatomic)NSString *IsNeedAttach;//接触
@property(copy,nonatomic)NSString *IsOutsideUrl;//外部连接
@property(copy,nonatomic)NSString *Creator;//创建者
@property(copy,nonatomic)NSString *IsDisplay;//显示
@property(copy,nonatomic)NSString *IsForAllSystem;//所有系统
@property(copy,nonatomic)NSString *IsNeedValidateTime;//已点击
@property(copy,nonatomic)NSString *IsNeedOrder;//
@property(copy,nonatomic)NSString *IsDefaultTemplate;//已点击

@end
