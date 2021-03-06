//
//  HP_StringUtils.m
//  common4ios
//
//  Created by Yi Xu on 12-11-12.
//  Copyright (c) 2012年 Yi Xu. All rights reserved.
//

#import "HP_StringUtils.h"

@implementation HP_StringUtils
{
    
}

+(NSString *) getStringUTF8ToGBK:(NSString *) string{
    return [string stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

+(NSString *) getStringGBKToUTF8:(NSString *) string{
    return [string stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

+(NSData *) getDataFromString:(NSString *) string encoding:(NSStringEncoding)encoding{
    //NSUTF32BigEndianStringEncoding
    return [string dataUsingEncoding:encoding];
}

+(NSString *) addPrefix:(NSString *) prefix withString:(NSString *) str{
    return [NSString stringWithFormat:@"%@%@",prefix,str];
}

+(NSString *) addSuffix:(NSString *) suffix withString:(NSString *) str{
    return [NSString stringWithFormat:@"%@%@",str,suffix];
}

+(CGSize)getTextSizeByString:(NSString *) string byFont:(UIFont *) font{
    return [string sizeWithFont:font constrainedToSize:CGSizeMake(MAXFLOAT, 30)];
}

+(CGSize)getTextSizeByString:(NSString *) string byFont:(UIFont *) font bySize:(CGSize) size{
    return [string sizeWithFont:font constrainedToSize:size lineBreakMode:UILineBreakModeWordWrap];
}

+(NSArray *)splitString:(NSString*) string withStr:(NSString*)str{
    return [string componentsSeparatedByString:str];
}

+(NSString *)getSubStringWithString:(NSString *) string from:(NSInteger)start to:(NSInteger)end{
    return  [string substringWithRange:NSMakeRange(start, end)];
}
@end
