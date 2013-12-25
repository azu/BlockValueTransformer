//
// Created by azu on 2013/12/25.
//


#import <Foundation/Foundation.h>
#import "BlockValueTransformer.h"

@class TransformerAgent;


@interface TransformerAgency : NSObject
+ (TransformerAgent *)register:(NSString *) name transformerWithBlock:(BLValueTransformerBlock) transformationBlock;

+ (TransformerAgent *)register:(NSString *) name reversibleTransformerWithBlock:(BLValueTransformerBlock) transformationBlock;

+ (TransformerAgent *)register:(NSString *) name forwardBlock:(BLValueTransformerBlock) forwardBlock reverseBlock:(BLValueTransformerBlock) reverseBlock;
@end