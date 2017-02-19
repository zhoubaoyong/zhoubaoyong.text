//
//  SchoolInfoModel.h
//  SynjonesCommon
//
//  Created by wdh on 14-7-29.
//  Copyright (c) 2014年 synjones. All rights reserved.
//
//{"SchoolName":"新中新大学","ServerIp":"www.synedu.net","Port":8070,"Remark":"1232131","LogoName":"/Files/Logo/tongji.png","IsEnable":true,"SchoolCode":"ALL","ID":1,"Name":"新中新大学","EntityType":"Synjones.Mobile.Models.School","CreateTime":"\/Date(1405475204800)\/","ValidMessage":null}

#import <Foundation/Foundation.h>
#import "BaseModel.h"

@interface SchoolInfoModel : BaseModel


@property(copy,nonatomic)NSString *SchoolName;//学校名称
@property(copy,nonatomic)NSString *ServerIp;//ip
@property(copy,nonatomic)NSString *Port;//端口
@property(copy,nonatomic)NSString *Remark;//备注
@property(copy,nonatomic)NSString *LogoName;//logo名
@property(copy,nonatomic)NSString *IsEnable;//是否可用
@property(copy,nonatomic)NSString *SchoolCode;//发送人id
@property(copy,nonatomic)NSString *ID;//id
@property(copy,nonatomic)NSString *Name;//显示名称
@property(copy,nonatomic)NSString *EntityType;//实体类
@property(copy,nonatomic)NSString *CreateTime;//创建时间
@property(copy,nonatomic)NSString *Date;//日期
@property(copy,nonatomic)NSString *ValidMessage;//可用信息


@end
