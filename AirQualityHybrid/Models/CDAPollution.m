//
//  CDAPollution.m
//  AirQualityHybrid
//
//  Created by Chris Anderson on 12/4/19.
//  Copyright © 2019 Renaissance Apps. All rights reserved.
//

#import "CDAPollution.h"

@implementation CDAPollution

- (instancetype)initWithNumber:(NSNumber *)aqi
{
    self = [super init];
    if (self)
    {
        _airQualityIndex = aqi;
    }
    return self;
}

@end

@implementation CDAPollution (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    NSNumber *aqi = dictionary[@"aqius"];
    
    return [self initWithNumber:aqi];
}

@end
