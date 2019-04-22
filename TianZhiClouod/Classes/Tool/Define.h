//
//  Define.h
//
//
//  Created by 天智 on 16/5/27.
//  Copyright © 2016年 天智. All rights reserved.
//

#ifndef Define_h
#define Define_h

//-------------------获取设备大小-------------------------
//NavBar高度
#define NavigationBar_HEIGHT        44
#define StatusBar_HEIGHT            (IsIphoneX ? 44 : 20)
#define StatusBar_NaviBar_HEIGHT    (NavigationBar_HEIGHT + StatusBar_HEIGHT)
#define IPhoneXBottom_HEIGHT        (IsIphoneX ? 34 : 0)
//获取屏幕 宽度、高度
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

//-------------------获取设备大小-------------------------


//-------------------打印日志-------------------------
//重写NSLog,Debug模式下打印日志和当前行数
#if DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"%s【%s line:%d 】%s\n", __TIME__, [[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(FORMAT, ...) nil
#endif

//DEBUG  模式下打印日志,当前行 并弹出一个警告
#ifdef DEBUG
#   define ULog(fmt, ...)  { UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%s\n [Line %d] ", __PRETTY_FUNCTION__, __LINE__] message:[NSString stringWithFormat:fmt, ##__VA_ARGS__]  delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil]; [alert show]; }
#else
#   define ULog(...)
#endif

#define ALERT(Title)  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:Title message:nil  delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil]; [alert show];
#define ALERT_GUANBI(title)  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:nil  delegate:nil cancelButtonTitle:@"关闭" otherButtonTitles:nil]; [alert show];

//---------------------打印日志--------------------------


//----------------------系统----------------------------

#define IsIphone4       [[UIScreen mainScreen] bounds].size.height == 480 //320*480
#define IsIphone5       [[UIScreen mainScreen] bounds].size.height == 568 //320*568
#define IsIphone6       [[UIScreen mainScreen] bounds].size.height == 667 //375*667
#define IsIphone6Plus   [[UIScreen mainScreen] bounds].size.height == 736 //414*736
#define IsIphoneX       [[UIScreen mainScreen] bounds].size.height == 812 //375*812



//判断是真机还是模拟器
#if TARGET_OS_IPHONE
//iPhone Device
#endif

#if TARGET_IPHONE_SIMULATOR
//iPhone Simulator
#endif

//获取NSDocumentDirectory路径
#define DocumentPath [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]
#define CachePath    [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask,YES) firstObject]

//----------------------系统----------------------------






//----------------------颜色类---------------------------
// rgb颜色转换（16进制->10进制）
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


// 获取RGB颜色
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r,g,b) RGBA(r,g,b,1.0f)

//背景色
#define BACKGROUND_COLOR UIColorFromRGB(0xF3F4F7)
#define LINECOLOR UIColorFromRGB(0xE5E5E5)
#define TABLEVIEWBACKGROUNDCOLOR UIColorFromRGB(0xEFEFEF)
#define NAVIGATIONBACKCOLOR UIColorFromRGB(0x343640)
//清除背景色
#define CLEARCOLOR [UIColor clearColor]


//----------------------颜色类--------------------------



//----------------------其他----------------------------

//系统字号
#define SYS_FONT(F) [UIFont systemFontOfSize:F]
#define BOLD_FONT(F) [UIFont boldSystemFontOfSize:F]


//G－C－D
#define BACK(block) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)
#define MAIN(block) dispatch_async(dispatch_get_main_queue(),block)

//NSUserDefaults 实例化
#define USER_DEFAULT [NSUserDefaults standardUserDefaults]

//弱引用self
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self

//缩放比例
#define Rate SCREEN_WIDTH / 375
#define iPhone5Size(size) SCREEN_WIDTH == 320 ? size * Rate : size

#define KEYWINDOW [UIApplication sharedApplication].keyWindow
//由角度获取弧度 有弧度获取角度
#define degreesToRadian(x) (M_PI * (x) / 180.0)
#define radianToDegrees(radian) (radian*180.0)/(M_PI)




//----------------------用户----------------------------

//#define APPKEY      @"612fe25e-ec73-4013-bf07-6008af26d085"//这个我的消息没有权限
//#define AppSecret   @"ebac13f1-8f5d-4c2d-9ab6-ba2daef38509"

#define APPKEY      @"wenp"
#define AppSecret   @"wenp"

#define USERTOKEN_KEY @"access_token"
#define USERTOKEN   [USER_DEFAULT objectForKey:USERTOKEN_KEY]

#define COMPANYCOUNT @"home_company_count"
#define DEVICECOUNT @"home_device_count"

#endif /* Define_h */
