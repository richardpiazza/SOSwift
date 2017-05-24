# SOSwift
[![Version](https://img.shields.io/cocoapods/v/SOSwift.svg?style=flat)](http://cocoadocs.org/docsets/SOSwift)
[![Platform](https://img.shields.io/cocoapods/p/SOSwift.svg?style=flat)](http://cocoadocs.org/docsets/SOSwift)

A swift implementation of Schema.org structured data vocabulary.

Schema.org is a collaborative, community activity with a mission to create, maintain, and promote schemas for structured data on the Internet, on web pages, in email messages, and beyond. This library implements some of the core vocabulary in the Swift language.

### Source Directories

_Sources/Schema.org/*_

    pod 'SOSwift/SchemaOnly', '~> 0.1'

This tree contains all of the protocol implementations of the primary structures and data types.


_Sources/Implementation/*_

    pod 'SOSwift/Implementation', '~> 0.1'
    pod 'SOSwift', '~> 0.1' (default subspec)

This tree contains a basic implementation of the Schema classes along with De/Serialization.

### Schema.org

This work is based on the 3.2 version of the Schema.org vocabulary, and currently implements only the top level core `Thing` subclasses.
