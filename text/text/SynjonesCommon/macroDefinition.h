
#import "MoreView.h"


#define App                     ((AppDelegate *)[[UIApplication sharedApplication] delegate])

#define                         Bounds self.view.bounds

#define                         Width self.view.bounds.size.width

#define                         Height self.view.bounds.size.height

#define Zero                    0

#define FFR                     44

#define FNE                     49


#define ACCOUNT                 @"account"                  // 校园卡号
#define Pass                    @"password"
#define StartTimeUr             @"startTime"
#define EndTimeUr               @"endTime"
#define Eacc                    @"Eacc"
#define IpDPO                   @"iPlanetDirectoryPro"
#define SNO                     @"sno"                      // 学工号
#define Server                  @"Server"                   // 服务器地址
#define USERID                  @"userId"                   // 当前用户Id
#define FLAG                    @"flag"                     // 卡消息的flag的值
#define SCHOOLCODE              @"SchoolCode"               // 校区编码
#define SCHOOLNAME              @"SchoolName"               // 学校名称
#define WELCOMEIMAGEURL         @"welcomeImageUrl"          // 欢迎界面背景图片
#define DOWNLOADTIME            @"downLoadTime"             // 保存新的是否需要更新的值


#define WarmthTip               @"向校园卡转账成功后所转金额将显示在过渡余额中,在餐厅等处刷卡机上进行刷卡操作后,过渡余额即会转入校园卡。"

#define RootNum_1               1
#define CampusCard              @"校园卡"
#define LoadMore                @"加载更多"
#define Loading                 @"加载中..."

#define App_Message             @"提示"
#define App_Message_a           @"有最新版本,是否需要更新?"
#define App_Message_b           @"立即更新"
#define App_Message_c           @"稍后更新"
#define App_Message_d           @"亲,输入不能为空"
#define Sure                    @"确 定"
#define COMPLETION_LOADING      @"没有更多数据"
#define Data failed to load
#define DATA_FAILED_TO_LOAD     @"数据加载失败"
#define NETWORK_ANOMALY         @"网络异常"

// Login
#define LOGIN_BUTTON            @"登    录"
#define LOGIN_USERLABEL         @"校园卡号:"
#define LOGIN_PASSLABEL         @"密码:"
#define LOGIN_USERPLACEHOLDER   @"请输入校园卡号"
#define LOGIN_PASSPLACEHOLDER   @"请输入密码"
#define LOGIN_FAILURE           @"登录失败"

// title
#if 0
#define Root2_TITLE             @"基本信息"
#define Root3_TITLE             @"转账充值"
#define Root6_TITLE             @"流水查询"
#define Root7_TITLE             @"校园片挂失"
#define Root8_TITLE             @"修改密码"
#define WelcomeView_TITLE       @"开机后的欢迎界面"
#define Root15_TITLE            @"常见问题" / @"公共通知"
#define BootScreenView_TITLE    @"引导界面"
#endif

#define Root4_TITLE             @"交网费"
#define Root5_TITLE             @"交电费"
#define Root9_TITLE             @"校园卡解挂"
#define Root10_TITLE            @"一卡通通知"
#define Root11_TITLE            @"拾卡信息"
#define Root12_TITLE            @"补助流水"
#define Root13_TITLE            @"电子账户信息"
#define Root16_TITLE            @"免费米饭"
#define Root17_TITLE            @"我的消息"
#define Root18_TITLE            @"缴费记录"
#define Root19_TITLE            @"卡消息"
#define Root21_TITLE            @"统计分析"
#define Root22_TITLE            @"问题反馈"

#define Login_TITLE             @"用户登录"
#define ToDay_TITLE             @"当日流水查询"
#define Aweek_TITLE             @"近一周流水"
#define Result_TITLE            @"历史流水查询"
#define History_TITLE           @"选择历史时间"
#define Details_TITLE           @"详情"
#define MoreView_TITLE          @"设置"
#define UpdatesView_TITLE       @"更新"
#define AboutUsView_TITLE       @"关于我们"
#define ServicesView_TITLE      @"服务器设置"
#define MessageInbox_TITLE      @"发件箱详情"
#define MessageDetails_TITLE    @"收件箱详情"


// 判断是否是iphone5
#define IPHONE5                 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

// 操作时的提示信息
#define MESSAGE                 [[NSUserDefaults standardUserDefaults] objectForKey:@"MESSAGE"]




