//
//  BlockValueTransformer.m
//  BlockValueTransformer
//
//  Created by azu on 2013/12/25.
//  Original: Mantle Copyright (c) 2012 - 2013, GitHub, Inc.
//

#import "BlockValueTransformer.h"

//
// Any MTLValueTransformer supporting reverse transformation. Necessary because
// +allowsReverseTransformation is a class method.
//
@interface BlockReversibleValueTransformer : BlockValueTransformer
- (id)initWithForwardBlock:(BLValueTransformerBlock) forwardBlock reverseBlock:(BLValueTransformerBlock) reverseBlock;
@end

@interface BlockValueTransformer ()

@property(nonatomic, copy, readonly) BLValueTransformerBlock forwardBlock;
@property(nonatomic, copy, readonly) BLValueTransformerBlock reverseBlock;

@end

@implementation BlockValueTransformer

#pragma mark Lifecycle

+ (instancetype)transformerWithBlock:(BLValueTransformerBlock) transformationBlock {
    return [[self alloc] initWithForwardBlock:transformationBlock reverseBlock:nil];
}

+ (instancetype)reversibleTransformerWithBlock:(BLValueTransformerBlock) transformationBlock {
    return [self reversibleTransformerWithForwardBlock:transformationBlock reverseBlock:transformationBlock];
}

+ (instancetype)reversibleTransformerWithForwardBlock:(BLValueTransformerBlock) forwardBlock reverseBlock:(BLValueTransformerBlock) reverseBlock {
    return [[BlockReversibleValueTransformer alloc] initWithForwardBlock:forwardBlock reverseBlock:reverseBlock];
}

- (id)initWithForwardBlock:(BLValueTransformerBlock) forwardBlock reverseBlock:(BLValueTransformerBlock) reverseBlock {
    NSParameterAssert(forwardBlock != nil);

    self = [super init];
    if (self == nil) return nil;

    _forwardBlock = [forwardBlock copy];
    _reverseBlock = [reverseBlock copy];

    return self;
}

#pragma mark NSValueTransformer

+ (BOOL)allowsReverseTransformation {
    return NO;
}

+ (Class)transformedValueClass {
    return [NSObject class];
}

- (id)transformedValue:(id) value {
    return self.forwardBlock(value);
}

@end

@implementation BlockReversibleValueTransformer

#pragma mark Lifecycle

- (id)initWithForwardBlock:(BLValueTransformerBlock) forwardBlock reverseBlock:(BLValueTransformerBlock) reverseBlock {
    NSParameterAssert(reverseBlock != nil);
    return [super initWithForwardBlock:forwardBlock reverseBlock:reverseBlock];
}

#pragma mark NSValueTransformer

+ (BOOL)allowsReverseTransformation {
    return YES;
}

- (id)reverseTransformedValue:(id) value {
    return self.reverseBlock(value);
}
@end