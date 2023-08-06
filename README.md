# SOSwift

A swift implementation of Schema.org structured data vocabulary.

[![Swift](https://github.com/richardpiazza/SOSwift/actions/workflows/swift.yml/badge.svg?branch=main)](https://github.com/richardpiazza/SOSwift/actions/workflows/swift.yml)


## Usage

**SOSwift** is distributed using the [Swift Package Manager](https://swift.org/package-manager). To install it into a project, add it as a 
dependency within your `Package.swift` manifest:

```swift
let package = Package(
    ...
    dependencies: [
        .package(url: "https://github.com/richardpiazza/SOSwift.git", .upToNextMajor(from: "3.0.0"))
    ],
    ...
)
```

Then import the **SOSwift** package wherever you'd like to use it:

```swift
import SOSwift
```

### Schema.org

Schema.org is a collaborative, community activity with a mission to create, maintain, and promote schemas for structured data on the 
Internet, on web pages, in email messages, and beyond. This library implements some of the core vocabulary in the Swift language.
This work is based on the 3.4 version of the Schema.org vocabulary, and currently implements only the top level core `Thing` subclasses.

### Significant Differences

Although this body of work tries to adhere as closely as possible to the defined vocabulary, some changes are required to make the API feel 
_swifty_.

__Float__

Schema.org uses 'Float' as it's floating-point decimal type. 'Double' is the standard floating-point type in Swift, so double replaces all 
instances of float.

__Has/Is__

Many of the classes use a has/is prefix on non-boolean variable names. This vocabulary removes these prefixes.

__Pluralization__

Classes with singular names of clearly arrays of types has been pluralized for clarity and consistency.
