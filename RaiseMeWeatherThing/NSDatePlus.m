//
//  NSDatePlus.m
//  MAS
//
//  Created by Fog City Solutions on 5/20/13.
//  Copyright (c) 2013 FCS. All rights reserved.
//

#import "NSDatePlus.h"


@implementation NSDatePlus


// Returns true if the date passed is from today
+(BOOL)isToday:(NSDate *)dDate
{
	BOOL dateIsToday = NO;
	if ( [ [self dateOnlyString:dDate] isEqualToString:[self dateOnlyString:[NSDate date]] ] )
		 dateIsToday = YES;
		 
	return dateIsToday;
}



// Get the exact time at midnight of this the date, so that you can do a "importedDate = date()" - and get all entries that were imported today
+ (NSDate *)dateAtBeginningOfDayForDate:(NSDate *)inputDate
{
    // Use the user's current calendar and time zone
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSTimeZone *timeZone = [NSTimeZone systemTimeZone];
    [calendar setTimeZone:timeZone];
	
    // Selectively convert the date components (year, month, day) of the input date
    NSDateComponents *dateComps = [calendar components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit fromDate:inputDate];
	
    // Set the time components manually
    [dateComps setHour:0];
    [dateComps setMinute:0];
    [dateComps setSecond:0];
	
    // Convert back
    NSDate *beginningOfDay = [calendar dateFromComponents:dateComps];
    return beginningOfDay;
}





// Get the exact time at midnight of this the date, so that you can do a "importedDate = date()" - and get all entries that were imported today
+ (NSDate *)dateAtBeginningOfDayForDateUTCTime:(NSDate *)inputDate
{
    // Use the user's current calendar and time zone
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"UTC"];
    [calendar setTimeZone:timeZone];
    
    // Selectively convert the date components (year, month, day) of the input date
    NSDateComponents *dateComps = [calendar components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit fromDate:inputDate];
    
    // Set the time components manually
    [dateComps setHour:0];
    [dateComps setMinute:0];
    [dateComps setSecond:0];
    
    // Convert back
    NSDate *beginningOfDay = [calendar dateFromComponents:dateComps];
    return beginningOfDay;
}




// Takes a string field and returns it as a date field.
-(NSDate *)convertingStringToDate: (NSString *)sDate
{
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init] ;
	// = [[NSDate alloc] init];
	[dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss Z"];
	NSDate *dDate = [dateFormatter dateFromString:sDate];
	
	return dDate;
	
}



+(NSString *)dateOnlyString: (NSDate *)dDate
{
	NSString *sDate = @"";
	NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
	[formatter setDateFormat:@"MM/dd/yyyy"];
	sDate = [formatter stringFromDate:dDate];
	// NSLog(@" %@",sDate);
	return sDate;
}


// Return a string of just the date and time, no zeros or seconds
//+(NSString *)dateAndTimeString:(NSDate *)dDate
//{
//	NSDateFormatter *format = [[NSDateFormatter alloc] init];
//	NSDate *fooDate = [dDate copy];
  //  [format setDateFormat:@"MM/dd/yyyy HH:mm a"];
  //  NSString *dateStr = [format stringFromDate:fooDate];
	
    //date = [format dateFromString:[format stringFromDate:date]];
   //  NSLog(@"My date is = %@",dateStr);
//	return dateStr;
//}


// Return a string of just the date and time, no zeros or seconds
+(NSString *)dateAndTimeStringWithSeconds:(NSDate *)dDate
{
	NSDateFormatter *format = [[NSDateFormatter alloc] init];
	NSDate *fooDate = [dDate copy];
    [format setDateFormat:@"MM/dd/yyyy HH:mm:ss"];
    NSString *dateStr = [format stringFromDate:fooDate];
	
    //date = [format dateFromString:[format stringFromDate:date]];
   //  NSLog(@"My date is = %@",dateStr);
	return dateStr;
}



+(NSString *)timeOnly:(NSDate *)date
	   includeSeconds: (BOOL)incSeconds
{
	NSDateFormatter *format = [[NSDateFormatter alloc] init];
	NSDate *fooDate = [date copy];
	if (incSeconds) [format setDateFormat:@"HH:mm:ss a"];
	else [format setDateFormat:@"HH:mm a"];
	
    NSString *dateStr = [format stringFromDate:fooDate];
	
	return dateStr;
}




+(BOOL)thisDate:(NSDate *)firstdate
  isEarlierThen:(NSDate *)seconddate

{
    BOOL firstDateEarlier = YES;
    if ([[firstdate earlierDate:seconddate] isEqualToDate: seconddate])
        firstDateEarlier = NO;
    
    return firstDateEarlier;
}




+(BOOL)thisDate:(NSDate *)firstdate
    isLaterThen:(NSDate *)seconddate

{
    BOOL firstDateLater = YES;
    if ([[firstdate laterDate:seconddate] isEqualToDate: seconddate])
        firstDateLater = NO;
    
    return firstDateLater;
}



@end
