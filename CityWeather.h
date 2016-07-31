//
//  CityWeather.h
//  RaiseMeWeatherThing
//
//  Created by Michael on 7/28/16.
//  Copyright © 2016 iCA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface CityWeather : NSObject
    @property (nonatomic,strong) NSString *city;
    @property (nonatomic,strong) NSString *country;
    @property (nonatomic, strong) CLLocation *location;
    @property double temp;
    @property (nonatomic,strong) NSMutableArray* forcastByDay;
@end
