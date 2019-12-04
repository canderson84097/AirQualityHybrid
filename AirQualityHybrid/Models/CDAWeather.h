//
//  CDAWeather.h
//  AirQualityHybrid
//
//  Created by Chris Anderson on 12/4/19.
//  Copyright © 2019 Renaissance Apps. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CDAWeather : NSObject

@property (nonatomic, readonly, copy) NSNumber *temperature;
@property (nonatomic, readonly, copy) NSNumber *humidity;
@property (nonatomic, readonly, copy) NSNumber *windSpeed;

- (instancetype) initWithTemperature: (NSNumber *)temperature humidity: (NSNumber *)humidity windSpeed: (NSNumber *)windSpeed;

@end

@interface CDAWeather (JSONConvertable)

- (instancetype) initWithDictionary: (NSDictionary<NSString *, id> *)dictionary;

@end

NS_ASSUME_NONNULL_END
