//
//  HP_AFNetWorkingUtils.h
//  common4ios
//
//  Created by Yi Xu on 12-11-12.
//  Copyright (c) 2012年 Yi Xu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPClient.h"
#import "AFJSONRequestOperation.h"
#import "AFXMLRequestOperation.h"
#import "AFPropertyListRequestOperation.h"

static NSString *HP_POST_METHOD = @"POST";
static NSString *HP_GET_METHOD = @"GET";

typedef void (^JSONRequestSuccessBlock)(NSURLRequest *request, NSHTTPURLResponse *response, id JSON);
typedef void (^JSONRequestFailureBlock)(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON);

typedef void (^XMLRequestSuccessBlock)(NSURLRequest *request, NSHTTPURLResponse *response, NSXMLParser *XMLParser);

typedef void (^XMLRequestFailureBlock)(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, NSXMLParser *XMLParser);

typedef void (^PropertyListRequestSuccessBlock)(NSURLRequest *request, NSHTTPURLResponse *response, id propertyList);

typedef void (^PropertyListRequestFailureBlock)(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id propertyList);

typedef void (^HTTPRequestSuccessBlock)(AFHTTPRequestOperation *operation, id responseObject);

typedef void (^HTTPRequestFailureBlock)(AFHTTPRequestOperation *operation, NSError *error);

@interface HP_AFNetWorkingUtils : NSObject
{

}

-(void)getJSONDataByURL:(NSString *)urlStr JSONRequestSuccessBlock:(JSONRequestSuccessBlock)JSONRequestSuccessBlock JSONRequestFailureBlock:(JSONRequestFailureBlock) JSONRequestFailureBlock;

-(void)getJSONDataByURL:(NSString *)urlStr parameters:(NSMutableDictionary *) parametersDictionary requestWithMethod:(NSString *) method JSONRequestSuccessBlock:(JSONRequestSuccessBlock)JSONRequestSuccessBlock JSONRequestFailureBlock:(JSONRequestFailureBlock) JSONRequestFailureBlock;

-(void)getXMLDataByURL:(NSString *)urlStr XMLRequestSuccessBlock:(XMLRequestSuccessBlock)XMLRequestSuccessBlock XMLRequestFailureBlock:(XMLRequestFailureBlock) XMLRequestFailureBlock;

-(void)getPropertyListDataByURL:(NSString *)urlStr PropertyListRequestSuccessBlock:(PropertyListRequestSuccessBlock)PropertyListRequestSuccessBlock PropertyListRequestFailureBlock:(PropertyListRequestFailureBlock) PropertyListRequestFailureBlock;

-(void) getHTTPRequestDataByURL : (NSString *)urlStr parameters:(NSMutableDictionary *) parametersDictionary requestWithMethod:(NSString *) method HTTPRequestSuccessBlock:(HTTPRequestSuccessBlock)HTTPRequestSuccessBlock HTTPRequestFailureBlock:(HTTPRequestFailureBlock)HTTPRequestFailureBlock;

@end
