//
//  HP_UIColorUtils.h
//  blog
//
//  Created by Yi Xu on 12-11-26.
//  Copyright (c) 2012年 Yi Xu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HP_UIColorUtils : UIColor

+ (CGFloat) colorComponentFrom: (NSString *) string start: (NSUInteger) start length: (NSUInteger) length;

+ (UIColor *) colorWithHexString: (NSString *) hexString;

@end
