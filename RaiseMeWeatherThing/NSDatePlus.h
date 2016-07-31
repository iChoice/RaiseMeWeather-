//
//  NSDatePlus.h
//  MAS
//
//  Created by Fog City Solutions on 5/20/13.
//  Copyright (c) 2013 FCS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDatePlus : NSDate


-(NSDate *)convertingStringToDate: (NSString *)sDate;  // Creates a NSDate from a string of date values
+(NSString *)dateOnlyString: (NSDate *)dDate; // Creates a string of just the date part of NSDate (I.E: "01/01/2013"
+(NSDate *)dateAtBeginningOfDayForDate:(NSDate *)inputDate; // Creates a date/time string of begining of the day:  "01/01/2013 00:00:01"  This way you can do a date compare of "greater then" to get all dates of today

+(NSDate *)dateAtBeginningOfDayForDateUTCTime:(NSDate *)inputDate; // Creates a date/time string of begining of the day:  "01/01/2013 00:00:01"  This way you can do a date compare of "greater then" to get all dates of today

+(BOOL)isToday:(NSDate *)dDate; // Returns true if the date passed is from today

+(NSString *)dateAndTimeString:(NSDate *)dDate;
+(NSString *)dateAndTimeStringWithSeconds:(NSDate *)dDate;

+(NSString *)timeOnly:(NSDate *)date
	   includeSeconds: (BOOL)incSeconds;


+(BOOL)thisDate:(NSDate *)firstdate
    isLaterThen:(NSDate *)seconddate;


+(BOOL)thisDate:(NSDate *)firstdate
  isEarlierThen:(NSDate *)seconddate;

@end
