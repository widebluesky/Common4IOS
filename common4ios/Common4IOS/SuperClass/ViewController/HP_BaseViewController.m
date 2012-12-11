//
//  HP_BaseViewController.m
//  shise
//
//  Created by Yi Xu on 12-10-30.
//  Copyright (c) 2012年 Yi Xu. All rights reserved.
//

#import "HP_BaseViewController.h"

@interface HP_BaseViewController ()

@end

@implementation HP_BaseViewController

@synthesize passNameValuePair;
@synthesize progressView;

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

// getScreenValue 获得屏幕相关数值
-(CGRect) getScreenRect{
    return [[UIScreen mainScreen]bounds];
}

-(CGSize) getScreenSize{
    return [self getScreenRect].size;
}

-(CGFloat) getScreenScale{
    return [UIScreen mainScreen].scale;
}

-(CGFloat) getScreenWidthPixels{
    return [self getScreenScale] * [self getScreenSize].width;
}

-(CGFloat) getScreenHeightPixels{
    return [self getScreenScale] * [self getScreenSize].height;
}

// 返回参数 放入dictionary
-(void) onPopViewControllerDelegate:(NSMutableDictionary *)dictionary{
    //popViewController 返回参数 放入dictionary
}

// 显示简单的alertView
-(void)showSimpleAlertViewWithTitle:(NSString *)title alertMessage:(NSString *)msg cancelButtonTitle:(NSString *) cancelTitle otherButtonTitles:(NSString *)otherButtonTitles, ...{
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:msg delegate:self cancelButtonTitle:cancelTitle otherButtonTitles:otherButtonTitles,nil];
    [alertView show];
}

// 显示简单的debugView
-(void)showDebugAlertViewWithMessage:(NSString *)msg isContinue:(BOOL) isContinue{
    
    [self showSimpleAlertViewWithTitle:@"Debug" alertMessage:msg cancelButtonTitle:@"确定" otherButtonTitles:nil];
    if(!isContinue){
        return;
    }
}

// 显示简单的progressView
-(void)showSimpleProgressViewWithMessage:(NSString *)msg{
    progressView = [[UIAlertView alloc] initWithTitle:nil message: msg delegate: self cancelButtonTitle: nil otherButtonTitles: nil];
    
    UIActivityIndicatorView *activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    
    activityView.frame = CGRectMake(120.f, 48.0f, 37.0f, 37.0f);
    
    [progressView addSubview:activityView];
    
    [activityView startAnimating];
    [progressView show];
}


@end
