//
//  HP_AFNetWorkingUtils.m
//  common4ios
//
//  Created by Yi Xu on 12-11-12.
//  Copyright (c) 2012年 Yi Xu. All rights reserved.
//

#import "HP_StringUtils.h"
#import "HP_AFNetWorkingUtils.h"

@implementation HP_AFNetWorkingUtils

-(void)getJSONDataByURL:(NSString *)urlStr JSONRequestSuccessBlock:(JSONRequestSuccessBlock)JSONRequestSuccessBlock JSONRequestFailureBlock:(JSONRequestFailureBlock) JSONRequestFailureBlock{
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlStr]];
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        
        JSONRequestSuccessBlock(request,response,JSON);
        
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        
        JSONRequestFailureBlock(request,response,error,JSON);
        
    }];
    
    [operation start];
    
}

-(void)getJSONDataByURL:(NSString *)urlStr parameters:(NSMutableDictionary *) parametersDictionary requestWithMethod:(NSString *) method JSONRequestSuccessBlock:(JSONRequestSuccessBlock)JSONRequestSuccessBlock JSONRequestFailureBlock:(JSONRequestFailureBlock) JSONRequestFailureBlock{
    
    NSURL *url = [NSURL URLWithString:urlStr];
    AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:url];
    
    NSMutableURLRequest *request = [httpClient requestWithMethod:method path:urlStr parameters:parametersDictionary];

    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        
        JSONRequestSuccessBlock(request,response,JSON);
        
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        
        JSONRequestFailureBlock(request,response,error,JSON);
        
    }];
    
    [operation start];
    
}


-(void)getXMLDataByURL:(NSString *)urlStr XMLRequestSuccessBlock:(XMLRequestSuccessBlock)XMLRequestSuccessBlock XMLRequestFailureBlock:(XMLRequestFailureBlock) XMLRequestFailureBlock{
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlStr]];
    AFXMLRequestOperation *operation = [AFXMLRequestOperation XMLParserRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, NSXMLParser *XMLParser) {
        
        XMLRequestSuccessBlock(request,response,XMLParser);
        
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, NSXMLParser *XMLParser) {
        
        XMLRequestFailureBlock(request,response,error,XMLParser);

    }];
    
    [operation start];
}

-(void)getPropertyListDataByURL:(NSString *)urlStr PropertyListRequestSuccessBlock:(PropertyListRequestSuccessBlock)PropertyListRequestSuccessBlock PropertyListRequestFailureBlock:(PropertyListRequestFailureBlock) PropertyListRequestFailureBlock{
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlStr]];
    AFPropertyListRequestOperation *operation =[AFPropertyListRequestOperation propertyListRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id propertyList) {
        
        PropertyListRequestSuccessBlock(request,response,propertyList);
        
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id propertyList) {
        
        PropertyListRequestFailureBlock(request,response,error,propertyList);
        
    }];
    [operation start];
}

-(void) getHTTPRequestDataByURL : (NSString *)urlStr parameters:(NSMutableDictionary *) parametersDictionary requestWithMethod:(NSString *) method HTTPRequestSuccessBlock:(HTTPRequestSuccessBlock)HTTPRequestSuccessBlock HTTPRequestFailureBlock:(HTTPRequestFailureBlock)HTTPRequestFailureBlock{

    NSURL *url = [NSURL URLWithString:urlStr];
    AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:url];

    NSMutableURLRequest *request = [httpClient requestWithMethod:method path:urlStr parameters:parametersDictionary];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject){
        HTTPRequestSuccessBlock(operation,responseObject);
                
    }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        HTTPRequestFailureBlock(operation,error);
    }];
    [operation start];

}



@end
