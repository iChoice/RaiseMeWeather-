//
//  ForcastForACityViewController.h
//  RaiseMeWeatherThing
//
//  Created by Michael on 7/31/16.
//  Copyright © 2016 iCA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CityWeather.h"
#import "Weather.h"

@interface ForcastForACityViewController : UIViewController
    @property (nonatomic,strong) NSArray *cityWeatherForcast;
    @property Weather *weather;
@end
