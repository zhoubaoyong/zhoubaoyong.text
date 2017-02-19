//
//  GetsJSONValues.m
//  Synjones
//
//  Created by Liang Haiyan on 13-7-5.
//  Copyright (c) 2013 year Synjones. All rights reserved.
//

#import "GetsJSONValues.h"
//#import "macroDefinition.h"
#import "HttpDataItem.h"
#import "Database.h"
#import "SBJson.h"
#import "BaseModel.h"
#import "CardNoticeModel.h"
#import "ClassUtils.h"
#import "FunctionModel.h"

@implementation GetsJSONValues

//obj为array时调用
+(NSMutableArray *)tranHttpDataToModel:(NSMutableData *)data class:(Class)model{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    NSDictionary *dict = [data JSONValue];
    if (dict && (NSNull *)dict != [NSNull null]) {
        NSDictionary *objDict = [dict objectForKey:@"obj"];
        if ((NSNull *)objDict == [NSNull null]) {
            NSLog(@"obj为空");
        }else{
        if ( objDict ) {
            
            for (NSDictionary *obj in objDict) {
                //从类中循环取参
                BaseModel *baseModel = [ClassUtils getModel:model fromDict:obj];
                [array addObject:baseModel];
            }
            }
        }
    }
    return array;
}

//obj为array时调用 并且插入数据库
+(NSMutableArray *)tranHttpDataToModelAndInsertDB:(NSMutableData *)data class:(Class)model{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    NSDictionary *dict = [data JSONValue];
    if (dict && (NSNull *)dict != [NSNull null]) {
        NSDictionary *objDict = [dict objectForKey:@"obj"];
        if ((NSNull *)objDict == [NSNull null]) {
            NSLog(@"obj为空");
        }else{
            if ( objDict ) {
                Database *base = [[Database alloc] init];
                if ([NSStringFromClass(model) isEqualToString:@"FunctionModel"]) {
                    NSLog(@"功能点更新前清空数据");
                    [base deleteHeadLinesDb:NSStringFromClass(FunctionModel.class)];
                }
                for (NSDictionary *obj in objDict) {
                    //从类中循环取参
                    BaseModel *baseModel = [ClassUtils getModel:model fromDict:obj];
                    //插入数据库
                    [base insertModel:baseModel];
                    [array addObject:baseModel];
                }
                [base closeDatabase];
                [base release];
                 base = nil;
            }
        }
    }
    return array;
}


//从某个字段中取单对象时调用
+(NSMutableArray *)tranHttpDataToModel:(NSMutableData *)data class:(Class)model inStr:(NSString *)messOrObj {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    NSDictionary *dict = [data JSONValue];
    if (dict && (NSNull *)dict != [NSNull null]) {
        NSDictionary *objDict;
        if ((NSNull *)messOrObj != [NSNull null]&&messOrObj.length!=0) {
            objDict = [dict objectForKey:messOrObj];
        }else{
            objDict = dict;
        }
        if ((NSNull *)objDict == [NSNull null]) {
            NSLog(@"obj为空");
        }else{
            if ( objDict ) {
                BaseModel *baseModel = [ClassUtils getModel:model fromDict:objDict];
                [array addObject:baseModel];
                }
            }
        }
    return array;
}

