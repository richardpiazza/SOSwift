//===----------------------------------------------------------------------===//
//
// Downloader.swift
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

public typealias DownloaderDataCompletion = (_ statusCode: Int, _ responseData: Data?, _ error: NSError?) -> Void

/// A wrapper for `NSURLSession` similar to `WebAPI` for general purpose
/// downloading of data and images.
open class Downloader {
    fileprivate static let twentyFiveMB: Int = (1024 * 1024 * 25)
    fileprivate static let twoHundredMB: Int = (1024 * 1024 * 200)
    
    fileprivate lazy var session: URLSession = {
        [unowned self] in
        let configuration = URLSessionConfiguration.default
        configuration.urlCache = self.cache
        configuration.requestCachePolicy = .returnCacheDataElseLoad
        return URLSession(configuration: configuration, delegate: nil, delegateQueue: nil)
    }()
    fileprivate var cache: URLCache = URLCache(memoryCapacity: Downloader.twentyFiveMB, diskCapacity: Downloader.twoHundredMB, diskPath: "Downloader")
    public var baseURL: URL?
    public var timeout: TimeInterval = 20
    
    internal lazy var invalidBaseURL: NSError = {
        let userInfo: [String : AnyObject] = [NSLocalizedDescriptionKey:"Invalid Base URL" as AnyObject, NSLocalizedFailureReasonErrorKey:"You can not use a `path` method without specifiying a baseURL." as AnyObject]
        return NSError(domain: "Downloader", code: 0, userInfo: userInfo)
    }()
    
    public init() {
    }
    
    public convenience init(baseURL: URL) {
        self.init()
        self.baseURL = baseURL
    }
    
    internal func urlForPath(_ path: String) -> URL? {
        guard let baseURL = self.baseURL else {
            return nil
        }
        
        return baseURL.appendingPathComponent(path)
    }
    
    open func getDataAtPath(_ path: String, cachePolicy: NSURLRequest.CachePolicy, completion: @escaping DownloaderDataCompletion) {
        guard let url = self.urlForPath(path) else {
            completion(0, nil, invalidBaseURL)
            return
        }
        
        self.getDataAtURL(url, cachePolicy: cachePolicy, completion: completion)
    }
    
    open func getDataAtURL(_ url: URL, cachePolicy: NSURLRequest.CachePolicy, completion: @escaping DownloaderDataCompletion) {
        let request = NSMutableURLRequest(url: url, cachePolicy: cachePolicy, timeoutInterval: timeout)
        request.httpMethod = "GET"
        
        let urlRequest: URLRequest = request as URLRequest

        session.dataTask(with: urlRequest, completionHandler: { (data, response, error) -> Void in
            DispatchQueue.main.async(execute: { () -> Void in
                guard error == nil else {
                    completion(0, data, error as NSError?)
                    return
                }
                
                let httpResponse = response as! HTTPURLResponse
                completion(httpResponse.statusCode, data, error as NSError?)
            })
        }) .resume()
    }
}
