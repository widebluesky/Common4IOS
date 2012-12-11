//
//  HP_BaseViewController.h
//  shise
//
//  Created by Yi Xu on 12-10-30.
//  Copyright (c) 2012年 Yi Xu. All rights reserved.
//

#define ScreenHeight [[UIScreen mainScreen] bounds].size.height
#define ScreenWidth [[UIScreen mainScreen] bounds].size.width
#define StateBarHeight 20
#define MainHeight (ScreenHeight - StateBarHeight)
#define MainWidth ScreenWidth

@protocol PopViewControllerDelegate <NSObject>

-(void)onPopViewControllerDelegate:(NSMutableDictionary *)dictionary;

@end

#import <UIKit/UIKit.h>

@interface HP_BaseViewController : UIViewController<PopViewControllerDelegate>
{
@private
    NSMutableDictionary *passNameValuePair;
    
    UIAlertView *progressView;
    
}

//传送数据Dictionary
@property (strong, nonatomic) NSMutableDictionary *passNameValuePair;

//返回数据代理
@property(nonatomic,assign) NSObject<PopViewControllerDelegate> *delegate;

@property (strong, nonatomic) UIAlertView *progressView;;

//获得屏幕Rect
-(CGRect) getScreenRect;

//获得屏幕Size
-(CGSize) getScreenSize;

//获得屏幕缩放比例，360/480
-(CGFloat) getScreenScale;

//简单的系统提示框
-(void)showSimpleAlertViewWithTitle:(NSString *)title alertMessage:(NSString *)msg cancelButtonTitle:(NSString *) cancelTitle otherButtonTitles:(NSString *)otherButtonTitles, ...;

//简单的debug提示框
-(void)showDebugAlertViewWithMessage:(NSString *)msg isContinue:(BOOL) isContinue;

//简单的加载提示框
-(void)showSimpleProgressViewWithMessage:(NSString *)msg;

@end

