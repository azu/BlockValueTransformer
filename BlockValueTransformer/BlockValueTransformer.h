//
//  BlockValueTransformer.h
//  BlockValueTransformer
//
//  Created by azu on 2013/12/25.
//  Original: Mantle Copyright (c) 2012 - 2013, GitHub, Inc.
//

#import <Foundation/Foundation.h>

typedef id (^BLValueTransformerBlock)(id object);

@interface BlockValueTransformer : NSValueTransformer
// Returns a transformer which transforms values using the given block. Reverse
// transformations will not be allowed.
+ (instancetype)transformerWithBlock:(BLValueTransformerBlock) transformationBlock;

// Returns a transformer which transforms values using the given block, for
// forward or reverse transformations.
+ (instancetype)reversibleTransformerWithBlock:(BLValueTransformerBlock) transformationBlock;

// Returns a transformer which transforms values using the given blocks.
+ (instancetype)reversibleTransformerWithForwardBlock:(BLValueTransformerBlock) forwardBlock reverseBlock:(BLValueTransformerBlock) reverseBlock;

@end
