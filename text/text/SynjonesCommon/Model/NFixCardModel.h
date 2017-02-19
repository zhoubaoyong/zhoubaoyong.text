//
//  NFixCardModel.h
//  SynjonesCommon
//
//  Created by wdh on 14-7-21.
//  Copyright (c) 2014年 synjones. All rights reserved.
//
//{"FromCardID":"000000","FromName":"测试0","ToIDNo":"00010","ToName":null,
//"DATETIME":"2014-07-24","Tel":"13645576345","Email":"hao123@qq.com","Addr":"海淀区第0号","Sno":"0000230"}

#import <Foundation/Foundation.h>
#import "BaseModel.h"


@interface NFixCardModel : BaseModel{
    
}

@property(copy,nonatomic)NSString *FromCardID;//id
@property(copy,nonatomic)NSString *FromName;//失卡人姓名
@property(copy,nonatomic)NSString *ToIDNo;//捡卡人学号
@property(copy,nonatomic)NSString *ToName;//捡卡人姓名
@property(copy,nonatomic)NSString *DATETIME;//时间
@property(copy,nonatomic)NSString *Tel;//电话
@property(copy,nonatomic)NSString *Email;//邮箱
@property(copy,nonatomic)NSString *Addr;//地址
@property(copy,nonatomic)NSString *Sno;//失卡人学号

@end