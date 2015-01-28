//
//  AKRandomNumbersConstant.m
//  FirstPhrases
//
//  Created by Adam Boulanger on 1/28/15.
//  Copyright (c) 2015 fxpal. All rights reserved.
//

#import "AKRandomNumbersConstant.h"

@implementation AKRandomNumbersConstant

- (instancetype)initWithLowerBound:(AKConstant *)lowerBound
                        upperBound:(AKConstant *)upperBound
{
    self = [super initWithString:[self operationName]];
    if (self) {
        _lowerBound = lowerBound;
        _upperBound = upperBound;
    }
    return self;
}

- (instancetype)init
{
    self = [super initWithString:[self operationName]];
    if (self) {
        // Default Values
        _lowerBound = akp(0);
        _upperBound = akp(1);
    }
    return self;
}

+ (instancetype)numbers
{
    return [[AKRandomNumbersConstant alloc] init];
}

- (void)setOptionalLowerBound:(AKConstant *)lowerBound {
    _lowerBound = lowerBound;
}
- (void)setOptionalUpperBound:(AKConstant *)upperBound {
    _upperBound = upperBound;
}

- (NSString *)stringForCSD {
    NSMutableString *csdString = [[NSMutableString alloc] init];
    
    [csdString appendFormat:@"%@ random %@, %@", self, _lowerBound, _upperBound];
    return csdString;
}

@end
