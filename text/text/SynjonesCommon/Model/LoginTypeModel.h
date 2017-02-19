//
//  LoginTypeModel.h
//  SynjonesCommon
//
//  Created by wdh on 14-7-29.
//  Copyright (c) 2014年 synjones. All rights reserved.
//
//{"ID":9,"Value":"SynCard","Code":"SynCard","Name":"校园卡号"}

#import <Foundation/Foundation.h>
#import "BaseModel.h"
@interface LoginTypeModel : BaseModel

@property(copy,nonatomic)NSString *ID;//id
@property(copy,nonatomic)NSString *Value;//值
@property(copy,nonatomic)NSString *Code;//编号
@property(copy,nonatomic)NSString *Name;//名称

@end
