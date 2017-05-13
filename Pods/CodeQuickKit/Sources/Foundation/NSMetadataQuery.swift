//===----------------------------------------------------------------------===//
//
// NSMetadataQuery.swift
//
// Copyright (c) 2016 Richard Piazza
// https://github.com/richardpiazza/CodeQuickKit
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//
//===----------------------------------------------------------------------===//

import Foundation

public typealias MetadataQueryResults = [String : Date]

public extension NSMetadataQuery {
    var nonHiddenDocuments: MetadataQueryResults {
        var documents = MetadataQueryResults()
        
        for item in results {
            guard let url = (item as AnyObject).value(forAttribute: NSMetadataItemURLKey) as? URL else {
                continue
            }
            
            var fileDate: Date? = (item as AnyObject).value(forAttribute: NSMetadataItemFSContentChangeDateKey) as? Date
            if fileDate == nil {
                fileDate = (item as AnyObject).value(forAttribute: NSMetadataItemFSCreationDateKey) as? Date
            }
            
            guard let date = fileDate else {
                continue
            }
            
            var isHidden: AnyObject?
            do {
                try (url as NSURL).getResourceValue(&isHidden, forKey: URLResourceKey.isHiddenKey)
            } catch {
                Log.error(error)
                continue
            }
            
            guard let isHiddenNumber = isHidden as? NSNumber , isHiddenNumber.boolValue == false else {
                continue
            }
            
            documents[url.absoluteString] = date
        }
        
        return documents
    }
}
