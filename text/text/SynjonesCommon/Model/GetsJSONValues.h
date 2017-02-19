//
//  GetsJSONValues.h
//  Synjones
//
//  Created by Liang Haiyan on 13-7-5.
//  Copyright (c) 2013 year Synjones. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface GetsJSONValues : NSObject


+ (NSMutableArray *)tranHttpDataToModel:(NSMutableData *)data class:(Class)aclass;

+ (NSMutableArray *)tranHttpDataToModelAndInsertDB:(NSMutableData *)data class:(Class)aclass;

+ (NSMutableArray *)tranHttpDataToModel:(NSMutableData *)data class:(Class)aclass inStr:(NSString *)messOrObj;

// App id
+ (NSMutableArray *)getsAppIdData:(NSMutableData *)data;
// LoginType
+ (NSMutableArray *)getsLoginTypeData:(NSMutableData *)data;
// login 
+ (NSMutableArray *)getsLoginData:(NSMutableData *)data;
// info
+ (NSMutableArray *)getsInfoData:(NSMutableData *)data;
// cardLoss
+ (NSMutableArray *)getsCardLossData:(NSMutableData *)data;
// EaccInfo
+ (NSMutableArray *)getsEaccInfoData:(NSMutableData *)data;
// BankTransfer
+ (NSMutableArray *)getsBankTransferData:(NSMutableData *)data;
// Aweek & History
+ (NSMutableArray *)getsAweekAndHistoryData:(NSMutableData *)data;
// get UI
+ (NSMutableArray *)getsUIData:(NSMutableData *)data;
// CardType
+ (NSMutableArray *)getsCardTypeData:(NSMutableData *)data;
// CardTypeNum
+ (NSMutableArray *)getsCardTypeNumData:(NSMutableData *)data;
// PayTypeList
+ (NSMutableArray *)getsPayTypeListData:(NSMutableData *)data;
// NFixCardList
+ (NSMutableArray *)getsNFixCardListData:(NSMutableData *)data;
// AllSubsidyTrjn
+ (NSMutableArray *)getsAllSubsidyTrjnData:(NSMutableData *)data;
// Contents
+ (NSMutableArray *)getsContentsData:(NSMutableData *)data;
// SchoolInfo
+ (NSMutableArray *)getsSchoolInfoData:(NSMutableData *)data;
// MFTrjns
+ (NSMutableArray *)getsMFTrjnsData:(NSMutableData *)data;
// NetFeeType
+ (NSMutableArray *)getsNetFeeTypeData:(NSMutableData *)data;
// XiaoQu
+ (NSMutableArray *)getsXiaoQuData:(NSMutableData *)data;
// OrderList
+ (NSMutableArray *)getsOrderListData:(NSMutableData *)data;
// ReceiveList & SendList & MesList & GetContent
+ (NSMutableArray *)getsReceiveListData:(NSMutableData *)data;
// RecByContent
+ (NSMutableArray *)getsRecByContentData:(NSMutableData *)data;
// CopyrightContact
+ (NSMutableArray *)getsCopyrightContactData:(NSMutableData *)data;
// LatestUpgrade
+ (NSMutableArray *)getsLatestUpgradeData:(NSMutableData *)data;
// HisTotal
+ (NSMutableArray *)getsHisTotalData:(NSMutableData *)data;
//ClickApp
+ (NSMutableArray *)getsClickAppData:(NSMutableData *)data;
//Transfer
+ (NSArray *)TransferInfoData:(NSMutableData *)data;
@end





