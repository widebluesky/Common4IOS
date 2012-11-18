//
//  HP_StringUtils.h
//  common4ios
//
//  Created by Yi Xu on 12-11-12.
//  Copyright (c) 2012年 Yi Xu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HP_StringUtils : NSObject
{
    
}

+(NSString *) getStringUTF8ToGBK:(NSString *) string;

+(NSString *) getStringGBKToUTF8:(NSString *) string;

+(NSData *) getDataFromString:(NSString *) string encoding:(NSStringEncoding)encoding;

@end
