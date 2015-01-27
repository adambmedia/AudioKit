//
//  AKRandomNumbers.h
//  AudioKit
//
//  Auto-generated on 1/3/15.
//  Copyright (c) 2015 Aurelius Prochazka. All rights reserved.
//

#import "AKAudio.h"
#import "AKParameter+Operation.h"

/** Generates a controlled pseudo-random number series between min and max values.

 More detailed description from http://www.csounds.com/manual/html/random.html
 */

@interface AKRandomNumbers : AKAudio
/// Instantiates the random numbers with all values
/// @param lowerBound Minimum range limit. Updated at Control-rate. [Default Value: 0]
/// @param upperBound Maximum range limit. Updated at Control-rate. [Default Value: 1]
- (instancetype)initWithLowerBound:(AKParameter *)lowerBound
                        upperBound:(AKParameter *)upperBound;

/// Instantiates the random numbers with default values
- (instancetype)init;

/// Instantiates the random numbers with default values
+ (instancetype)numbers;


/// Minimum range limit. [Default Value: 0]
@property AKParameter *lowerBound;

/// Set an optional lower bound
/// @param lowerBound Minimum range limit. Updated at Control-rate. [Default Value: 0]
- (void)setOptionalLowerBound:(AKParameter *)lowerBound;

/// Maximum range limit. [Default Value: 1]
@property AKParameter *upperBound;

/// Set an optional upper bound
/// @param upperBound Maximum range limit. Updated at Control-rate. [Default Value: 1]
- (void)setOptionalUpperBound:(AKParameter *)upperBound;

/// Global seed for all AudioKit random number generators. [Default: 0, randomized by system clock]
@property AKParameter *seed;

/// Set an optional global seed value
/// @param seed Resets global seed value, shared amongst all instances of AudioKit random number generators. Must be between 0 and 2^32. Yields the same values on each instantiation of an instrument.  seedValue is set to 0 if using optional system clock.
- (void)setOptionalSeedValue:(AKParameter *)seedValue;

@end
