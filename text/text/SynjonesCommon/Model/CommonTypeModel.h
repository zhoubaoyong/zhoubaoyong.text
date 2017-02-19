//
//  CommonTypeModel.h
//  SynjonesCommon
//
//  Created by wdh on 14-8-1.
//  Copyright (c) 2014年 synjones. All rights reserved.
//{"ID":1,"Value":"0","Code":"NetFeeTest","Name":"测试缴费"}
//{"ID":23,"Value":"哈尔滨新中新电子股份有限公司","Code":"Copyright","Name":"版权所有"},

#import <Foundation/Foundation.h>
#import "BaseModel.h"
@interface CommonTypeModel : BaseModel

@property(copy,nonatomic)NSString *ID;//id
@property(copy,nonatomic)NSString *Value;//值
@property(copy,nonatomic)NSString *Code;//代码
@property(copy,nonatomic)NSString *Name;//名称

@end
