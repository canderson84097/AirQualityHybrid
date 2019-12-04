//
//  CDAPollution.h
//  AirQualityHybrid
//
//  Created by Chris Anderson on 12/4/19.
//  Copyright © 2019 Renaissance Apps. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CDAPollution : NSObject

@property (nonatomic, readonly) NSNumber *airQualityIndex;

- (instancetype) initWithNumber: (NSNumber *)aqi;

@end

@interface CDAPollution (JSONConvertable)

- (instancetype) initWithDictionary: (NSDictionary<NSString *, id> *)dictionary;

@end

NS_ASSUME_NONNULL_END
