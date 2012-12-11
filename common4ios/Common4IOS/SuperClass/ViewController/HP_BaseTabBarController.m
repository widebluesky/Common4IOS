//
//  HP_BaseTabBarController.m
//  youyouapp
//
//  Created by Yi Xu on 12-11-30.
//  Copyright (c) 2012年 CuiYiLong. All rights reserved.
//

#import "HP_BaseTabBarController.h"
#import "HP_UserDefaultsUtils.h"

@interface HP_BaseTabBarController ()

@end

@implementation HP_BaseTabBarController

@synthesize passNameValuePair;
@synthesize progressView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

-(void)hideTabBar{
    [self.tabBarController.tabBar setHidden:YES];

    UIView *contentView;
    if ( [[self.view.subviews objectAtIndex:0] isKindOfClass:[UITabBar class]] )
        contentView = [self.view.subviews objectAtIndex:1];
    else
        contentView = [self.view.subviews objectAtIndex:0];
    [contentView setFrame:CGRectMake(0,0, ScreenWidth , ScreenHeight)];
}

-(NSUserDefaults *)getNSUserDefaults{
    return [NSUserDefaults standardUserDefaults];
}

-(void) setDictionaryForNSUserDefaults:(NSMutableDictionary *) dictionary forKey:(NSString *)key{
    [[self getNSUserDefaults] setObject:dictionary forKey:key];
}

-(void) setObjectForNSUserDefaults:(id) object forKey:(NSString *)key{
    [[self getNSUserDefaults] setObject:object forKey:key];
}

-(void) setStringForNSUserDefaults:(NSString *) string forKey:(NSString *)key{
    [[self getNSUserDefaults] setObject:string forKey:key];
}

-(id) getObjectFromNSUserDefaultsForKey:(NSString *)key{
    return [[self getNSUserDefaults] objectForKey:key];
}

-(NSString *) getStringFromNSUserDefaultsForKey:(NSString *)key{
    return [[self getNSUserDefaults] stringForKey:key];
}

-(NSDictionary *) getDictionaryFromNSUserDefaultsForKey:(NSString *)key{
    return [[self getNSUserDefaults] dictionaryForKey:key];
}

@end
