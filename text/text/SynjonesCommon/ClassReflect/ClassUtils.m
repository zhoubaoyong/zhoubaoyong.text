//
//  ClassUtils.m
//  SynjonesCommon
//
//  Created by wdh on 14-7-30.
//  Copyright (c) 2014年 synjones. All rights reserved.
//

#import "ClassUtils.h"

@implementation ClassUtils

//获取类中的参数列表
+(NSArray *)getClassProperties:(Class)model{
    //必须使用runtime.h
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList(model, &outCount);
    NSMutableArray *keys = [[NSMutableArray alloc] initWithCapacity:outCount];
    for (i = 0; i < outCount; i++) {
        objc_property_t property = properties[i];
        NSString *propertyName = [[NSString alloc] initWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
        [keys addObject:propertyName];
    }
    
    free(properties);
    return keys;
}

//从字典转对象
+ (BaseModel *)getModel:(Class)model fromDict:(NSDictionary *)obj{
    BaseModel *baseModel = [[model alloc] autorelease];
    for (NSString *key in [self getClassProperties:model]) {
        
        //根据key取value
        id propertyValue = [obj valueForKey:key];
        //设置值
        if (![propertyValue isKindOfClass:[NSNull class]] && propertyValue!=nil) {
            [baseModel setValue:propertyValue forKey:key];
        }else{
            [baseModel setValue:@"" forKey:key];
            //NSLog(@"值为空－－ %@",key);
        }
    }
    return baseModel;
}


//从ResultSet转对象
+ (BaseModel *)getModel:(Class)model fromResult:(FMResultSet *)obj{
    BaseModel *baseModel = [[model alloc] autorelease];
    for (NSString *key in [self getClassProperties:model]) {
        
        //根据key取value
        id propertyValue = [obj stringForColumn:key];
        //设置值
        if (![propertyValue isKindOfClass:[NSNull class]] && propertyValue!=nil) {
            [baseModel setValue:propertyValue forKey:key];
        }else{
            [baseModel setValue:@"" forKey:key];
            //NSLog(@"值为空－－ %@",key);
        }
    }
    return baseModel;
}



//根据对象生成创建表语句
+(NSString *)getCreateTableSql:(Class)model{

    NSString *tableName = NSStringFromClass(model);
    NSMutableString *paraMutableStr = [[NSMutableString alloc] init];
    NSString *createTableSql = [[NSMutableString alloc] init];
    
    for (NSString *key in [ClassUtils getClassProperties:model]){
        [paraMutableStr appendFormat:@"%@ TEXT(1024),",key];
    }
    NSString *paraStr = [paraMutableStr substringToIndex:paraMutableStr.length-1];
    
    createTableSql = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (serial integer Primary Key Autoincrement,%@)",tableName,paraStr];
//    [tableName release];
//    [paraStr release];
    return createTableSql;
}


//根据对象生成插入语句
+(NSString *)getInsertModelSql:(BaseModel *)model{

    NSString *tableName = NSStringFromClass(model.class);
    NSMutableString *paraMutableStr = [[NSMutableString alloc] init];
    NSMutableString *valueMutableStr = [[NSMutableString alloc] init];
    for (NSString *key in [self getClassProperties:model.class]){
        //paraStr = [NSString stringWithFormat:@"%@,",key];
        [paraMutableStr appendFormat:@"%@,",key];
         NSString *value = [model valueForKey:key];
        [valueMutableStr appendFormat:@"'%@',",value];
    }
    NSString *paraStr = [paraMutableStr substringToIndex:paraMutableStr.length-1];
    NSString *valueStr = [valueMutableStr substringToIndex:valueMutableStr.length-1];
    //NSLog(@"参数%@---------值%@",paraStr,valueStr);
    NSString *sqlStr = [NSString stringWithFormat:@"insert into %@ (%@) values (%@)",tableName,paraStr,valueStr];
    NSLog(@"%@",sqlStr);
    return sqlStr;
}

//根据对象生成查询语句
+(NSString *)getQueryModelSql:(Class)model startAt:(NSInteger)start count:(NSInteger)count{
    
    NSString *tableName = NSStringFromClass(model);
    NSMutableString *paraMutableStr = [[NSMutableString alloc] init];
    for (NSString *key in [self getClassProperties:model]){
        //paraStr = [NSString stringWithFormat:@"%@,",key];
        [paraMutableStr appendFormat:@"%@,",key];
    }
    NSString *paraStr = [paraMutableStr substringToIndex:paraMutableStr.length-1];
    NSString *sqlStr = [NSString stringWithFormat:@"select %@,*from %@ limit %d,%d",paraStr,tableName,start,count];
    NSLog(@"%@",sqlStr);
    return sqlStr;
}


//查询后转对象
+(BaseModel *)getModel:(Class)model sql:(NSString *)sql{

    
    
    
    return nil;
}

//查询后转列表
+(NSArray *)getArray:(Class)model sql:(NSString *)sql{

    return nil;
}




@end
