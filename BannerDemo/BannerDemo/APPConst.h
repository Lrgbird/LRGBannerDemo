//
//  APPConst.h
//  TTAPP
//
//  Created by zhu on 16/11/23.
//  Copyright © 2016年 lrg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AdSupport/AdSupport.h>

/**
 *  单例模式
 */
// .h文件
#define APPSingletonH(name) + (instancetype)shared##name;

// .m文件
#define APPSingletonM(name) \
static id _instance; \
\
+ (id)allocWithZone:(struct _NSZone *)zone \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [super allocWithZone:zone]; \
}); \
return _instance; \
} \
\
+ (instancetype)shared##name \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [[self alloc] init]; \
}); \
return _instance; \
} \
\
- (id)copyWithZone:(NSZone *)zone \
{ \
return _instance; \
}

/*
 日志输出
 */
#ifdef DEBUG
#define APPLog(...) NSLog(__VA_ARGS__)
#else
#define APPLog(...)
#endif

#define APPData(...) [NSString stringWithFormat:@"data[%@]",(__VA_ARGS__)]
//#define APPSuccess ([json[@"error"] intValue] == 10)

#define APPColor(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define APPColorFromRGB(rgbValue)    [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

//颜色
#define APPBackGroundGray APPColor(238,238,238)
#define APPLightWhite APPColor(204,204,204)
#define APPDarkWhite APPColor(153,153,153)
#define APPLightGray APPColor(102,102,102)
#define APPDarkGray APPColor(51,51,51)
#define APPBgView APPColor(246,246,246)

#define APPLightGrayM APPColor(150,150,150)
#define APPLightBrown APPColor(245,244,243)
#define APPSeaGreen APPColor(230,0,0)
#define APPLineGRay APPColor(235,235,235)
#define APPGWCGray APPColor(240,240,240)
#define APPGWCTextGray APPColor(153,153,153)
#define APPSearchTextGray APPColor(134,134,134)
#define APPGoodsNameTextColor APPColor(120,120,120)
#define APPGoddsIntroTextColor APPColor(173,173,173)


#define APPTextTitleColor APPColor(49,49,49)
#define APPTextIntroColor APPColor(148,148,148)
#define APPTextPriceColor APPColor(199,9,27)
#define APPGoldenColor    APPColor(212,175,103)
/** 背景红色*/
#define kAPPRedColor APPColor(231, 50, 82)
/** 分割线颜色*/
#define kAPPLineColor APPColor(246,246,246)
/** 导航栏颜色*/
#define NAVIGATION_BAR_COLOR [UIColor whiteColor]
/** tabBar颜色*/
#define TAB_BAR_COLOR [UIColor whiteColor]
/** tabBar选中颜色*/
#define TAB_BAR_SELECT_COLOR APPColor(230,0,0)

#define APPScreenHeight [UIScreen mainScreen].bounds.size.height
#define APPScreenWidth [UIScreen mainScreen].bounds.size.width

UIKIT_EXTERN CGFloat const APPNavigationHeight;
UIKIT_EXTERN CGFloat const APPMargin;
UIKIT_EXTERN CGFloat const APPStatusBarHeight;
UIKIT_EXTERN CGFloat const APPTabBarHeight;

/**
 *  价格显示的小数位数
 */

UIKIT_EXTERN short const APPPriceDigit;
UIKIT_EXTERN NSString* const APPPageSize;

//域名地址-系统常量
UIKIT_EXTERN NSString *const APPHostUrl;
UIKIT_EXTERN NSString *const APPAppid;
UIKIT_EXTERN NSString *const APPAppsecret;
UIKIT_EXTERN NSString *const APPPt;
UIKIT_EXTERN NSString *const APPCorrectCode;


#define APPVer [[NSBundle mainBundle].infoDictionary objectForKey:@"CFBundleShortVersionString"]
#define APPImei ([[ASIdentifierManager sharedManager] advertisingIdentifier].UUIDString)

//三方登陆分享key

UIKIT_EXTERN NSString *const APPWeChatAppId;
UIKIT_EXTERN NSString *const APPWeChatAppSecret;
UIKIT_EXTERN NSString *const APPQQAppId;
UIKIT_EXTERN NSString *const APPQQAppKey;
UIKIT_EXTERN NSString *const APPWeiboAppkey;
UIKIT_EXTERN NSString *const APPWeiboAppSecret;
UIKIT_EXTERN NSString *const APPWeiboCallBackUrl;
UIKIT_EXTERN NSString *const APPUMengAppKey;
UIKIT_EXTERN NSString *const APPWXPayAppID;


//账号存储目录
#define APPAccountPath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"UserInfor.data"]

#define APPHistorySearchPath [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0]  stringByAppendingPathComponent:@"historySearch.plist"] //搜索历史存放地址
#define HistoryNum 5 //搜索历史数目


#pragma mark --- 极光推送
UIKIT_EXTERN NSString *const APPJPushAppKey;
UIKIT_EXTERN NSString *const APPJPushSecret;

//key值
UIKIT_EXTERN NSString *const APPIsFirstLoad;

#pragma mark ---判断机型、系统版本号
//[[UIDevice currentDevice] systemVersion] floatValue] 手机系统
#define IOS8    ([[[UIDevice currentDevice] systemVersion] integerValue] == 8)
#define IOS9    ([[[UIDevice currentDevice] systemVersion] integerValue] == 9)
#define IOS10   ([[[UIDevice currentDevice] systemVersion] integerValue] == 10)
#define IOS11   ([[[UIDevice currentDevice] systemVersion] integerValue] == 11)

#define IOS8_OR_LATER    ([[[UIDevice currentDevice] systemVersion] integerValue] >= 8)
#define IOS9_OR_LATER    ([[[UIDevice currentDevice] systemVersion] integerValue] >= 9)
#define IOS10_OR_LATER    ([[[UIDevice currentDevice] systemVersion] integerValue] >= 10)
#define IOS11_OR_LATER    ([[[UIDevice currentDevice] systemVersion] integerValue] >= 11)

// 3.5 inch
#define IS_SCREEN_3_5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] \
? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size)\
: NO)
//4.0 inch
#define IS_SCREEN_4_0 ([UIScreen instancesRespondToSelector:@selector(currentMode)] \
? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size)\
: NO)
// 4.7 inch
#define IS_SCREEN_4_7 ([UIScreen instancesRespondToSelector:@selector(currentMode)] \
? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size)\
: NO)
// 5.5 inch
#define IS_SCREEN_5_5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? (CGSizeEqualToSize(CGSizeMake(1125, 2001), [[UIScreen mainScreen] currentMode].size) || CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size)) : NO)
//iphone X
#define IS_SCREEN_X ([UIScreen instancesRespondToSelector:@selector(currentMode)] \
? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size)\
: NO)

