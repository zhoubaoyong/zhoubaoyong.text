//
//  CardNoticeModel.h
//  SynjonesCommon
//
//  Created by wdh on 14-7-18.
//  Copyright (c) 2014年 synjones. All rights reserved.
//

//"FBXXID":"9","BZ":"测试通知9","NR":"测试测试测试9","CJSJ":"2014-7-18","FBZ":"信息化办公室","FBJG":"信息化办公室9","FWCS":"测试策划9","Attachs":null}

#import <Foundation/Foundation.h>
#import "BaseModel.h"

@interface CardNoticeModel : BaseModel{

}

@property(copy,nonatomic)NSString *FBXXID;//id
@property(copy,nonatomic)NSString *BZ;//备注
@property(copy,nonatomic)NSString *NR;//内容
@property(copy,nonatomic)NSString *CJSJ;//发布时间
@property(copy,nonatomic)NSString *FBZ;//发布者
@property(copy,nonatomic)NSString *FBJG;//发布机构
@property(copy,nonatomic)NSString *FWCS;//访问次数
@property(copy,nonatomic)NSString *Attachs;//
@property(copy,nonatomic)NSString *ISCLICKED;//已点击

@end