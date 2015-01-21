//
//  AKFunctionTable.m
//  AudioKit
//
//  Created by Aurelius Prochazka on 4/12/12.
//  Copyright (c) 2012 Aurelius Prochazka. All rights reserved.
//

#import "AKFunctionTable.h"

@implementation AKFunctionTable
{
    AKFunctionTableType igen;
    AKConstant *output;
}

- (instancetype)initWithType:(AKFunctionTableType)functionTableType
                        size:(int)tableSize
                  parameters:(AKArray *)parameters
{
    self = [super init];
    if (self) {
        output = [AKConstant globalParameterWithString:[self functionName]];
        _size = tableSize;
        igen = functionTableType;
        _parameters = parameters;
        _isNormalized = NO;
    }
    return self;
}

- (instancetype)initWithType:(AKFunctionTableType)functionTableType
                  parameters:(AKArray *)parameters
{
    return [self initWithType:functionTableType size:0 parameters:parameters];
}

- (instancetype)initWithType:(AKFunctionTableType)functionTableType
{
    AKArray *parameters = [[AKArray alloc] init];
    return [self initWithType:functionTableType size:0 parameters:parameters];
}

- (instancetype)initWithFunctionTable:(AKFunctionTable *)functionTable
{
    AKFunctionTableType type = functionTable->igen;
    AKArray *parametersCopy = [[AKArray alloc] init];

    //fails because [functionTable.parameters.constancs count] is null if the functiontable was a child of the parent, AKFunctionTable
    //parameters doesnt get set directly on the creation of a child function table
    //therefore, in an instrument code such as the following cannot work:
    // AKFunctionTable *lineSegmentCopy = [AKFunctionTable alloc] initWithFunctionTable:myLineSegmentTable];
    NSLog(@"constants count: %lu", [functionTable.parameters.constants count]);

    for (uint i=0; i<[functionTable.parameters.constants count];i++) {
        [parametersCopy addConstant: [functionTable.parameters.constants objectAtIndex:i]];
    }
    
    return [self initWithType:type
                         size:functionTable.size
                   parameters:parametersCopy];
}

- (NSString *)functionName
{
    NSString *functionName = [NSString stringWithFormat:@"%@", [self class]];
    functionName = [functionName stringByReplacingOccurrencesOfString:@"AK" withString:@""];
    return functionName;
}

// Csound Prototype: ifno ftgen ip1, ip2dummy, isize, igen, iarga, iargb, ...
- (NSString *)stringForCSD
{
    if (_isNormalized) {
        igen = abs(igen);
    } else {
        igen = -abs(igen);
    }
    NSString *text;
    if (_parameters == nil) {
        text = [NSString stringWithFormat:@"%@ ftgen 0, 0, %i, %@",
                output, _size, akpi(igen)];
    } else {
        text = [NSString stringWithFormat:@"%@ ftgen 0, 0, %i, %@, %@",
                output, _size, akpi(igen), [_parameters parameterString]];
    }
    return text;
}

- (NSString *)description
{
    return [output parameterString];
}

- (AKConstant *)length
{
    AKConstant *new = [[AKConstant alloc] init];
    [new setParameterString:[NSString stringWithFormat:@"ftlen(%@)", output]];
    return new;
}

@end
