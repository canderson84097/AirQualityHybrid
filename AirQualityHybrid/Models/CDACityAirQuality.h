//
//  CityAirQuality.h
//  AirQualityHybrid
//
//  Created by Chris Anderson on 12/4/19.
//  Copyright © 2019 Renaissance Apps. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CDAWeather;
@class CDAPollution;

NS_ASSUME_NONNULL_BEGIN

@interface CDACityAirQuality : NSObject

@property (nonatomic, readonly, copy) NSString *city;
@property (nonatomic, readonly, copy) NSString *state;
@property (nonatomic, readonly, copy) NSString *country;
@property (nonatomic, readonly, copy) CDAWeather *weather;
@property (nonatomic, readonly, copy) CDAPollution *pollution;

- (instancetype) initWithCity: (NSString *)city state: (NSString *)state country: (NSString *)country weather: (CDAWeather *)weather pollution: (CDAPollution *)pollution;

@end

@interface CDACityAirQuality (JSONConvertable)

- (instancetype) initWithDictionary: (NSDictionary<NSString *, id> *)dictionary;

@end

NS_ASSUME_NONNULL_END
