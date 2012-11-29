//
//  HP_UserDefaultsUtils.h
//  blog
//
//  Created by Yi Xu on 12-11-25.
//  Copyright (c) 2012年 Yi Xu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HP_UserDefaultsUtils : NSObject

//存放小信息NSUserDefaults
-(NSUserDefaults *) getNSUserDefaults;

-(void) setDictionaryForNSUserDefaults:(NSMutableDictionary *) dictionary forKey:(NSString *)key;

-(void) setObjectForNSUserDefaults:(id) object forKey:(NSString *)key;

-(void) setStringForNSUserDefaults:(NSString *) string forKey:(NSString *)key;

@end
