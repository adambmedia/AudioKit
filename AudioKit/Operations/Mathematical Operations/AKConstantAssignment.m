//
//  AKConstantAssignment.m
//  FirstPhrases
//
//  Created by Adam Boulanger on 1/28/15.
//  Copyright (c) 2015 fxpal. All rights reserved.
//

#import "AKConstantAssignment.h"

@implementation AKConstantAssignment

{
    AKConstant *lhs;
    AKParameter *rhs;
}

- (instancetype)initWithOutput:(AKConstant *)output
                         input:(AKParameter *)input {
    self = [super initWithString:[self operationName]];
    
    if (self) {
        lhs = output;
        rhs = input;
    }
    return self;
}

- (instancetype)initWithInput:(AKParameter *)input {
    self = [super initWithString:[self operationName]];
    
    if (self) {
        lhs = [AKConstant parameterWithString:[self operationName]];
        rhs = input;
    }
    return self;
}

- (NSString *)stringForCSD
{
    return [NSString stringWithFormat:@"%@ = %@", lhs, rhs];
}

- (NSString *)description {
    return [lhs parameterString];
}



@end
