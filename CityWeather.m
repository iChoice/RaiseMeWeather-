//
//  CityWeather.m
//  RaiseMeWeatherThing
//
//  Created by Michael on 7/28/16.
//  Copyright © 2016 iCA. All rights reserved.
//

#import "CityWeather.h"

@implementation CityWeather


-(NSMutableArray *)forcastByDay
{
    if (! _forcastByDay  ) _forcastByDay  = [[NSMutableArray alloc] init];
    return _forcastByDay  ;
}



@end
