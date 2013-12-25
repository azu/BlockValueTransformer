# BlockValueTransformer

A block-based API for NSValueTransformer.

## Installation

``` sh
pod 'BlockValueTransformer', :git => 'https://github.com/azu/BlockValueTransformer.git'
```

## Usage

See Example and Tests.

``` objc
TransformerAgent *agent = [TransformerAgency register:@"test_transformer" forwardBlock:^id(NSString *object) {
    return [object uppercaseString];
} reverseBlock:^id(NSString *object) {
    return [object lowercaseString];
}];

NSValueTransformer *transformer = [NSValueTransformer valueTransformerForName:agent.name];
NSString *string = @"AbCdEf";
XCTAssertEqualObjects([transformer transformedValue:string], @"ABCDEF");
XCTAssertEqualObjects([transformer reverseTransformedValue:string], @"abcdef");
```

This library doesn't contain `TransformerAgency` and `TransformerAgent`.
These classes are example wrapper classes for `BlockValueTransformer`.

This library only contain `BlockValueTransformer` which is NSValueTransformer subclass.

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D

## License

MIT (Same as [Mantle](https://github.com/MantleFramework/Mantle "Mantle")) For more details, please read LICENSE file.