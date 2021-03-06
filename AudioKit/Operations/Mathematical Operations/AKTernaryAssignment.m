//
//  AKTernaryAssignment.m
//  FirstPhrases
//
//  Created by Adam Boulanger on 1/28/15.
//  Copyright (c) 2015 fxpal. All rights reserved.
//

#import "AKTernaryAssignment.h"

@implementation AKTernaryAssignment
{
    AKTernaryRelationalOperatorType relationalOperator;
    AKParameter *lhs;
    
    AKParameter *ref;
    AKParameter *comp;
    AKParameter *assignTrue;
    AKParameter *assignFalse;
}

- (instancetype)initWithOutput:(AKParameter *)output
                    ifConstant:(AKConstant *)reference
                    isLessThan:(AKConstant *)comparison
                 trueCondition:(AKParameter *)thenAssign
                falseCondition:(AKParameter *)elseAssign
{
    self = [super initWithString:[self operationName]];
    if(self) {
        relationalOperator = AKTernaryRelationalOperatorTypeLessThan;
        
        lhs = output;
        ref = reference;
        comp = comparison;
        assignTrue = thenAssign;
        assignFalse = elseAssign;
    }
    return self;
}

- (instancetype)initWithOutput:(AKParameter *)output
                    ifConstant:(AKConstant *)reference
                 isGreaterThan:(AKConstant *)comparison
                 trueCondition:(AKParameter *)thenAssign
                falseCondition:(AKParameter *)elseAssign
{
    self = [super initWithString:[self operationName]];
    if(self) {
        relationalOperator = AKTernaryRelationalOperatorTypeGreaterThan;
        
        lhs = output;
        ref = reference;
        comp = comparison;
        assignTrue = thenAssign;
        assignFalse = elseAssign;
    }
    return self;
}

// Csound Prototype: xlhs = (ref (operator) comp ? assignTrue : assignFalse)
- (NSString *)stringForCSD
{
    NSString *op;
    switch (relationalOperator) {
        case AKTernaryRelationalOperatorTypeLessThan:
            op = [NSString stringWithFormat:@" < "];
            break;
        case AKTernaryRelationalOperatorTypeLessThanOrEqual:
            op = [NSString stringWithFormat:@" <= "];
            break;
        case AKTernaryRelationalOperatorTypeGreaterThan:
            op = [NSString stringWithFormat:@" > "];
            break;
        case AKTernaryRelationalOperatorTypeGreaterThanOrEqual:
            op = [NSString stringWithFormat:@" >= "];
            break;
        case AKTernaryRelationalOperatorTypeEqual:
            op = [NSString stringWithFormat:@" == "];
            break;
        default:
            break;
    }
    
    return [NSString stringWithFormat:@"%@ = (%@ %@ %@ ? %@ : %@)",
            lhs, ref, op, comp, assignTrue, assignFalse];
}

- (NSString *)description {
    return [lhs parameterString];
}

@end
