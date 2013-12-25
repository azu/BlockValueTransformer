//
// Created by azu on 2013/12/25.
//


#import "TransformerAgency.h"
#import "TransformerAgent.h"


@implementation TransformerAgency {

}
+ (TransformerAgent *)register:(NSString *) name transformerWithBlock:(BLValueTransformerBlock) transformationBlock {
    BlockValueTransformer *transformer = [BlockValueTransformer transformerWithBlock:transformationBlock];
    return [TransformerAgent agentWithName:name transformer:transformer];
}

+ (TransformerAgent *)register:(NSString *) name reversibleTransformerWithBlock:(BLValueTransformerBlock) transformationBlock {
    BlockValueTransformer *transformer = [BlockValueTransformer reversibleTransformerWithBlock:transformationBlock];
    return [TransformerAgent agentWithName:name transformer:transformer];
}

+ (TransformerAgent *)register:(NSString *) name forwardBlock:(BLValueTransformerBlock) forwardBlock reverseBlock:(BLValueTransformerBlock) reverseBlock {
    BlockValueTransformer *transformer = [BlockValueTransformer reversibleTransformerWithForwardBlock:forwardBlock reverseBlock:reverseBlock];
    return [TransformerAgent agentWithName:name transformer:transformer];

}


@end