


// 数据库名字
// 删除数据表
// 查询当前有多少条记录
#define DataBaseName            @"Database.db"
#define DataBaseTable           @"delete from %@"
#define DataBaseCount           @"select count(*) from %@"



/*
 创建表
 插入数据
 判断插入数据是否重复
 读取数据表从XXX条记录开始到XXX条记录
 删除数据表里指定键值XXX的内容
 */

// 账户、密码
#define Synjones                @"Synjones"

#define MyUserPass              @"CREATE TABLE IF NOT EXISTS Synjones (serial integer  Primary Key Autoincrement,user TEXT(1024),pass TEXT(1024))"

#define MYUSERPASSUpdate        @"insert into Synjones (user,pass) values (?,?)"

#define MYUSERPASSIsEgat        @"select user from Synjones where user = ?"

#define MYUSERPASSRead          @"select user,pass,*from Synjones limit %d,%d"

#define MYUSERPASSDeleteNum     @"delete from %@ where user = %@"

// 个人信息
#define InfoTable               @"InfoTable"
#define InfoSql                 @"CREATE TABLE IF NOT EXISTS InfoTable (serial integer  Primary Key Autoincrement,name TEXT(1024),sno TEXT(1024),bankno TEXT(1024),cardbalance TEXT(1024),bankbalance TEXT(1024),cardno TEXT(1024),tmpbalance TEXT(1024))"
#define InfoUpdate              @"insert into InfoTable (name,sno,bankno,cardbalance,bankbalance,cardno,tmpbalance) values (?,?,?,?,?,?,?)"
#define InfoIsEgat              @"select name from InfoTable where name = ?"
#define InfoRead                @"select name,sno,bankno,cardbalance,bankbalance,cardno,tmpbalance,*from InfoTable limit %d,%d"
#define InfoDeleteNum           @"delete from %@ where name = %@"

// UI

#define UI                      @"UI"
#define UISql                   @"CREATE TABLE IF NOT EXISTS UI (serial integer  Primary Key Autoincrement,name TEXT(1024),name1 TEXT(1024),name2 TEXT(1024),name3 TEXT(1024),name4 TEXT(1024),name5 TEXT(1024),name6 TEXT(1024),name7 TEXT(1024),name8 TEXT(1024),name9 TEXT(1024),name10 TEXT(1024),name11 TEXT(1024),name12 TEXT(1024))"
#define UIUpdate                @"insert into UI (name,name1,name2,name3,name4,name5,name6,name7,name8,name9,name10,name11,name12) values (?,?,?,?,?,?,?,?,?,?,?,?,?)"
//处理
#define UIIsEgat                @"select name from UI where name = ?"
#define UIRead                  @"select name,name1,name2,name3,name4,name5,name6,name7,name8,name9,name10,name11,name12,*from UI limit %d,%d"
#define UIDeleteNum             @"delete from %@ where name = %@"

// 卡消息
#define CardMessageTable        @"CardMessageTable"
#define CardMessageSql          @"CREATE TABLE IF NOT EXISTS CardMessageTable (serial integer  Primary Key Autoincrement,name TEXT(1024),name1 TEXT(1024),name2 TEXT(1024),name3 TEXT(1024),name4 TEXT(1024),name5 TEXT(1024),name6 TEXT(1024),name7 TEXT(1024))"
#define CardMessageUpdate       @"insert into CardMessageTable (name,name1,name2,name3,name4,name5,name6,name7) values (?,?,?,?,?,?,?,?)"
#define CardMessageIsEgat       @"select name4 from CardMessageTable where name4 = ?"
#define CardMessageRead         @"select name,name1,name2,name3,name4,name5,name6,name7,*from CardMessageTable limit %d,%d"
#define CardMessageDeleteNum    @"delete from %@ where name5 = %@"























