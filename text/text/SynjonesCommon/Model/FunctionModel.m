//
//  FunctionModel.m
//  SynjonesCommon
//
//  Created by wdh on 14-7-30.
//  Copyright (c) 2014年 synjones. All rights reserved.
//

#import "FunctionModel.h"


@implementation FunctionModel

@synthesize ID;//id
@synthesize ParentID;//上级id
@synthesize Name;//名称
@synthesize Code;//编号
@synthesize SchoolCode;//学校代码
@synthesize IsEnable;//可用
@synthesize IsDisplay;//显示
@synthesize IsNeedLogin;//登录
@synthesize StartContext;//上下文
@synthesize IconName;//图片名
@synthesize Orders;//序数
@synthesize Paras;//参数
@synthesize IsNeedPermission;//是否需要权限
@synthesize Childrens;//子
@synthesize ClientType;//子类型

@end
