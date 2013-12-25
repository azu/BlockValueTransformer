//
// Created by azu on 2013/12/25.
//


#import <Foundation/Foundation.h>
#import "BlockValueTransformer.h"

@class BlockValueTransformer;


@interface TransformerAgent : NSObject
@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, copy, readonly) BlockValueTransformer *transformer;

- (instancetype)initWithName:(NSString *) name transformer:(BlockValueTransformer *) transformer;

+ (instancetype)agentWithName:(NSString *) name transformer:(BlockValueTransformer *) transformer;

@end