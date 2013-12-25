//
// Created by azu on 2013/12/25.
//


#import "TransformerAgent.h"
#import "BlockValueTransformer.h"


@implementation TransformerAgent {

}
- (instancetype)initWithName:(NSString *) name transformer:(BlockValueTransformer *) transformer {
    self = [super init];
    if (self == nil) {
        return nil;
    }

    _name = name;
    _transformer = transformer;

    [NSValueTransformer setValueTransformer:_transformer forName:_name];

    return self;
}

+ (instancetype)agentWithName:(NSString *) name transformer:(BlockValueTransformer *) transformer {
    return [[self alloc] initWithName:name transformer:transformer];
}


- (BlockValueTransformer *)transformerWithBlock:(BLValueTransformerBlock) transformationBlock {
    return nil;
}

- (BlockValueTransformer *)reversibleTransformerWithBlock:(BLValueTransformerBlock) transformationBlock {
    return nil;
}

- (BlockValueTransformer *)reversibleTransformerWithForwardBlock:(BLValueTransformerBlock) forwardBlock reverseBlock:(BLValueTransformerBlock) reverseBlock {
    return nil;
}


@end