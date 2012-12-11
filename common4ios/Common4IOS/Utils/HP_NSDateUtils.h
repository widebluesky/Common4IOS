//
//  HP_NSDateUtils.h
//  common4ios
//
//  Created by Yi Xu on 12-11-19.
//  Copyright (c) 2012年 Yi Xu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HP_NSDateUtils : NSObject
{
//    NSTimeInterval secondsBetweenDates= [yesterDay timeIntervalSinceDate:now];
//    NSTimeInterval oneHour = 24*60*60;
}

+(BOOL)compareDate:(NSDate *)date1 isEarlierDate:(NSDate *) date2;

+(BOOL)compareTime:(NSTimeInterval)time1 isEarlierTime:(NSTimeInterval) time2;

+(BOOL)isLongerThen24Hours:(NSTimeInterval)time ;

+(NSDate *) getDateFromTimeInterval:(NSTimeInterval) interval;

+(NSTimeInterval) getTimeIntervalFromDate:(NSDate *)date;


@end
