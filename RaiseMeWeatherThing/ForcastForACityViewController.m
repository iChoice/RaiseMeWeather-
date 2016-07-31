//
//  ForcastForACityViewController.m
//  RaiseMeWeatherThing
//
//  Created by Michael on 7/31/16.
//  Copyright © 2016 iCA. All rights reserved.
//

#import "ForcastForACityViewController.h"


@interface ForcastForACityViewController ()
    @property (weak, nonatomic) IBOutlet UIImageView *imageView;
    @property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation ForcastForACityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.cityWeatherForcast.count > 0)
        [self selectImageForWeather:0];
}


#pragma mark Table View Delegates
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.cityWeatherForcast.count;
}


-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
   
    NSDictionary *dayForcast = self.cityWeatherForcast[indexPath.row];
    NSArray *dayWeather = dayForcast[@"weather"];
    
    NSString *dateStr = dayForcast[@"dt_txt"];
    // Convert string to date object
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy/MM/dd HH:mm:ss"];
    NSDate *date = [dateFormat dateFromString:dateStr];

    
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"MM/dd/yyyy HH:mm a"];
    cell.textLabel.text  = [format stringFromDate:date];
    
    NSString *weatherDescription =dayWeather.firstObject[@"description"];
    cell.detailTextLabel.text = weatherDescription;

    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self selectImageForWeather:indexPath.row];
}


#pragma mark General Methods
-(void)selectImageForWeather:(long )index
{
    NSDictionary *dayForcast = self.cityWeatherForcast[index];
    NSArray *dayWeather = dayForcast[@"weather"];
    
    NSString *weatherDescription =dayWeather.firstObject[@"description"];
    
    if ([weatherDescription isEqualToString:@"clear sky"]) {
        self.imageView.image = [UIImage imageNamed:@"sunshine skiing.jpg"];
    } else if ([weatherDescription isEqualToString:@"light rain"]){
        self.imageView.image = [UIImage imageNamed:@"rainOnGlass 2.jpg"];
    } else if ([weatherDescription containsString:@"rain"]){
        self.imageView.image = [UIImage imageNamed:@"Water-droplets-on-glass-ipad-wallpaper-ilikewallpaper_com.jpeg"];
    } else if ([weatherDescription isEqualToString:@"scattered clouds"]){
        self.imageView.image = [UIImage imageNamed:@"Scattered Clouds.jpg"];
    } else if ([weatherDescription isEqualToString:@"few clouds"]){
        self.imageView.image = [UIImage imageNamed:@"few clouds.jpg"];
    } else if ([weatherDescription isEqualToString:@"broken clouds"]){
        self.imageView.image = [UIImage imageNamed:@"few clouds.jpg"];
    }
}



@end
