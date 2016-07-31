//
//  Weather.m
//  RaiseMeWeatherThing
//
//  Created by Michael on 7/28/16.
//  Copyright © 2016 iCA. All rights reserved.
//

#import "Weather.h"

@interface Weather()
@end

@implementation Weather

-(NSMutableArray *)weatherInAllCities
{
    if (! _weatherInAllCities  ) _weatherInAllCities  = [[NSMutableArray alloc] init];
    return _weatherInAllCities  ;
}





-(void)importJsonFileWithCompletion:(void (^)(CityWeather *))completed

{
    NSString *urlString = [NSString stringWithFormat:@"http://api.openweathermap.org/data/2.5/forecast/city?zip=%@&APPID=b30904280f1a22b909a65b11b46a84b1",self.zipcode];
    NSURL *url = [NSURL URLWithString:urlString];
 // NSURL *url = [NSURL URLWithString:@"http://api.openweathermap.org/data/2.5/forecast/city?zip=94110&APPID=b30904280f1a22b909a65b11b46a84b1"];
   
    NSURLSessionTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url
                                                         completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                                             
                                                             NSDictionary *weatherJSONDictionary = [NSJSONSerialization JSONObjectWithData:data
                                                                                                                       options:NSJSONReadingAllowFragments
                                                                                                                         error: &error];
                                                             
                                                             NSDictionary *cityInfo = weatherJSONDictionary[@"city"];
                                                             NSString *cityName = cityInfo[@"name"];
                                                             
                                                             // Peel out the location and turn it into a CLLocation object.
                                                             NSDictionary *coordinates = cityInfo[@"coord"];
                                                             CLLocation *location = [[CLLocation alloc] initWithLatitude:[coordinates[@"lat"] doubleValue]
                                                                                                             longitude:[coordinates[@"lon"] doubleValue]];
                                                             
                                                             NSArray *weatherForcast = weatherJSONDictionary[@"list"];
                                                             
                                                             // Build a city Weather object - all the weather information for one city.
                                                             CityWeather *cityWeather = [CityWeather new];
                                                             cityWeather.city = cityName;
                                                             cityWeather.location = location;
                                                             [cityWeather.forcastByDay addObjectsFromArray:weatherForcast];
                                                             
                                                             [self.weatherInAllCities addObject:cityWeather];
                                                             
                                                             if (! error) {
                                                                 completed(cityWeather);
                                                             }
                                                             else
                                                             {
                                                                 NSLog(@"Something when wrong with JSON import: %@",error.localizedDescription);
                                                             }
                                                         }
                              ];
    [task resume];
    
};





@end

