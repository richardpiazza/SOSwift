# SOSwiftVocabulary
[![Version](https://img.shields.io/cocoapods/v/SOSwiftVocabulary.svg?style=flat)](http://cocoadocs.org/docsets/SOSwiftVocabulary)
[![Platform](https://img.shields.io/cocoapods/p/SOSwiftVocabulary.svg?style=flat)](http://cocoadocs.org/docsets/SOSwiftVocabulary)

The Schema.org structured data vocabulary defined as a series of swift protocols.

Schema.org is a collaborative, community activity with a mission to create, maintain, and promote schemas for structured data on the Internet, on web pages, in email messages, and beyond. This library implements some of the core vocabulary as a series of Swift protocols.

This work is based on the 3.4 version of the Schema.org vocabulary.

## How to Use

__CocoaPods__

    pod 'SOSwift', '~> 1.0'
    
__Swift Package Manager__

    .package(url: "https://github.com/richardpiazza/SOSwift", .upToNextMajor(from: "1.0.0"))


### Significant Differences

Although this body of work trys to adhere as closly as possibile to the defined vocabulary, some changes are required to make the API feel swifty.

__Float__

Schema.org uses 'Float' as it's floating-point decimal type. 'Double' is the standard floating-point type in Swift, so double replaces all instances of float.

__Has/Is__

Many of the classes use a has/is prefix on non-boolan variable names. This vocabulary removes these prefixes.

__Pluralization__

Classes with singular names of clearly arrays of types has been plurarlized for clarity and consistency.

