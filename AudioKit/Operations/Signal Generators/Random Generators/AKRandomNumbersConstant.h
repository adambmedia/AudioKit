//
//  AKRandomNumbersConstant.h
//  FirstPhrases
//
//  Created by Adam Boulanger on 1/28/15.
//  Copyright (c) 2015 fxpal. All rights reserved.
//

#import "AKConstant.h"
#import "AKParameter+Operation.h"

/** Generates a controlled pseudo-random number series between min and max values.
 
 More detailed description from http://www.csounds.com/manual/html/random.html
 */

@interface AKRandomNumbersConstant : AKConstant
/// Instantiates the random numbers with all values
/// @param lowerBound Minimum range limit. Updated at Control-rate. [Default Value: 0]
/// @param upperBound Maximum range limit. Updated at Control-rate. [Default Value: 1]
- (instancetype)initWithLowerBound:(AKConstant *)lowerBound
                        upperBound:(AKConstant *)upperBound;

/// Instantiates the random numbers with default values
- (instancetype)init;

/// Instantiates the random numbers with default values
+ (instancetype)numbers;


/// Minimum range limit. [Default Value: 0]
@property AKConstant *lowerBound;

/// Set an optional lower bound
/// @param lowerBound Minimum range limit. Updated at Control-rate. [Default Value: 0]
- (void)setOptionalLowerBound:(AKConstant *)lowerBound;

/// Maximum range limit. [Default Value: 1]
@property AKConstant *upperBound;

/// Set an optional upper bound
/// @param upperBound Maximum range limit. Updated at Control-rate. [Default Value: 1]
- (void)setOptionalUpperBound:(AKConstant *)upperBound;


@end
