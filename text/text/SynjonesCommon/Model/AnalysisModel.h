//
//  AnalysisModel.h
//  SynjonesCommon
//
//  Created by wdh on 14-8-1.
//  Copyright (c) 2014年 synjones. All rights reserved.
//{"Area":null,"Code":null,"Count":126,"Name":"补助流水查询"},

#import <Foundation/Foundation.h>
#import "BaseModel.h"
@interface AnalysisModel : BaseModel

@property(copy,nonatomic)NSString *Area;//
@property(copy,nonatomic)NSString *Code;//
@property(copy,nonatomic)NSString *Count;//数值
@property(copy,nonatomic)NSString *Name;//名称

@end
