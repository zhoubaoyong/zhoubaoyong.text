

//客户端类型标示
//#define ClientType                  @"IOS"
// 动态获取服务器地址
#define SERVICES                    [NSString stringWithFormat:@"http://%@:8070",[[NSUserDefaults standardUserDefaults] objectForKey:@"Server"]]

//#define SERVICES_URL                 @"card.xjtu.edu.cn"
#define SERVICES_URL                 @"www.synedu.net"
//#define SERVICES_URL                 @"ucard.nuist.edu.cn"

// 厦门大学服务器
//#define SERVICES                  @"http://183.250.112.250:8070"

// 公网服务器
//#define SERVICES                  @"http://211.103.200.87:8170"

// 开发时用到的服务器
//#define SERVICES                  @"http://192.168.18.70:8070"

// 苹果官方接口判断程序安装包是否需要更新  (%@ 表示你程序的appId)
//#define APP_URL                     @"http://itunes.apple.com/lookup?id=736575062"
//#define APP_URLNumber               100000

// 界面UI部局
//#define UIDBN                       @"%@/Api/System/GetAppList"
//#define UIDBNumber                  1000
#define UIDBN                       @"%@/Api/System/GetAppChild"
#define UIDBNumber                  1000


// 获取登录类型
#define LoginTypeUrl                @"%@/Api/Account/GetSignType"
#define LoginTypeNumber             101

// 登录
//#define LoginUrl                  @"%@/Api/Account/SignIn"
//#define LoginNumber               0
#define LoginUrl                    @"%@/Api/Account/SignInForMobile"
#define LoginNumber                 0

#define LoginAndGetUserUrl         @"%@/Api/Account/SignInAndGetUser"
#define LoginAndGetUserNumber       10


// 获取用户有权限的功能点
#define MyFuncsUrl                  @"%@/Api/System/GetMyFuncs"
#define MyFuncsNumber               111111

// 校园卡基本信息
#define InfoUrl                     @"%@/Api/Card/GetCardInfo"
#define InfoNumber                  1


// 卡片解挂
#define CardLossUrl                 @"%@/Api/Card/SetCardUnLost"
#define CardLossNumber              2

// 修改密码
#define ChangeQueryPwd              @"%@/Api/Card/ChangeQueryPwd"
#define ChangeQueryPwdNumber        3

// 电子账户
#define EaccInfoUrl                 @"%@/Api/Card/GetEaccInfo"
#define EaccInfoNumber              4

// 转账充值
#define BankTransferUrl             @"%@/Api/Card/BankTransfer"
#define BankTransferNumber          5
// 转账充值限定金额
#define TransferLimit               @"%@/Api/System/GetTransferLimit"
#define TransferLimitNumber         55
// 转账充值限定金额/是否需要输入银行卡号和银行卡密码
#define TransferInfoUrl             @"%@/Api/System/GetTransferInfo"
#define TransferInfoNumber          555

// 当日流水查询
#define ToDayUrl                    @"%@/Api/Card/GetCurrentTrjn"
#define ToDayNumber                 6

// 近一周流水,历史流水查询
#define AweekHistoryTrjnsUrl        @"%@/Api/Card/GetHistoryTrjn"
#define AweekHistoryTrjnsNumber     7
// 流水查询类型
#define TrjnTypeUrl                 @"%@/Api/Card/GetConsumeType"
#define TrjnTypeNumber              700
// 流水记录条数
#define TrjnCountUrl                @"%@/Api/Card/GetTrjnCount"
#define TrjnCountNumber             7000


// 卡片挂失
#define CardLostUrl                 @"%@/Api/Card/SetCardLost"
#define CardLostNumber              8

// 一卡通通知
#define CardTypeUrl                 @"%@/Api/SynNotice/GetCardType"
#define CardTypeNumber              9
// 一卡通通知栏目一
#define CardTypeNum_0               @"%@/Api/SynNotice/GetCardNoticeList"
#define CardTypeNum_0Number         90
#define CardTypeNum_1Number         91
#define CardTypeNum_2Number         92
#define CardTypeNum_3Number         93
// 每条信息的详情
#define Cardnotice                  @"%@/infopub/%@"

// 捡获卡通知
#define NFixCardListUrl             @"%@/Api/SynNotice/GetNFixCardList"
#define NFixCardListNumber          11

// 补助流水
#define AllSubsidyTrjnUrl           @"%@/Api/Card/GetAllSubsidyTrjn"
#define AllSubsidyTrjnNumber        12

// 用户基本信息
#define UserInfoUrl                 @"%@/Api/Account/GetUserInfo"
#define UserInfoNumber              13

// 常见问题 / 公共通知
#define ChildTypeUrl                @"%@/Api/SynNotice/GetChildType"
#define ChildTypeNumber             14
// ---常见问题列表 / 公共通知列表---
#define ContentsUrl                 @"%@/Api/SynNotice/GetContents"
#define ContentsNumber              144

// 获取学校图片/基本信息
#define SchoolInfoUrl               @"%@/api/System/GetSchoolInfo"
#define SchoolInfoNumber            15


// 获取基本信息中的头像图片
#define MyPhotoUrl                  @"%@/api/card/getmyphoto"
#define MyPhotoNumber               16

// 米饭补助
#define MFTrjnsUrl                  @"%@/api/card/GetMFTrjns"
#define MFTrjnsNumber               17

// 米饭补助中的总条数
#define MFCountAndSumUrl            @"%@/api/card/GetMFCountAndSum"
#define MFCountAndSumNumber         18

