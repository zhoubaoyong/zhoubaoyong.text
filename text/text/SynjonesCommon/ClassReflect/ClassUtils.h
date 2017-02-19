//
//  ClassUtils.h
//  SynjonesCommon
//
//  Created by wdh on 14-7-30.
//  Copyright (c) 2014年 synjones. All rights reserved.
// 反射操作工具类

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import "BaseModel.h"
#import "FMResultSet.h"

@interface ClassUtils : NSObject

//获取类中的参数列表
+ (NSArray *)getClassProperties:(Class)model;

//从字典转对象
+ (BaseModel *)getModel:(Class)model fromDict:(NSDictionary *)obj;

//从ResultSet转对象
+ (BaseModel *)getModel:(Class)model fromResult:(FMResultSet *)obj;


//根据对象生成创建表语句
+(NSString *)getCreateTableSql:(Class)model;

//根据对象生成插入语句
+(NSString *)getInsertModelSql:(BaseModel *)model;

//根据对象生成查询语句
+(NSString *)getQueryModelSql:(Class)model startAt:(NSInteger)start count:(NSInteger)count;

//查询后转对象
+(BaseModel *)getModel:(Class)model sql:(NSString *)sql;

//查询后转列表
+(NSArray *)getArray:(Class)model sql:(NSString *)sql;

@end
