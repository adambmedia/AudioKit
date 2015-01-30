//
//  AKAssignment.m
//  AudioKit
//
//  Created by Aurelius Prochazka on 6/12/12.
//  Copyright (c) 2012 Aurelius Prochazka. All rights reserved.
//

#import "AKAssignment.h"

@implementation AKAssignment
{
    AKParameter *lhs;
    AKParameter *rhs;
    
    AKConstant *lhsConstant;
    AKConstant *rhsConstant;
}

- (instancetype)initWithOutput:(AKParameter *)output
                         input:(AKParameter *)input {
    self = [super initWithString:[self operationName]];
    
    if (self) {
        lhs = output;
        rhs = input;
    }
    return self; 
}

- (instancetype)initWithConstantOutput:(AKConstant *)output input:(AKConstant *)input {
    self = [super initWithString:[self operationName]];
    
    if(self) {
        lhsConstant = output;
        rhsConstant = input;
    }
    return self;
}

- (instancetype)initWithInput:(AKParameter *)input {
    self = [super initWithString:[self operationName]];
    
    if (self) {

        rhs = input;
        lhs = [AKParameter parameterWithString:[self operationName]];

    }
    return self;
}

- (instancetype)initWithConstantInput:(AKConstant *)input
{
    self = [super initWithString:[self operationName]];
    
    if(self) {
        lhsConstant = [AKConstant parameterWithString:[self operationName]];
        rhsConstant = input;
    }
    return self;
}

- (NSString *)stringForCSD
{
    if (lhs) {
        return [NSString stringWithFormat:@"%@ = %@", lhs, rhs];
    } else {
        return [NSString stringWithFormat:@"%@ = %@", lhsConstant, rhsConstant];
    }
}

- (NSString *)description {
    
    if (lhs) {
        return [lhs parameterString];
    } else {
        return [lhsConstant parameterString];
    }
}

@end
