//
// Created by azu on 2013/12/25.
//


#import <XCTest/XCTest.h>
#import "TransformerAgency.h"
#import "TransformerAgent.h"

@interface TransformerAgentTest : XCTestCase
@end

@implementation TransformerAgentTest {
}


- (void)testRegisterTransformer {
    TransformerAgent *agent = [TransformerAgency register:@"test_transformer" forwardBlock:^id(NSString *object) {
        return [object uppercaseString];
    } reverseBlock:^id(NSString *object) {
        return [object lowercaseString];
    }];

    NSValueTransformer *transformer = [NSValueTransformer valueTransformerForName:agent.name];
    NSString *string = @"AbCdEf";
    XCTAssertEqualObjects([transformer transformedValue:string], @"ABCDEF");
    XCTAssertEqualObjects([transformer reverseTransformedValue:string], @"abcdef");
}
@end
