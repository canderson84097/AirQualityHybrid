//
//  CDAWeather.m
//  AirQualityHybrid
//
//  Created by Chris Anderson on 12/4/19.
//  Copyright © 2019 Renaissance Apps. All rights reserved.
//

#import "CDAWeather.h"

@implementation CDAWeather

- (instancetype)initWithTemperature:(NSNumber *)temperature humidity:(NSNumber *)humidity windSpeed:(NSNumber *)windSpeed
{
    self = [super init];
    if (self)
    {
        _temperature = temperature;
        _humidity = humidity;
        _windSpeed = windSpeed;
    }
    return self;
}

@end

@implementation CDAWeather (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    NSNumber *temperature = dictionary[@"tp"];
    NSNumber *humidity = dictionary[@"hu"];
    NSNumber *windSpeed = dictionary[@"ws"];
    
    return [self initWithTemperature:temperature humidity:humidity windSpeed:windSpeed];
}

@end
