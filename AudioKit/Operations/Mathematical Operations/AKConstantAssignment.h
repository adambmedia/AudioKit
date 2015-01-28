//
//  AKConstantAssignment.h
//  FirstPhrases
//
//  Created by Adam Boulanger on 1/28/15.
//  Copyright (c) 2015 fxpal. All rights reserved.
//

#import "AKParameter+Operation.h"

@interface AKConstantAssignment : AKConstant

/// Initialization Statement with both sides
/// @param output The left side of the equal sign.
/// @param input  The right side of the equal sign.
- (instancetype)initWithOutput:(AKParameter *)output
                         input:(AKParameter *)input;

/// Initialization Statement
/// @param input The right side of the equal sign.
- (instancetype)initWithInput:(AKParameter *)input;

@end