// 交网费
#define SynNetFeeDoPayUrl           @"%@/Api/SynNetFee/DoPay"
#define SynNetFeeDoPayNumber        19
// 交网费缴费类型
#define NetFeeTypeUrl               @"%@/Api/SynNetFee/GetNetFeeType"
#define NetFeeTypeNumber            20
// 判断网费充值账号是否存在
#define IsExistsUrl                 @"%@/Api/SynNetFee/IsExists"
#define IsExistsNumber              21

// 缴电费
#define PowerFeeDoPayUrl            @"%@/Api/PowerFee/DoPay"
#define PowerFeeDoPayNumber         22
// 交电费缴费类型
#define PayTypeListUrl              @"%@/Api/PowerFee/GetPayTypeList"
#define PayTypeListNumber           23
// 缴电费时的校区
#define XiaoQuUrl                   @"%@/Api/PowerFee/GetXiaoQu"
#define XiaoQuNumber                24
// 缴电费时的楼栋号
#define BuildUrl                    @"%@/Api/PowerFee/GetBuild"
#define BuildNumber                 25
// 判断要缴电费时的房间号是否存在
#define PowerFeeIsExistUrl          @"%@/Api/PowerFee/IsExist"
#define PowerFeeIsExistNumber       26

// 缴费记录
#define OrderListUrl                @"%@/Api/Order/GetOrderList"
#define OrderListNumber             27
// 缴费记录类型
#define FeeTypeListUrl              @"%@/Api/Order/GetFeeTypeList"
#define FeeTypeListNumber           28
// 缴费记录总数
#define OrderCountUrl               @"%@/Api/Order/GetOrderCount"
#define OrderCountNumber            29



/*****  我的消息  *****/
// 获取某一条消息内容
#define GetContentUrl               @"%@/Api/Notice/GetContent"
#define GetContentNumber            30
// 获取我发送的消息
#define SendListUrl                 @"%@/Api/Notice/GetSendList"
#define SendListNumber              31
// 获取我接收到的消息
#define ReceiveListUrl              @"%@/Api/Notice/GetReceiveList"
#define ReceiveListNumber           32
// 设置我的消息已读
#define IsReadedUrl                 @"%@/Api/Notice/SetIsReaded"
#define IsReadedNumber              33
// 获取我未读消息的个数
#define UnReadCountUrl              @"%@/Api/Notice/GetUnReadCount"
#define UnReadCountNumber           34
// 删除我接收的消息
#define DelReceiveUrl               @"%@/Api/Notice/DelReceive"
#define DelReceiveNumber            35
// 根据消息获取接收者信息
#define RecByContentUrl             @"%@/Api/Notice/GetRecByContent"
#define RecByContentNumber          36
// 获取消息列表接口
#define MesListUrl                  @"%@/Api/Notice/GetMesList"
#define MesListNumber               37
// 设置已读和删除接收的消息
#define IsReadOrDelRecUrl           @"%@/Api/Notice/SetIsReadOrDelRec"
#define IsReadOrDelRecNumber        38

// 卡消息
#define CardMessageUrl              @"%@/Api/SynNotice/GetMySnoMessage"
#define CardMessageNumber           39
// 设置卡消息已推送
#define MsgIsPushedUrl              @"%@/Api/SynNotice/SetMsgIsPushed"
#define MsgIsPushedNumber           399

// 获取版权信息和联系电话
#define CopyrightContactUrl         @"%@/Api/System/GetCopyrightContact"
#define CopyrightContactNumber      40

// 第一次登录时获取图片的引导界面
#define PictureUrl                  @"%@/Api/System/GetPicture"
#define PictureNumber               41

// 企业账号上的更新方法
#define LatestUpgradeUrl            @"%@/Api/System/GetLatestUpgrade"
#define LatestUpgradeNumber         42

//// App Store 上面的更新方法
//#define LatestUpgradeUrl            @"%@/Api/System/GetIOSFuncVersion"
//#define LatestUpgradeNumber         42

// 历史统计
#define HisTotalUrl                 @"%@/Api/Statistics/GetHisTotal"
#define HisTotalNumber              43

// 功能点访问量统计
#define ClickAppUrl                 @"%@/Api/Statistics/GetClickApp"
#define ClickAppNumber              44

// 是否是登录状态
#define IsSignInUrl                 @"%@/Api/Account/IsSignIn"
#define IsSignInNumber              45

// 问题反馈
#define AddQuestionUrl              @"%@/Api/Question/AddQuestion"
#define AddQuestionNumber           46


// 获得SK值
#define SKKEY              @"iPlanetDirectoryPro"
#define SK                 [[NSUserDefaults standardUserDefaults] objectForKey:SKKEY]


//缴水费

#define WaterFeeDoPayUrl              @"%@/Api/WaterFee/DoPay"

#define WaterFeeDoPayNumber              47

// 交缴费类型
#define WaterTypeListUrl              @"%@/Api/WaterFee/GetPayTypeList"
#define WaterTypeListNumber           48
// 缴水费时的校区
#define WaterXiaoQuUrl                   @"%@/Api/WaterFee/GetXiaoQu"
#define WaterXiaoQuNumber                49
// 缴水费时的楼栋号
#define WaterBuildUrl                    @"%@/Api/WaterFee/GetBuild"
#define WaterBuildNumber                 50
// 判断要缴水费时的房间号是否存在
#define WaterFeeIsExistUrl          @"%@/Api/WaterFee/IsExist"
#define WaterFeeIsExistNumber       51





