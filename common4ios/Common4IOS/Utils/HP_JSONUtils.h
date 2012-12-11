//
//  HP_JSONUtils.h
//  common4ios
//
//  Created by Yi Xu on 12-11-13.
//  Copyright (c) 2012年 Yi Xu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HP_JSONUtils : NSObject
{
    
}
-(NSData *)getJSONDataFromDictionary:(NSMutableDictionary *) dictionary;

-(NSData *)getJSONDataFromString:(NSString *) string encoding:(NSStringEncoding)encoding;

-(NSString *)getJSONStringFromDictionary:(NSMutableDictionary *) dictionary encoding:(NSStringEncoding)encoding;

-(NSDictionary *) getDictionaryFromJSONData:(NSData *) JSONData;

-(NSDictionary *) getDictionaryFromJSONString:(NSString *) JSONString encoding:(NSStringEncoding)encoding;

@end