// App id 没用
+ (NSMutableArray *)getsAppIdData:(NSMutableData *)data {

    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    NSDictionary *dict = [data JSONValue];
    NSLog(@"dict:%@",dict);
    if (dict && (NSNull *) dict != [NSNull null]) {
        
        NSArray *infoArray = [dict objectForKey:@"results"];
        if ([infoArray count] > 0) {
            
            NSDictionary *releaseInfo = [infoArray objectAtIndex:0];
            HttpDataItem *item = [[HttpDataItem alloc] init];
            item.obj = [releaseInfo objectForKey:@"version"];               // 获得最新版本号
            item.obj1 = [releaseInfo objectForKey:@"trackViewUrl"];         // 获得最新版本号网址
                        
            [array addObject:item];
            [item release];
        }
    }
    return array;
}
// LoginType 获取登录类型 已处理
+ (NSMutableArray *)getsLoginTypeData:(NSMutableData *)data {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    NSDictionary *dict = [data JSONValue];
    if (dict && (NSNull *) dict != [NSNull null]) {
        NSDictionary *obj = [dict objectForKey:@"obj"];
        for (NSDictionary *name in obj) {
            HttpDataItem *item = [[[HttpDataItem alloc] init] autorelease];
            item.obj = [name objectForKey:@"Code"];
            item.obj1 = [name objectForKey:@"Name"];
            [array addObject:item];
        }
    }
    return array;
}
// login 登录数据，已处理
+ (NSMutableArray *)getsLoginData:(NSMutableData *)data {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    NSDictionary *dict = [data JSONValue];
    NSLog(@"login:%@",dict);
    if (dict && (NSNull *)dict != [NSNull null]) {
        HttpDataItem *item = [[HttpDataItem alloc] init];
        item.obj = [dict objectForKey:@"msg"];         // message
        item.obj1 = [dict objectForKey:@"obj"];        // ??
        item.obj2 = [dict objectForKey:@"success"];    // type
        [array addObject:item];
        [item release];
    }
    return array;
}
// info 基本信息 已处理
+ (NSMutableArray *)getsInfoData:(NSMutableData *)data {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    NSDictionary *dict = [data JSONValue];
    NSLog(@"info:%@",dict[@"msg"]);
    if (dict && (NSNull *)dict != [NSNull null]) {
        NSString *s = [NSString stringWithFormat:@"%@",[dict objectForKey:@"success"]];
        if ([s isEqualToString:@"1"]) {
            NSDictionary *mDict = [dict objectForKey:@"msg"];
            if ((NSNull *)mDict != [NSNull null]) {
                HttpDataItem *item = [[HttpDataItem alloc] init];
                item.obj = [mDict objectForKey:@"bankbalance"];         // 银行卡余额
                item.obj1 = [mDict objectForKey:@"bankno"];             // 银行卡号
                item.obj2 = [mDict objectForKey:@"cardbalance"];        // 校园卡余额
                item.obj3 = [mDict objectForKey:@"cardno"];             // 校园卡号
                item.obj4 = [mDict objectForKey:@"frozen"];             // 冻结状态
                item.obj5 = [mDict objectForKey:@"name"];               // 姓名
                item.obj6 = [mDict objectForKey:@"showbankbalance"];    // 是否显示银行余额
                item.obj7 = [mDict objectForKey:@"sno"];                // 学工号
                item.obj8 = [mDict objectForKey:@"state"];              // 挂失状态
                item.obj9 = [mDict objectForKey:@"tmpbalance"];         // 当前过渡余额
                item.obj10 = [mDict objectForKey:@"pretmpbalance"];     // 上次过渡余额
                item.obj11 = [mDict objectForKey:@"standingname"];      // 身份类型
                item.obj12 = [mDict objectForKey:@"deptname"];          // 部门名称
                [array addObject:item];
                [item release];
            }
        }
    }
    return array;
}
// cardLoss 没用
+ (NSMutableArray *)getsCardLossData:(NSMutableData *)data {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    NSDictionary *dict = [data JSONValue];
    if (dict && (NSNull *)dict != [NSNull null]) {
        HttpDataItem *item = [[HttpDataItem alloc] init];
        item.obj = [dict objectForKey:@"msg"];         // message
        item.obj1 = [dict objectForKey:@"obj"];        // ??
        item.obj2 = [dict objectForKey:@"success"];    // type
        [array addObject:item];
        [item release];
    }
    return array;
}
// EaccInfo 电子账户信息 已处理
+ (NSMutableArray *)getsEaccInfoData:(NSMutableData *)data {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    NSDictionary *dict = [data JSONValue];
    if (dict && (NSNull *)dict != [NSNull null]) {
        NSDictionary *objDict = [dict objectForKey:@"obj"];
        if ( objDict && (NSNull *)objDict != [NSNull null]) {
            for (NSDictionary *obj in objDict) {
                HttpDataItem *item = [[[HttpDataItem alloc] init] autorelease];
                item.obj = [obj objectForKey:@"IsBanlace"];
                item.obj1 = [obj objectForKey:@"IsCardMoney"];
                item.obj2 = [obj objectForKey:@"IsDisable"];
                item.obj3 = [obj objectForKey:@"IsGood"];
                item.obj4 = [obj objectForKey:@"IsLock"];
                item.obj5 = [obj objectForKey:@"IsSpecial"];
                item.obj6 = [obj objectForKey:@"accamt"];              // 账户余额
                item.obj7 = [obj objectForKey:@"accinfo_flag"];
                item.obj8 = [obj objectForKey:@"account"];             // 账号
                item.obj9 = [obj objectForKey:@"acctype"];             // 电子账户类型
                item.obj10 = [obj objectForKey:@"acctype_flag"];
                item.obj11 = [obj objectForKey:@"createdatetime"];
                item.obj12 = [obj objectForKey:@"name"];               // 账户名称
                [array addObject:item];
            }
        }
    }
    return array;
}
// BankTransfer 没用
+ (NSMutableArray *)getsBankTransferData:(NSMutableData *)data {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    NSDictionary *dict = [data JSONValue];
    if (dict && (NSNull *)dict != [NSNull null]) {
        HttpDataItem *item = [[HttpDataItem alloc] init];
        item.obj = [dict objectForKey:@"msg"];
        item.obj1 = [dict objectForKey:@"obj"];     
        item.obj2 = [dict objectForKey:@"success"];
        [array addObject:item];
        [item release];
    }
    return array;
}
// Aweek & History －－－－－－－－－－已处理－－－－－－－－－－－－－－－－
+ (NSMutableArray *)getsAweekAndHistoryData:(NSMutableData *)data {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    NSDictionary *dict = [data JSONValue];
    if (dict && (NSNull *)dict != [NSNull null]) {
        NSDictionary *obj = [dict objectForKey:@"obj"];
        if (obj && (NSNull *)obj != [NSNull null]) {
            for (NSDictionary *objDict in obj) {
                HttpDataItem *item = [[HttpDataItem alloc] init];
                item.obj = [objDict objectForKey:@"AccAmt"];                   // 电子账户余额
                item.obj1 = [objDict objectForKey:@"AccTypeName"];             // 电子账户名称
                item.obj2 = [objDict objectForKey:@"Account"];                 // 一卡通号
                item.obj3 = [objDict objectForKey:@"CardBalance"];             // 卡内余额
                item.obj4 = [objDict objectForKey:@"ConsumeType"];             // 交易类型
                item.obj5 = [objDict objectForKey:@"EffectDate"];
                item.obj6 = [objDict objectForKey:@"FromJnNumber"];
                item.obj7 = [objDict objectForKey:@"JnDateTime"];              // 交易时间
                item.obj8 = [objDict objectForKey:@"PosCode"];                 // Pos号
                item.obj9 = [objDict objectForKey:@"MercAccount"];             // 商户编号
                item.obj10 = [objDict objectForKey:@"MercName"];               // 商户名称
                item.obj11 = [objDict objectForKey:@"SysCode"];                // 交易子系统编号
                item.obj12 = [objDict objectForKey:@"SysName"];                // 交易子系统名称
                item.obj13 = [objDict objectForKey:@"TranAmt"];                // 交易金额
                item.obj14 = [objDict objectForKey:@"TranName"];               // 交易名称
                [array addObject:item];
                [item release]; 
            }
        }
    }
    return array;
}
// get UI  已处理
+ (NSMutableArray *)getsUIData:(NSMutableData *)data {
    
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    NSDictionary *dict = [data JSONValue];
    NSLog(@"dict:%@",dict);
    if (dict && (NSNull *)dict != [NSNull null]) {
        
        NSDictionary *obj = [dict objectForKey:@"obj"];
        
        if (obj && (NSNull *)obj != [NSNull null]) {
            
            // database save UI data
            Database *base = [[Database alloc] init];
            [base deleteHeadLinesDb:UI];
            
            for (NSDictionary *objDict in obj) {
                HttpDataItem *objItem = [[[HttpDataItem alloc] init] autorelease];
                objItem.obj = [objDict objectForKey:@"Code"];
                objItem.obj2 = [objDict objectForKey:@"ID"];
                objItem.obj3 = [objDict objectForKey:@"IconName"];
                objItem.obj4 = [objDict objectForKey:@"IsDisplay"];
                objItem.obj5 = [objDict objectForKey:@"IsEnable"];
                objItem.obj6 = [objDict objectForKey:@"IsNeedLogin"];
                objItem.obj7 = [objDict objectForKey:@"Name"];
                objItem.obj8 = [objDict objectForKey:@"Order"];
                objItem.obj9 = [objDict objectForKey:@"ParentID"];
                objItem.obj10 = [objDict objectForKey:@"StartContext"];
                objItem.obj11 = [objDict objectForKey:@"IsNeedPermission"];
                objItem.obj12 = [objDict objectForKey:@"Paras"];
                
//                NSLog(@"name:%@",objItem.obj7);
//                NSLog(@"code:%@",objItem.obj);
//                NSLog(@"imageName:%@",objItem.obj3);
                
                // 保存新的是否需要更新的值
                objItem.obj13 = [[NSUserDefaults standardUserDefaults] objectForKey:@"downLoadTime"];
                
                [array addObject:objItem];
            }
            [base insertArray:array dataBase:UI];
            [base release];
        }
    }
    return array;
}
// CardType  通知类型 已处理
+ (NSMutableArray *)getsCardTypeData:(NSMutableData *)data {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    NSDictionary *dict = [data JSONValue];
    if (dict && (NSNull *)dict != [NSNull null]) {
        NSDictionary *obj = [dict objectForKey:@"obj"];
        if (obj && (NSNull *)obj != [NSNull null]) {
            for (NSDictionary *objDict in obj) {
                HttpDataItem *item = [[HttpDataItem alloc] init];
                item.obj = [objDict objectForKey:@"Code"];
                item.obj1 = [objDict objectForKey:@"Name"];
                
                [array addObject:item];
                [item release];
            }
        }
    }
    return array;
}
// PayTypeList 没用
+ (NSMutableArray *)getsPayTypeListData:(NSMutableData *)data {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    NSDictionary *dict = [data JSONValue];
    if (dict && (NSNull *)dict != [NSNull null]) {
        NSDictionary *obj = [dict objectForKey:@"obj"];
        for (NSDictionary *objDict in obj) {
            HttpDataItem *item = [[HttpDataItem alloc] init];
            item.obj = [objDict objectForKey:@"Code"];
            item.obj1 = [objDict objectForKey:@"Name"];
            [array addObject:item];
            [item release];
        }
    }
    return array;
}
// CardTypeNum 已处理 一卡通通知
+ (NSMutableArray *)getsCardTypeNumData:(NSMutableData *)data {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    NSDictionary *dict = [data JSONValue];
    if (dict && (NSNull *)dict != [NSNull null]) {
        NSDictionary *obj = [dict objectForKey:@"obj"];
        if (obj && (NSNull *)obj != [NSNull null]) {
            for (NSDictionary *objDict in obj) {
                HttpDataItem *item = [[HttpDataItem alloc] init];
                item.obj = [objDict objectForKey:@"BZ"];            // 标题
                item.obj1 = [objDict objectForKey:@"CJSJ"];         // 创建时间
                item.obj2 = [objDict objectForKey:@"FBJG"];         // 发布机构
                item.obj3 = [objDict objectForKey:@"FBXXID"];       // 访问次数
                item.obj4 = [objDict objectForKey:@"FBZ"];          // 发布者
                item.obj5 = [objDict objectForKey:@"FWCS"];
                item.obj6 = [objDict objectForKey:@"NR"];           // 发布信息
                [array addObject:item];
                [item release];
            }
        }
    }
    return array;
}
// NFixCardList 已处理 拾卡信息
+ (NSMutableArray *)getsNFixCardListData:(NSMutableData *)data {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    NSDictionary *dict = [data JSONValue];
    if (dict && (NSNull *)dict != [NSNull null]) {
        NSDictionary *obj = [dict objectForKey:@"obj"];
        if (obj && (NSNull *)obj != [NSNull null]) {
            for (NSDictionary *objDict in obj) {
                HttpDataItem *item = [[HttpDataItem alloc] init];
                item.obj = [objDict objectForKey:@"Addr"];
                item.obj1 = [objDict objectForKey:@"DATETIME"];
                item.obj2 = [objDict objectForKey:@"Email"];
                item.obj3 = [objDict objectForKey:@"FromCardID"];
                item.obj4 = [objDict objectForKey:@"FromName"];
                item.obj5 = [objDict objectForKey:@"Sno"];
                item.obj6 = [objDict objectForKey:@"Tel"];
                item.obj7 = [objDict objectForKey:@"ToIDNo"];
                item.obj8 = [objDict objectForKey:@"ToName"];
                [array addObject:item];
                [item release];
            }
        }
    }
    return array;
}
// AllSubsidyTrjn 已处理 补助流水
+ (NSMutableArray *)getsAllSubsidyTrjnData:(NSMutableData *)data {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    NSDictionary *dict = [data JSONValue];
    if (dict && (NSNull *)dict != [NSNull null]) {
        NSDictionary *obj = [dict objectForKey:@"obj"];
        if (obj && (NSNull *)obj != [NSNull null]) {
            for (NSDictionary *objDict in obj) {
                HttpDataItem *item = [[HttpDataItem alloc] init];
                item.obj = [objDict objectForKey:@"AccType"];
                item.obj1 = [objDict objectForKey:@"FromAccount"];          //  补助账号
                item.obj2 = [objDict objectForKey:@"JndateTime"];           //  时间                
                item.obj3 = [objDict objectForKey:@"SchCode"];              
                item.obj4 = [objDict objectForKey:@"SubAmt"];               //  金额（整数、分）
                item.obj5 = [objDict objectForKey:@"SubType"];              //  补助类型
                item.obj6 = [objDict objectForKey:@"Subjnstatus"];
                item.obj7 = [objDict objectForKey:@"SysCode"];              //  子系统代码
                item.obj8 = [objDict objectForKey:@"SysName"];              //  子系统名称
                item.obj9 = [objDict objectForKey:@"ToAccount"];
                item.obj10 = [objDict objectForKey:@"TranCode"];            //  交易代码
                item.obj11 = [objDict objectForKey:@"TranName"];            //  交易名称
                [array addObject:item];
                [item release];
            }
        }
    }
    return array;
}
// Contents 常见问题 已处理
+ (NSMutableArray *)getsContentsData:(NSMutableData *)data {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    NSDictionary *dict = [data JSONValue];
    
    if (dict && (NSNull *)dict != [NSNull null]) {
        NSDictionary *obj = [dict objectForKey:@"obj"];
        if (obj && (NSNull *)obj != [NSNull null]) {
            for (NSDictionary *objDict in obj) {
                HttpDataItem *item = [[HttpDataItem alloc] init];
                item.obj = [objDict objectForKey:@"ContentCategoryID"];
                item.obj1 = [objDict objectForKey:@"Context"];       
                item.obj2 = [objDict objectForKey:@"CreateTime"];        
                if ((NSNull *)[objDict objectForKey:@"DepartmentName"] == [NSNull null]) {
                    item.obj3 = @"";
                }
                else {
                    item.obj3 = [objDict objectForKey:@"DepartmentName"];
                }
                    
                item.obj4 = [objDict objectForKey:@"FireTime"];            
                item.obj5 = [objDict objectForKey:@"ID"];           
                item.obj6 = [objDict objectForKey:@"KeyWord"];
                item.obj7 = [objDict objectForKey:@"Name"];           
                item.obj8 = [objDict objectForKey:@"OverTime"];           
                item.obj9 = [objDict objectForKey:@"PicAddr"];
                item.obj10 = [objDict objectForKey:@"Title"];         
                item.obj11 = [objDict objectForKey:@"SenderID"];
                item.obj12 = [objDict objectForKey:@"SenderName"];
//                item.obj13 = [objDict objectForKey:@"Status"];
                item.obj13 = @"0";
                item.obj14 = [objDict objectForKey:@"StrCreateTime"];
                [array addObject:item];
                [item release];
            }
        }
    }
    return array;
}
// SchoolInfo 学校信息 已处理
+ (NSMutableArray *)getsSchoolInfoData:(NSMutableData *)data {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    NSDictionary *dict = [data JSONValue];
    if (dict && (NSNull *)dict != [NSNull null]) {
        NSDictionary *obj = [dict objectForKey:@"obj"];
        if (obj && (NSNull *)obj != [NSNull null]) {
                HttpDataItem *item = [[HttpDataItem alloc] init];
                item.obj = [obj objectForKey:@"CreateTime"];
                item.obj1 = [obj objectForKey:@"EntityType"];
                item.obj2 = [obj objectForKey:@"ID"];
                item.obj3 = [obj objectForKey:@"LogoName"];         // 学校图片地址
                item.obj4 = [obj objectForKey:@"Name"];             // 学校名称
                item.obj5 = [obj objectForKey:@"Remark"];
                item.obj6 = [obj objectForKey:@"SchoolCode"];       // 校区编码
                item.obj7 = [obj objectForKey:@"SchoolName"];       // 校区名称
                item.obj8 = [obj objectForKey:@"ServerIp"];
                item.obj9 = [obj objectForKey:@"ValidMessage"];
                [array addObject:item];
                [item release];
        }
    }
    return array;
}
// MFTrjns 免费米饭，暂不处理
+ (NSMutableArray *)getsMFTrjnsData:(NSMutableData *)data {
    
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    NSDictionary *dict = [data JSONValue];
    NSLog(@"dict:%@",dict);
    if (dict && (NSNull *)dict != [NSNull null]) {
        NSDictionary *objDict = [dict objectForKey:@"obj"];
        if (objDict && (NSNull *)objDict != [NSNull null]) {
            for (NSDictionary *obj in objDict) {
                HttpDataItem *item = [[HttpDataItem alloc] init];
                item.obj = [obj objectForKey:@"AccAmt"];
                item.obj1 = [obj objectForKey:@"AccTypeName"];
                item.obj2 = [obj objectForKey:@"Account"];
                item.obj3 = [obj objectForKey:@"CardBalance"];         
                item.obj4 = [obj objectForKey:@"ConsumeType"];
                item.obj5 = [obj objectForKey:@"EffectDate"];
                item.obj6 = [obj objectForKey:@"FromJnNumber"];

#if 0
                NSString *jnDateTime = [obj objectForKey:@"JnDateTime"];
                NSString *logicDate = [obj objectForKey:@"LogicDate"];
                if ([logicDate length] >= 8 && [jnDateTime length] >= 6) {
                    item.obj8 = [NSString stringWithFormat:@"%@-%@-%@ %@:%@:%@",[logicDate substringWithRange:NSMakeRange(0, 4)],[logicDate substringWithRange:NSMakeRange(4, 2)],[logicDate substringWithRange:NSMakeRange(6, 2)],[jnDateTime substringWithRange:NSMakeRange(0, 2)],[jnDateTime substringWithRange:NSMakeRange(2, 2)],[jnDateTime substringWithRange:NSMakeRange(4, 2)]];
                }
#endif
                item.obj7 = [obj objectForKey:@"JnDateTime"];
                item.obj8 = [obj objectForKey:@"JnDateTime"];
                item.obj9 = [obj objectForKey:@"MercAccount"];
                item.obj10 = [obj objectForKey:@"MercName"];
                item.obj11 = [obj objectForKey:@"PosCode"];
                item.obj12 = [obj objectForKey:@"SysCode"];
                item.obj13 = [obj objectForKey:@"SysName"];
                item.obj14 = [obj objectForKey:@"TranAmt"];      
                [array addObject:item];
                [item release];
            }
        }
    }
    return array;
}
// NetFeeType 网费 已处理
+ (NSMutableArray *)getsNetFeeTypeData:(NSMutableData *)data {
   NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    NSDictionary *dict = [data JSONValue];
    if (dict && (NSNull *)dict != [NSNull null]) {
        NSDictionary *obj = [dict objectForKey:@"obj"];
        if (obj && (NSNull *)obj != [NSNull null]) {
            for (NSDictionary *objDict in obj) {
                HttpDataItem *item = [[HttpDataItem alloc] init];
                item.obj = [objDict objectForKey:@"Code"];                  // 缴费类型代码
                item.obj1 = [objDict objectForKey:@"CreateTime"];
                item.obj2 = [objDict objectForKey:@"EntityType"];
                item.obj3 = [objDict objectForKey:@"ID"];
                item.obj4 = [objDict objectForKey:@"LookupType"];
                item.obj5 = [objDict objectForKey:@"Name"];                 // 缴费类型名称
                item.obj6 = [[objDict objectForKey:@"Spliter"] objectForKey:@"SplitChar"];
                item.obj7 = [objDict objectForKey:@"ValidMessage"];
                item.obj8 = [objDict objectForKey:@"Value"];
                [array addObject:item];
                [item release];
            }
        }
    }
    return array;
}
// XiaoQu / buildNum 未用
+ (NSMutableArray *)getsXiaoQuData:(NSMutableData *)data {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    NSDictionary *dict = [data JSONValue];
    if (dict && (NSNull *)dict != [NSNull null]) {
        NSDictionary *obj = [dict objectForKey:@"obj"];
        if (obj && (NSNull *)obj != [NSNull null]) {
            for (NSDictionary *objDict in obj) {
                HttpDataItem *item = [[HttpDataItem alloc] init];
                item.obj = [objDict objectForKey:@"Name"];                  // 校区名称 / 楼号名称
                item.obj1 = [objDict objectForKey:@"Value"];                // 校区值   / 楼号值
                [array addObject:item];
                [item release];
            }
        }
    }
    return array;
}
// OrderList 缴费记录 已处理
+ (NSMutableArray *)getsOrderListData:(NSMutableData *)data {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    NSDictionary *dict = [data JSONValue];    
    if (dict && (NSNull *)dict != [NSNull null]) {
        NSDictionary *obj = [dict objectForKey:@"obj"];
        if (obj && (NSNull *)obj != [NSNull null]) {
            for (NSDictionary *objDict in obj) {
                HttpDataItem *item = [[HttpDataItem alloc] init];
                item.obj = [objDict objectForKey:@"Amount"];
                item.obj1 = [objDict objectForKey:@"Code"];
                item.obj2 = [objDict objectForKey:@"CreateTime"];
                item.obj3 = [objDict objectForKey:@"FeeState"];
                item.obj4 = [objDict objectForKey:@"NameMemo"];
                item.obj5 = [objDict objectForKey:@"PayState"];
                item.obj6 = [objDict objectForKey:@"SN"];
                item.obj7 = [objDict objectForKey:@"StrCreateTime"];
                [array addObject:item];
                [item release];
            }
        }
    }
    return array;
}
// ReceiveList & SendList & MesList & GetContent 消息列表 已处理
+ (NSMutableArray *)getsReceiveListData:(NSMutableData *)data {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    NSDictionary *dict = [data JSONValue];
    if (dict && (NSNull *)dict != [NSNull null]) {
        NSDictionary *obj = [dict objectForKey:@"obj"];
        if (obj && (NSNull *)obj != [NSNull null]) {
            for (NSDictionary *objDict in obj) {
                HttpDataItem *item = [[HttpDataItem alloc] init];
                item.obj = [objDict objectForKey:@"ContentCategoryID"];
                item.obj1 = [objDict objectForKey:@"ContentIsRead"];
                item.obj2 = [objDict objectForKey:@"Context"];
                item.obj3 = [objDict objectForKey:@"DepartmentName"];
                item.obj4 = [objDict objectForKey:@"ID"];
                
                item.dict = [objDict objectForKey:@"Receivers"];
                
                item.obj5 = [objDict objectForKey:@"SenderID"];
                item.obj6 = [objDict objectForKey:@"SenderName"];
                item.obj7 = [objDict objectForKey:@"Status"];
                item.obj8 = [objDict objectForKey:@"StrCreateTime"];
                item.obj9 = [objDict objectForKey:@"Title"];
                
                item.obj10 = @"0";                                      // 0代表未读,1代表已读
                item.obj11 = @"0";                                      // 0代表勾选按钮未选中,1代表选中
                [array addObject:item];
                [item release];
            }
        }
    }
    return array;
}
// RecByContent 未使用
+ (NSMutableArray *)getsRecByContentData:(NSMutableData *)data {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    NSDictionary *dict = [data JSONValue];
    if (dict && (NSNull *)dict != [NSNull null]) {
        NSDictionary *obj = [dict objectForKey:@"obj"];
        if (obj && (NSNull *)obj != [NSNull null]) {
            for (NSDictionary *objDict in obj) {
                HttpDataItem *item = [[HttpDataItem alloc] init];
                item.obj = [objDict objectForKey:@"ContentID"];
                item.obj1 = [objDict objectForKey:@"ID"];
                item.obj2 = [objDict objectForKey:@"IsRead"];
                item.obj3 = [objDict objectForKey:@"Name"];
                item.obj4 = [objDict objectForKey:@"StrCreateTime"];
                item.obj5 = [objDict objectForKey:@"SenderID"];
                item.obj6 = [objDict objectForKey:@"UserID"];
                
                [array addObject:item];
                [item release];
            }
        }
    }
    return array;
}
// CopyrightContact 关于我们 版本所有－联系电话  已处理
+ (NSMutableArray *)getsCopyrightContactData:(NSMutableData *)data {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    NSDictionary *dict = [data JSONValue];
    if (dict && (NSNull *)dict != [NSNull null] && dict) {
        NSDictionary *obj = [dict objectForKey:@"obj"];
        if (obj && (NSNull *)obj != [NSNull null]) {
            for (NSDictionary *objDict in obj) {
                HttpDataItem *item = [[HttpDataItem alloc] init];
                item.obj = [objDict objectForKey:@"Code"];
                item.obj1 = [objDict objectForKey:@"ID"];
                item.obj2 = [objDict objectForKey:@"Name"];
                item.obj3 = [objDict objectForKey:@"Value"];
                [array addObject:item];
                [item release];
            }
        }
    }
    return array;
}
// LatestUpgrade 未使用
+ (NSMutableArray *)getsLatestUpgradeData:(NSMutableData *)data {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    NSDictionary *dict = [data JSONValue];
    if (dict && (NSNull *)dict != [NSNull null] && dict) {
        NSDictionary *obj = [dict objectForKey:@"obj"];
        if (obj && (NSNull *)obj != [NSNull null]) {
            HttpDataItem *item = [[HttpDataItem alloc] init];
            item.obj = [obj objectForKey:@"CreateTime"];
            item.obj1 = [obj objectForKey:@"DownLoadTime"];       // 功能点版本
            item.obj2 = [obj objectForKey:@"EntityType"];
            item.obj3 = [obj objectForKey:@"FunVesion"];
            item.obj4 = [obj objectForKey:@"ID"];
            item.obj5 = [obj objectForKey:@"IsMustUpgrade"];
            item.obj6 = [obj objectForKey:@"Name"];
            item.obj7 = [obj objectForKey:@"Remark"];
            item.obj8 = [obj objectForKey:@"SchoolCode"];
            item.obj9 = [obj objectForKey:@"ID"];
            item.obj10 = [obj objectForKey:@"ServerUrl"];
            item.obj11 = [obj objectForKey:@"Size"];
            item.obj12 = [obj objectForKey:@"ValidMessage"];
            item.obj13 = [obj objectForKey:@"Vesion"];
            [array addObject:item];
            [item release];
        }
    }
    return array;
}

