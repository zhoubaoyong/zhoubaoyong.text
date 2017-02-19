//
//  Base64.h
//  Synjones
//
//  Created by Liang Haiyan on 13-5-14.
//  Copyright (c) 2013 year Synjones. All rights reserved.
//

#import "Database.h"
#import "HttpDataItem.h"
#import "FunctionModel.h"
#import "CardMessageModel.h"


static Database *g_database = nil;

@implementation Database

- (void)createDatabase {
    NSString *filepath = [Database filePath:DataBaseName];
    //实例化
    HeadLinesDb = [[FMDatabase databaseWithPath:filepath] retain];
    //打开
    if ([HeadLinesDb open]) {
        
        //创建表
        NSString *tableFunctionSql = [ClassUtils getCreateTableSql:FunctionModel.class];
        NSString *tableCardMessSql = [ClassUtils getCreateTableSql:CardMessageModel.class];

        NSLog(@"%@",tableCardMessSql);
        
            if ([HeadLinesDb executeUpdate:UISql] && [HeadLinesDb executeUpdate:CardMessageSql] && [HeadLinesDb executeUpdate:tableFunctionSql]&& [HeadLinesDb executeUpdate:tableCardMessSql]) {
                    //NSLog(@"成功");
        }
            else
                NSLog(@"创建失败");
    }
}


//创建表
- (BOOL)createTableByModel:(Class)aClass{
    return false;
}

//插入对象
- (BOOL)insertModel:(BaseModel *)model{
    
    NSString *insertModelSql = [ClassUtils getInsertModelSql:model];
    if ([HeadLinesDb executeUpdate:insertModelSql]) {
        //NSLog(@"插入成功");
        return YES;
    }
    else {
        NSLog(@"插入失败: %@",[HeadLinesDb lastErrorMessage]);
        return NO;
        
    }
}

//查询对象
- (NSMutableArray *)queryModel:(Class)aClass start:(NSInteger)start count:(NSInteger)count{
    NSString *query = [NSString stringWithFormat:@"%@",[ClassUtils getQueryModelSql:aClass startAt:start count:count]];
    NSMutableArray *array=[NSMutableArray arrayWithCapacity:0];
        if ([HeadLinesDb open]) {
            FMResultSet *resultSet = [HeadLinesDb executeQuery:query];
            while ([resultSet next]) {
               BaseModel *baseModel =  [ClassUtils getModel:aClass fromResult:resultSet];
                [array addObject:baseModel];
            }
        }
    return array;
}


- (BOOL)isExistItem:(NSMutableArray *)array dataBase:(NSString *)table {
    if ([table isEqualToString:UI]) {
        HttpDataItem *item = [array lastObject];
        FMResultSet *resultSet=[HeadLinesDb executeQuery:UIIsEgat,item.obj3];
        [HeadLinesDb beginTransaction];
        while ([resultSet next]) {
            return YES;
        }
        [HeadLinesDb commit];
        return NO;
    }
    else {
//        if ([table isEqualToString:CardMessageTable]) {
//        }
    }
    return NO;
}

- (NSInteger)itemCount:(NSString *)table {
    NSString *sql = [NSString stringWithFormat:DataBaseCount,table];
    FMResultSet *resultSet = [HeadLinesDb executeQuery:sql];
    while ([resultSet next]) {
        //获得当前记录的第一个字段
        NSInteger count=[resultSet intForColumnIndex:0];
        return count;
    }
    return 0;
}




