//
//  Base64.h
//  Synjones
//
//  Created by Liang Haiyan on 13-5-14.
//  Copyright (c) 2013 year Synjones. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataBaseSQL.h"
#import "FMDatabase.h"
#import "BaseModel.h"
#import "ClassUtils.h"
//最终目标，弃用dataBaseSQL.h，完全使用对象处理

@interface Database : NSObject
{
    //第三方数据库操作类
    FMDatabase *HeadLinesDb;
}
//创建表
- (BOOL)createTableByModel:(Class)aClass;

//插入对象
- (BOOL)insertModel:(BaseModel *)model;

//查询列表
-(NSMutableArray *)queryModel:(Class)aClass start:(NSInteger)start count:(NSInteger)count;

//查询对象根据某种属性－－根据一个dic或者就是当前对象（只有某个值，根据这些值查询是否存在，存在返回当前对象在数据库中对应的全值对象）






- (id)init;
+ (Database *)shareddatabase;

// 获得指定名称的文件的全路径
+ (NSString *)filePath:(NSString *)fileName;

// 创建数据库
- (void)createDatabase;

// 插入数据表table多条记录 弃用,方法可以用来处理特殊情况数据
- (void)insertArray:(NSMutableArray *)array dataBase:(NSString *)table;

- (BOOL)isExistItem:(NSMutableArray *)array dataBase:(NSString *)table;

// 查询当前有多少条记录在table数据表中
- (NSInteger)itemCount:(NSString *)table;

// 读取数据表table从start条记录开始的count条记录
- (NSMutableArray *)readItem:(NSInteger)start count:(NSInteger)count dataBase:(NSString *)table;

// 删除数据表table内容
- (void)deleteHeadLinesDb:(NSString *)table;

// 删除数据表table里指定键值name的内容
- (void)deleteHeadLinesDb:(NSString *)table whereName:(NSString *)name;

// 删除整个数据库
- (void)deleteDataBase;

// 关闭数据库
- (void)closeDatabase;

@end