// HisTotal 历史统计 已处理
+ (NSMutableArray *)getsHisTotalData:(NSMutableData *)data {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    NSDictionary *dict = [data JSONValue];    
    if (dict && (NSNull *)dict != [NSNull null]) {
        
        NSDictionary *obj = [dict objectForKey:@"obj"];
        NSString *objStr = [NSString stringWithFormat:@"%@",[dict objectForKey:@"obj"]];
        if ((NSNull *)obj != [NSNull null] && dict && [objStr length] != 0) {
            HttpDataItem *item = [[HttpDataItem alloc] init];
            item.obj = [obj objectForKey:@"DownLoadTime"];
            item.obj1 = [obj objectForKey:@"FailAmount"];
            item.obj2 = [obj objectForKey:@"FailCount"];
            item.obj3 = [obj objectForKey:@"NewAddUser"];
            item.obj4 = [obj objectForKey:@"SucceedAmount"];
            item.obj5 = [obj objectForKey:@"SucceedCount"];
            item.obj6 = [obj objectForKey:@"UserCount"];
            [array addObject:item];
            [item release];
        }
    }
    return array;
}

//ClickApp 功能访问量 已处理
+ (NSMutableArray *)getsClickAppData:(NSMutableData *)data {
    
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    NSDictionary *dict = [data JSONValue];
    if (dict && (NSNull *)dict != [NSNull null] && dict) {
        
        NSDictionary *obj = [dict objectForKey:@"obj"];
        NSString *objStr = [NSString stringWithFormat:@"%@",[dict objectForKey:@"obj"]];
        
        if (obj && (NSNull *)obj != [NSNull null] && [objStr length] != 0) {
            
            for (NSDictionary *objDict in obj) {
                HttpDataItem *item = [[HttpDataItem alloc] init];
                item.obj = [objDict objectForKey:@"Area"];
                item.obj1 = [objDict objectForKey:@"Code"];
                item.obj2 = [objDict objectForKey:@"Count"];
                item.obj3 = [objDict objectForKey:@"Name"];
                
                [array addObject:item];
                [item release];
            }
        }
    }
    return array;
}
+ (NSArray *)TransferInfoData:(NSMutableData *)data {
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
    NSLog(@"dict:%@",dict);
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    if (dict) {
        NSDictionary *obj = dict[@"obj"];
        if (obj) {
            HttpDataItem *item = [[HttpDataItem alloc] init];
            item.obj  = obj[@"isNeedBankNo"];                   // 是否需要输入银行卡号
            item.obj1 = obj[@"isNeedBankPwd"];                  // 是否需要输入银行卡密码
            item.obj2 = obj[@"limit"];                          // 最大转账金额
            [array addObject:item];
            [item release];
        }
    }
    return array;
}

@end








