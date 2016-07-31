//
//  WeatherViewController.m
//  RaiseMeWeatherThing
//
//  Created by Michael on 7/28/16.
//  Copyright © 2016 iCA. All rights reserved.
//

#import "WeatherViewController.h"
#import "CityWeather.h"
#import "Weather.h"
#import "ForcastForACityViewController.h"

@interface WeatherViewController () <UITableViewDataSource, UITableViewDelegate>
    @property (weak, nonatomic) IBOutlet UITableView *tableView;
    @property (weak, nonatomic) IBOutlet UIImageView *imageView;

    @property Weather *weather;
@end

@implementation WeatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    [self selectImageofCity:0];
    
     self.weather = [Weather new];
    

    // Add San Francisco
    self.weather.zipcode = @"94111";
    
    [self.weather importJsonFileWithCompletion:^(CityWeather *cityWeather)  {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];

        });
    }];
    
    // Add San Diego
    self.weather.zipcode = @"92103";
    
    [self.weather importJsonFileWithCompletion:^(CityWeather *cityWeather)  {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
            
        });
    }];
    
    // Add New York
    self.weather.zipcode = @"10004";
    
    [self.weather importJsonFileWithCompletion:^(CityWeather *cityWeather)  {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
            
        });
    }];

 
}




-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.weather.weatherInAllCities.count;
}



-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    CityWeather *cityWeather = self.weather.weatherInAllCities[indexPath.row];
    cell.textLabel.text = cityWeather.city;
    
    NSArray *currentWeather = cityWeather.forcastByDay.firstObject[@"weather"];
    cell.detailTextLabel.text = currentWeather.firstObject[@"main"];
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self selectImageofCity:indexPath.row];
}




-(void)selectImageofCity:(long )index
{
    CityWeather *cityWeather = self.weather.weatherInAllCities[index];
    NSString *city = cityWeather.city;
    
    if ([city isEqualToString:@"San Francisco"]) {
        self.imageView.image = [UIImage imageNamed:@"San Francisco.jpg"];
    } else if ([city isEqualToString:@"New York"]){
        self.imageView.image = [UIImage imageNamed:@"New york 22.jpg"];
    } else if ([city isEqualToString:@"San Diego"]){
        self.imageView.image = [UIImage imageNamed:@"SanDiego2.jpg"];
    } else if ([city isEqualToString:@"Boston"]){
        self.imageView.image = [UIImage imageNamed:@"Boston.jpg"];
    }
}




#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    ForcastForACityViewController *destVC = segue.destinationViewController;
    NSIndexPath *indexPathOfSelectedRow = [self.tableView indexPathForSelectedRow];
    CityWeather *cityWeather = self.weather.weatherInAllCities[indexPathOfSelectedRow.row];
    destVC.cityWeatherForcast = cityWeather.forcastByDay;
    
}





@end
