//
//  MCConstants.h
//  MCConstants
//
//  Created by Chao Ma on 08/24/2016.
//  Copyright © 2016 iMegatron's Lab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

// Colors
#define UIColorFromRGB(rgbValue)    [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

static inline UIColor *buttonTitleColor() { return UIColorFromRGB(0x337af0); }

// Fonts
static inline UIFont *fontWithNameAndSize(NSString *fontName, CGFloat size){ return [UIFont fontWithName:fontName size:size]; }
static inline UIFont *font(CGFloat size) { return fontWithNameAndSize(@"Helvetica", size); }
static inline UIFont *lightFont(CGFloat size){ return fontWithNameAndSize(@"Helvetica-Light", size); }

// Version
#define SysVer          ([[UIDevice currentDevice] systemVersion])
#define MajorSysVer     ([[[UIDevice currentDevice] systemVersion] intValue])

// Log
#ifdef DEBUG
#define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#define DLog(...)
#endif

#define ALog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)

//Main Screen Size.
#define MainScreenWidth             ([[UIScreen mainScreen] bounds].size.width)
#define MainScreenHeight            ([[UIScreen mainScreen] bounds].size.height)

//Adapter Utils.
#define Scale2X                     (MainScreenWidth/320.0)
#define Scale2X_4_7_Inch            (MainScreenWidth/375.0)

//Main Size.
#define StatusbarHeight             [[UIApplication sharedApplication] statusBarFrame].size.height
#define NavigationBarHeight         44.f
#define TabbarHeight                49.f

//Util Size.
#define OnePointRect                CGRectMake(0, 0, 1, 1)
#define StaticFrame                 CGRectMake(0, NavigationBarHeight + (MajorSysVer >= 7 ? StatusbarHeight : 0), MainScreenWidth, MainScreenHeight - NavigationBarHeight - (MajorSysVer >= 7 ? StatusbarHeight : 0))
#define StaticFrameForTarBarPage    CGRectMake(0, NavigationBarHeight + (MajorSysVer >= 7 ? StatusbarHeight : 0), MainScreenWidth, MainScreenHeight - NavigationBarHeight - TabbarHeight - (MajorSysVer >= 7 ? StatusbarHeight : 0))

//Min touch size
#define kMinButtonSize              44.f

#define IndicatorTop                5

// APP
#define APP                         ((AppDelegate *)[UIApplication sharedApplication].delegate)
#define APP_KEY_WINDOW              ([UIApplication sharedApplication].keyWindow)

// String Utils
#define IsNullString(string)        (string == nil || string == (id)[NSNull null] || string.length == 0)
#define MakeNoNilString(string)     (string = (IsNullString(string) ? @"" : string))

// Math Utils
#define M_E         2.71828182845904523536028747135266250   /* e              */
#define M_LOG2E     1.44269504088896340735992468100189214   /* log2(e)        */
#define M_LOG10E    0.434294481903251827651128918916605082  /* log10(e)       */
#define M_LN2       0.693147180559945309417232121458176568  /* loge(2)        */
#define M_LN10      2.30258509299404568401799145468436421   /* loge(10)       */
#define M_PI        3.14159265358979323846264338327950288   /* pi             */
#define M_PI_2      1.57079632679489661923132169163975144   /* pi/2           */
#define M_PI_4      0.785398163397448309615660845819875721  /* pi/4           */
#define M_1_PI      0.318309886183790671537767526745028724  /* 1/pi           */
#define M_2_PI      0.636619772367581343075535053490057448  /* 2/pi           */
#define M_2_SQRTPI  1.12837916709551257389615890312154517   /* 2/sqrt(pi)     */
#define M_SQRT2     1.41421356237309504880168872420969808   /* sqrt(2)        */
#define M_SQRT1_2   0.707106781186547524400844362104849039  /* 1/sqrt(2)      */

