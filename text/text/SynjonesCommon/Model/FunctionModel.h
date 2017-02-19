//
//  FunctionModel.h
//  SynjonesCommon
//
//  Created by wdh on 14-7-30.
//  Copyright (c) 2014年 synjones. All rights reserved.
//{"ID":17,"ParentID":2,"Name":"转账充值","Code":"TransferRecharge","SchoolCode":"ALL","IsEnable":true,"IsDisplay":true,"IsNeedLogin":true,"StartContext":null,"IconName":"schoolcard_zzcz","Order":31,"Paras":null,"IsNeedPermission":false,"Childrens":null,"ClientType":"Android|IOS|Wap"}

#import <Foundation/Foundation.h>
#import "BaseModel.h"

@interface FunctionModel : BaseModel

@property(copy,nonatomic)NSString *ID;//id
@property(copy,nonatomic)NSString *ParentID;//上级id
@property(copy,nonatomic)NSString *Name;//名称
@property(copy,nonatomic)NSString *Code;//编号
@property(copy,nonatomic)NSString *SchoolCode;//学校代码
@property(copy,nonatomic)NSString *IsEnable;//可用
@property(copy,nonatomic)NSString *IsDisplay;//显示
@property(copy,nonatomic)NSString *IsNeedLogin;//登录
@property(copy,nonatomic)NSString *StartContext;//上下文
@property(copy,nonatomic)NSString *IconName;//图片名
@property(copy,nonatomic)NSString *Orders;//序数
@property(copy,nonatomic)NSString *Paras;//参数
@property(copy,nonatomic)NSString *IsNeedPermission;//是否需要权限
@property(copy,nonatomic)NSString *Childrens;//子
@property(copy,nonatomic)NSString *ClientType;//子类型


@end
