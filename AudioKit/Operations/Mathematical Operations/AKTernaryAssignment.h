//
//  AKTernaryAssignment.h
//  FirstPhrases
//
//  Created by Adam Boulanger on 1/28/15.
//  Copyright (c) 2015 fxpal. All rights reserved.
//

#import "AKParameter+Operation.h"

typedef NS_ENUM(NSInteger, AKTernaryRelationalOperatorType) {
    AKTernaryRelationalOperatorTypeLessThan=1,
    AKTernaryRelationalOperatorTypeLessThanOrEqual=2,
    AKTernaryRelationalOperatorTypeGreaterThan=3,
    AKTernaryRelationalOperatorTypeGreaterThanOrEqual=4,
    AKTernaryRelationalOperatorTypeEqual=5
};

@interface AKTernaryAssignment : AKParameter

/// Initialization Statement with "less than" relational operator.
/// @param output The Parameter to set equal to the result of the conditional evaluation. Must have type agreement between true/false condition and output.
/// @param reference The left side of the relational operator.
/// @param comparison The Parameter to compare with the reference.
/// @param thenAssign The Parameter to assign if the expression is true.
/// @param elseAssign The Parameter to assign if the expression is false.
- (instancetype)initWithOutput:(AKParameter *)output
                    ifConstant:(AKConstant *)reference
                    isLessThan:(AKConstant *)comparison
                 trueCondition:(AKParameter *)thenAssign
                falseCondition:(AKParameter *)elseAssign;

/// Initialization Statement with "greater than" relational operator.
/// @param output The Parameter to set equal to the result of the conditional evaluation. Must have type agreement between true/false condition and output.
/// @param reference The left side of the relational operator.
/// @param comparison The Parameter to compare with the reference.
/// @param thenAssign The Parameter to assign if the expression is true.
/// @param elseAssign The Parameter to assign if the expression is false.
- (instancetype)initWithOutput:(AKParameter *)output
                    ifConstant:(AKConstant *)reference
                 isGreaterThan:(AKConstant *)comparison
                 trueCondition:(AKParameter *)thenAssign
                falseCondition:(AKParameter *)elseAssign;

@end