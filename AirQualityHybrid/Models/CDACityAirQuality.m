//
//  CityAirQuality.m
//  AirQualityHybrid
//
//  Created by Chris Anderson on 12/4/19.
//  Copyright © 2019 Renaissance Apps. All rights reserved.
//

#import "CDACityAirQuality.h"
#import "CDAWeather.h"
#import "CDAPollution.h"

@implementation CDACityAirQuality

- (instancetype)initWithCity:(NSString *)city state:(NSString *)state country:(NSString *)country weather:(CDAWeather *)weather pollution:(CDAPollution *)pollution
{
    self = [super init];
    if (self)
    {
        _city = city;
        _state = state;
        _country = country;
        _weather = weather;
        _pollution = pollution;
    }
    return self;
}

@end

@implementation CDACityAirQuality (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    // Linking our air quality class properties with the key name in our API.
    NSString *city = dictionary[@"city"];
    NSString *state = dictionary[@"state"];
    NSString *country = dictionary[@"country"];
    NSDictionary *currentData = dictionary[@"current"];
    
    // Accessing the weather and pollution dicts with their key words.
    CDAWeather *weather = [[CDAWeather alloc]initWithDictionary:currentData[@"weather"]];
    CDAPollution *pollution = [[CDAPollution alloc]initWithDictionary:currentData[@"pollution"]];
    
    // Returning with initialized values from our API data.
    return [self initWithCity:city state:state country:country weather:weather pollution:pollution];
}

@end