//弃用
- (NSMutableArray *)readItem:(NSInteger)start count:(NSInteger)count dataBase:(NSString *)table {
    NSMutableArray *array=[NSMutableArray arrayWithCapacity:0];
    if ([table isEqualToString:UI]) {
        if ([HeadLinesDb open]) {
            NSString *sql=[NSString stringWithFormat:UIRead,(int)start,(int)count];
            FMResultSet *resultSet = [HeadLinesDb executeQuery:sql];
            while ([resultSet next]) {
                HttpDataItem *item = [[[HttpDataItem alloc] init] autorelease];
                item.obj3 = [resultSet stringForColumn:@"name"];
                item.obj = [resultSet stringForColumn:@"name1"];
                item.obj1 = [resultSet stringForColumn:@"name2"];
                item.obj2 = [resultSet stringForColumn:@"name3"];
                item.obj4 = [resultSet stringForColumn:@"name4"];
                item.obj5 = [resultSet stringForColumn:@"name5"];
                item.obj6 = [resultSet stringForColumn:@"name6"];
                item.obj7 = [resultSet stringForColumn:@"name7"];
                item.obj8 = [resultSet stringForColumn:@"name8"];
                item.obj9 = [resultSet stringForColumn:@"name9"];
                item.obj10 = [resultSet stringForColumn:@"name10"];
                item.obj12 = [resultSet stringForColumn:@"name11"];
                item.obj13 = [resultSet stringForColumn:@"name12"];
                            
                [array addObject:item];
            }
        }
    }
    else {
        if ([table isEqualToString:CardMessageTable]) {
            if ([HeadLinesDb open]) {
                NSString *sql=[NSString stringWithFormat:CardMessageRead,(int)start,(int)count];
                FMResultSet *resultSet=[HeadLinesDb executeQuery:sql];
                while ([resultSet next]) {
                    HttpDataItem *item = [[[HttpDataItem alloc] init] autorelease];
                    item.obj = [resultSet stringForColumn:@"name"];
                    item.obj1 = [resultSet stringForColumn:@"name1"];
                    item.obj2 = [resultSet stringForColumn:@"name2"];
                    item.obj3 = [resultSet stringForColumn:@"name3"];
                    item.obj4 = [resultSet stringForColumn:@"name4"];
                    item.obj5 = [resultSet stringForColumn:@"name5"];
                    item.obj6 = [resultSet stringForColumn:@"name6"];
                    item.obj7 = [resultSet stringForColumn:@"name7"];
                    [array addObject:item];
                }
            }
        }
    }
    return array;
}

//未用
+ (Database *)shareddatabase {
    if (!g_database) {
        g_database = [[Database alloc]init];
    }
    return g_database;
}


+ (NSString *)filePath:(NSString *)fileName {
    //获得当前应用程序在目录
    NSString *roothPath = NSHomeDirectory();
    //    NSString *roothPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    roothPath=[roothPath stringByAppendingPathComponent:@"Documents"];
    if (fileName && [fileName length] != 0) {
        roothPath=[roothPath stringByAppendingPathComponent:fileName];
    }
    
    NSFileManager *fileManager=[NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:roothPath]) {
        //        NSLog(@"指定文件路径: %@",roothPath);
        
    }
    return roothPath;
}

//删除表中数据
- (void)deleteHeadLinesDb:(NSString *)table {
    NSString *sql=[NSString stringWithFormat:DataBaseTable,table];
    [HeadLinesDb executeUpdate:sql];
}


- (void)deleteHeadLinesDb:(NSString *)table whereName:(NSString *)name {
    NSString *sql = nil;
    if ([table isEqualToString:UI]) {
        sql = [NSString stringWithFormat:UIDeleteNum,table,name];
    }
    else {
        sql = [NSString stringWithFormat:CardMessageDeleteNum,table,name];
    }
    [HeadLinesDb executeUpdate:sql];
    [HeadLinesDb close];
}
- (void)deleteDataBase {
    
     NSString *filepath=[Database filePath:DataBaseName];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    [fileManager removeItemAtPath:filepath error:nil];
}

- (id)init
{
    if (self = [super init]) {
        [self createDatabase];
    }
    return self;
}
-(void)closeDatabase {
    [g_database closeDatabase];
}

- (void)dealloc
{
    [HeadLinesDb release];
    [super dealloc];
}

//弃用
- (void)insertArray:(NSMutableArray *)array dataBase:(NSString *)table {
    
    if ([self isExistItem:array dataBase:table]) {
        return;
    }
    if ([table isEqualToString:UI]) {
        for (int i = 0; i < array.count; i++) {
            
            HttpDataItem *item = [array objectAtIndex:i];
            
            if ([HeadLinesDb executeUpdate:UIUpdate,item.obj3,item.obj,item.obj1,item.obj2,item.obj4,item.obj5,item.obj6,item.obj7,item.obj8,item.obj9,item.obj11,item.obj12,item.obj13]) {
                
                //            NSLog(@"插入成功");
            }
            else {
                
                NSLog(@"插入失败: %@",[HeadLinesDb lastErrorMessage]);
            }
        }
        
    }
    else {
        
        if ([table isEqualToString:CardMessageTable]) {
            HttpDataItem *item = [array lastObject];
            //           NSLog(@"\n context: %@ \n title: %@\n type: %@\n flag: %@ \n time: %@ num: %@ \n",item.obj,item.obj1,item.obj2,item.obj3,item.obj4,item.obj5);
            
            if ([HeadLinesDb executeUpdate:CardMessageUpdate,item.obj,item.obj1,item.obj2,item.obj3,item.obj4,item.obj5,item.obj6,item.obj7]) {
                //                NSLog(@"插入成功");
            }
            else
                NSLog(@"插入失败: %@",[HeadLinesDb lastErrorMessage]);
        }
    }
}

@end
