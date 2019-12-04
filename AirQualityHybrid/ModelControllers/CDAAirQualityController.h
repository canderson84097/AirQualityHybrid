//
//  CDAAirQualityController.h
//  AirQualityHybrid
//
//  Created by Chris Anderson on 12/4/19.
//  Copyright © 2019 Renaissance Apps. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CDACityAirQuality;

NS_ASSUME_NONNULL_BEGIN

@interface CDAAirQualityController : NSObject

+ (void) fetchSupportedCountries: (void (^) (NSArray<NSString *> *_Nullable))completion;

+ (void) fetchSupportedStatesInCountry: (NSString *)country completion: (void (^) (NSArray<NSString *> *_Nullable))completion;

+ (void) fetchSupportedCitiesInState: (NSString *)state country: (NSString *)country completion: (void (^) (NSArray<NSString *> *_Nullable))completion;

+ (void) fetchDataForCity: (NSString *)city
                    state: (NSString *)state
                  country: (NSString *)country
               completion: (void (^) (CDACityAirQuality *_Nullable))completion;

@end

NS_ASSUME_NONNULL_END
