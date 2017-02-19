//
//  FaqModel.h
//  SynjonesCommon
//
//  Created by wdh on 14-7-28.
//  Copyright (c) 2014年 synjones. All rights reserved.
//
//类别
//{"ID":9,"Name":"应用中心","CreateTime":"\/Date(1396954819070)\/","StrCreateTime":"2014-04-08 19:00","ParentID":2,"Code":"YYZX","OrderID":4,"IsNeedImg":false,"IsNeedAttach":false,"IsOutsideUrl":false,"Creator":null,"IsDisplay":true,"IsForAllSystem":false,"IsNeedValidateTime":false,"IsNeedOrder":false,"IsDefaultTemplate":false}

//{"ID":13,"CreateTime":"\/Date(1396954819540)\/","StrCreateTime":"2014-04-08 19:00","Title":"通过服务平台可对校园卡进行哪些管理？","Context":"通过服务平台，用户可以查看自己校园卡的基本信息，了解自己的校园卡的账户状态；还可以查询最近12个月以内的校园卡交易流水，在线进行校园卡挂失和转帐。","ContentCategoryID":8,"SenderID":null,"SenderName":null,"DepartmentName":null,"Status":1,"SendWay":"","OutSideUrl":null,"Receivers":[],"ContentIsRead":false}

#import <Foundation/Foundation.h>
#import "BaseModel.h"

@interface FaqModel : BaseModel

@property(copy,nonatomic)NSString *ID;//id
@property(copy,nonatomic)NSString *CreateTime;//时间
@property(copy,nonatomic)NSString *StrCreateTime;//时间
@property(copy,nonatomic)NSString *Title;//标题
@property(copy,nonatomic)NSString *Context;//上下文
@property(copy,nonatomic)NSString *ContentCategoryID;//类别id
@property(copy,nonatomic)NSString *SenderID;//发送人id
@property(copy,nonatomic)NSString *SenderName;//发送人名称
@property(copy,nonatomic)NSString *DepartmentName;//部门名称
@property(assign,nonatomic)int Status;//状态
@property(copy,nonatomic)NSString *SendWay;//发送方式
@property(copy,nonatomic)NSString *OutSideUrl;//外部url
@property(copy,nonatomic)NSString *Receivers;//接收人
@property(copy,nonatomic)NSString *ContentIsRead;//是否已读

@end
