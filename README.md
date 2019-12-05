# SOSwift

A swift implementation of Schema.org structured data vocabulary.

Schema.org is a collaborative, community activity with a mission to create, maintain, and promote schemas for structured data on the Internet, on web pages, in email messages, and beyond. This library implements some of the core vocabulary in the Swift language.

## How to Use

__Swift Package Manager__

```swift
.package(url: "https://github.com/richardpiazza/SOSwift", .upToNextMinor(from: "3.0.0"))
```

### Schema.org

This work is based on the 3.4 version of the Schema.org vocabulary, and currently implements only the top level core `Thing` subclasses.

### Significant Differences

Although this body of work trys to adhere as closly as possibile to the defined vocabulary, some changes are required to make the API feel swifty.

__Float__

Schema.org uses 'Float' as it's floating-point decimal type. 'Double' is the standard floating-point type in Swift, so double replaces all instances of float.

__Has/Is__

Many of the classes use a has/is prefix on non-boolan variable names. This vocabulary removes these prefixes.

__Pluralization__

Classes with singular names of clearly arrays of types has been plurarlized for clarity and consistency.
