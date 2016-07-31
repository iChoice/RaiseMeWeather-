//
//  Weather.h
//  RaiseMeWeatherThing
//
//  Created by Michael on 7/28/16.
//  Copyright © 2016 iCA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CityWeather.h"


@interface Weather : NSObject
    @property NSString *zipcode;
    @property (nonatomic) NSMutableArray *weatherInAllCities;
    -(void)importJsonFileWithZipcode:(NSString *)zipCode
                          completion:(void (^)(CityWeather *))complete;
@end
