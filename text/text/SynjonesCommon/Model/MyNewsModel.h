//
//  MyNewsModel.h
//  SynjonesCommon
//
//  Created by wdh on 14-8-1.
//  Copyright (c) 2014年 synjones. All rights reserved.
//{"ID":48,"CreateTime":"\/Date(1403074208590)\/","StrCreateTime":"2014-06-18 14:50","Title":"1212","Context":"121212","ContentCategoryID":7,"SenderID":1,"SenderName":"管理员","DepartmentName":"","Status":1,"SendWay":"","OutSideUrl":null,"Receivers":[{"ID":8,"Name":"测试11","CreateTime":"\/Date(1403074208653)\/","StrCreateTime":"2014-06-18 14:50","ContentID":48,"UserID":4,"IsSend":false,"IsRead":true},{"ID":9,"Name":"管理员","CreateTime":"\/Date(1403074208683)\/","StrCreateTime":"2014-06-18 14:50","ContentID":48,"UserID":1,"IsSend":false,"IsRead":true}],"ContentIsRead":true}


#import <Foundation/Foundation.h>
#import "BaseModel.h"
@interface MyNewsModel : BaseModel

@property(copy,nonatomic)NSString *ID;//id
@property(copy,nonatomic)NSString *CreateTime;//时间
@property(copy,nonatomic)NSString *StrCreateTime;//时间
@property(copy,nonatomic)NSString *Title;//标题
@property(copy,nonatomic)NSString *Context;//内容
@property(copy,nonatomic)NSString *ContentCategoryID;//内容类别id
@property(copy,nonatomic)NSString *SenderID;//发送者id
@property(copy,nonatomic)NSString *SenderName;//发送人
@property(copy,nonatomic)NSString *Status;//状态
@property(copy,nonatomic)NSString *DepartmentName;//部门
@property(copy,nonatomic)NSString *SendWay;//方式
@property(copy,nonatomic)NSString *OutSideUrl;//外url
@property(copy,nonatomic)NSDictionary *Receivers;//接受者
@property(copy,nonatomic)NSString *ContentIsRead;//是否已读
@property(copy,nonatomic)NSString *IsReaded;
@property(copy,nonatomic)NSString *IsChecked;


@end
