//
//  CardMessageModel.h
//  SynjonesCommon
//
//  Created by wdh on 14-8-4.
//  Copyright (c) 2014年 synjones. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"

@interface CardMessageModel : BaseModel

@property(copy,nonatomic)NSString *Context;//卡消息正文
@property(copy,nonatomic)NSString *Title;//卡消息标题
@property(copy,nonatomic)NSString *Type;//卡消息类别
@property(copy,nonatomic)NSString *Flag;//卡消息标识
@property(copy,nonatomic)NSString *ID;//消息id
@property(copy,nonatomic)NSString *Sno;//学工号
//隐患  都是当前时间
//                    item.obj4 = morelocationString;                 // 时间
//                    item.obj5 = obj5;                               // 唯一标识

@end
