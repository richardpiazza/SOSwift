//===----------------------------------------------------------------------===//
//
// WebAPI.swift
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

public typealias WebAPICompletion = (_ statusCode: Int, _ response: HTTPURLResponse?, _ responseObject: AnyObject?, _ error: NSError?) -> Void

public enum WebAPIRequestMethod: String {
    case Get = "GET"
    case Put = "PUT"
    case Post = "POST"
    case Delete = "DELETE"
}

public struct WebAPIHeaderKey {
    public static let Accept = "Accept"
    public static let Date = "Date"
    public static let ContentType = "Content-Type"
    public static let ContentMD5 = "Content-MD5"
    public static let ContentLength = "Content-Length"
    public static let Authorization = "Authorization"
}

public struct WebAPIHeaderValue {
    public static let ApplicationJson = "application/json"
    public static let ImagePNG = "image/png"
}

public struct WebAPIInjectedResponse {
    public var statusCode: Int = 0
    public var response: HTTPURLResponse?
    public var responseObject: AnyObject?
    public var error: NSError?
    public var timeout: UInt64 = 0
    
    public init() {
    }
    
    public init(statusCode: Int, response: HTTPURLResponse? = nil, responseObject: AnyObject? = nil, error: NSError? = nil, timeout: UInt64 = 0) {
        self.statusCode = statusCode
        self.response = response
        self.responseObject = responseObject
        self.error = error
        self.timeout = timeout
    }
}

public enum WebAPIError: Error {
    case invalidURL
    case invalidRequest
    
    public var description: String {
        switch self {
        case .invalidURL: return "Invalid Base URL"
        case .invalidRequest: return "Invalid URL Request"
        }
    }
    
    public var failureReason: String {
        switch self {
        case .invalidURL: return "Base URL is nil or invalid"
        case .invalidRequest: return "NSURLRequest is nil or invalid"
        }
    }
    
    public var recoverySuggestion: String {
        switch self {
        case .invalidURL: return "Set the base URL and try the request again."
        case .invalidRequest: return "Try the request again with a valid NSURLRequest."
        }
    }
    
    public var code: Int {
        switch self {
        case .invalidURL: return 0
        case .invalidRequest: return 1
        }
    }
    
    public var error: NSError {
        return NSError(domain: String(describing: WebAPI.self), code: code, userInfo: [NSLocalizedDescriptionKey: description, NSLocalizedFailureReasonErrorKey: failureReason, NSLocalizedRecoverySuggestionErrorKey: recoverySuggestion])
    }
}

/// # WebAPI
/// A wrapper for NSURLSession for communication with JSON REST API's
/// ### Features
/// - automatic deserialization of a JSON response
/// - testability with injected responses
open class WebAPI {
    
    public var baseURL: URL?
    public var injectedResponses: [String : WebAPIInjectedResponse] = [String : WebAPIInjectedResponse]()
    public var sessionDelegate: URLSessionDelegate?
    public lazy var session: URLSession = {
        [unowned self] in
        let configuration = URLSessionConfiguration.default
        return URLSession(configuration: configuration, delegate: self.sessionDelegate, delegateQueue: nil)
    }()
    
    public init(baseURL: URL?, sessionDelegate: URLSessionDelegate?) {
        self.baseURL = baseURL
        self.sessionDelegate = sessionDelegate
    }
    
    // MARK: - Convenience Methods
    
    public final func get(_ path: String, queryItems: [URLQueryItem]? = nil, completion: @escaping WebAPICompletion) {
        execute(path: path, queryItems: queryItems, method: .Get, data: nil, completion: completion)
    }
    
    public final func put(_ data: Data?, path: String, queryItems: [URLQueryItem]? = nil, completion: @escaping WebAPICompletion) {
        execute(path: path, queryItems: queryItems, method: .Put, data: data, completion: completion)
    }
    
    public final func post(_ data: Data?, path: String, queryItems: [URLQueryItem]? = nil, completion: @escaping WebAPICompletion) {
        execute(path: path, queryItems: queryItems, method: .Post, data: data, completion: completion)
    }
    
    public final func delete(_ path: String, queryItems: [URLQueryItem]? = nil, completion: @escaping WebAPICompletion) {
        execute(path: path, queryItems: queryItems, method: .Delete, data: nil, completion: completion)
    }
    
    // MARK: - Request Setup
    
    /// Constructs the request, setting the method, body data, and headers based on parameters
    /// Subclasses can override this method to customize the request as needed.
    open func request(forPath path: String, queryItems: [URLQueryItem]?, method: WebAPIRequestMethod, data: Data?) -> NSMutableURLRequest? {
        guard let baseURL = self.baseURL else {
            return nil
        }
        
        var urlWithComponents = URLComponents(string: baseURL.appendingPathComponent(path).absoluteString)
        urlWithComponents?.queryItems = queryItems
        
        guard let url = urlWithComponents?.url else {
            return nil
        }
        
        let request = NSMutableURLRequest(url: url)
        request.httpMethod = method.rawValue
        request.httpBody = data
        request.setValue(DateFormatter.rfc1123DateFormatter.string(from: Date()), forHTTPHeaderField: WebAPIHeaderKey.Date)
        request.setValue(WebAPIHeaderValue.ApplicationJson, forHTTPHeaderField: WebAPIHeaderKey.Accept)
        request.setValue(WebAPIHeaderValue.ApplicationJson, forHTTPHeaderField: WebAPIHeaderKey.ContentType)
        
        return request
    }
    
    // MARK: - Execution
    
    /// Executes the request returned from `requestFor(path:queyItems:method:data:)`
    public final func execute(path: String, queryItems: [URLQueryItem]?, method: WebAPIRequestMethod, data: Data?, completion: @escaping WebAPICompletion) {
        guard let request = self.request(forPath: path, queryItems: queryItems, method: method, data: data) else {
            completion(0, nil, nil, WebAPIError.invalidRequest.error)
            return
        }
        
        execute(request, completion: completion)
    }
    
    /// Transforms the request into a `multipart/form-data` request.
    /// The request `content-type` will be set to `image/png` and the associated filename will be `image.png`
    public final func execute(_ path: String, queryItems: [URLQueryItem]?, method: WebAPIRequestMethod, pngImageData: Data, completion: @escaping WebAPICompletion) {
        if let request = request(forPath: path, queryItems: queryItems, method: method, data: nil) {
            let boundary = UUID().uuidString.replacingOccurrences(of: "-", with: "")
            let contentType = "multipart/form-data; boundary=\(boundary)"
            request.setValue(contentType, forHTTPHeaderField: WebAPIHeaderKey.ContentType)
            
            let data = NSMutableData()
            
            if let d = "--\(boundary)\r\n".data(using: String.Encoding.utf8) {
                data.append(d)
            }
            if let d = "Content-Disposition: form-data; name=\"image\"; filename=\"image.png\"\r\n".data(using: String.Encoding.utf8) {
                data.append(d)
            }
            if let d = "Content-Type: image/png\r\n\r\n".data(using: String.Encoding.utf8) {
                data.append(d)
            }
            data.append(pngImageData)
            if let d = "\r\n".data(using: String.Encoding.utf8) {
                data.append(d)
            }
            if let d = "--\(boundary)--\r\n".data(using: String.Encoding.utf8) {
                data.append(d)
            }
            
            let contentLength = String(format: "%zu", data.length)
            request.setValue(contentLength, forHTTPHeaderField: WebAPIHeaderKey.ContentLength)
            
            request.httpBody = data as Data
            
            execute(request, completion: completion)
        } else {
            completion(0, nil, nil, WebAPIError.invalidRequest.error)
        }
    }
    
    fileprivate func task(forRequest request: NSMutableURLRequest, completion: @escaping WebAPICompletion) -> URLSessionDataTask {
        let urlRequest = request as URLRequest
        return session.dataTask(with: urlRequest, completionHandler: { (responseData, response, error) -> Void in
            DispatchQueue.main.async(execute: { () -> Void in
                guard error == nil else {
                    completion(0, nil, nil, error as NSError?)
                    return
                }
                
                let httpResponse = response as! HTTPURLResponse
                
                guard let data = responseData else {
                    completion(httpResponse.statusCode, httpResponse, nil, error as NSError?)
                    return
                }
                
                guard data.count != 0 else {
                    completion(httpResponse.statusCode, httpResponse, nil, error as NSError?)
                    return
                }
                
                if let contentType = httpResponse.allHeaderFields[WebAPIHeaderKey.ContentType] as? String {
                    guard contentType.hasPrefix(WebAPIHeaderValue.ApplicationJson) else {
                        completion(httpResponse.statusCode, httpResponse, data as AnyObject?, error as NSError?)
                        return
                    }
                }
                
                var body: AnyObject?
                var e: NSError? = error as NSError?
                do {
                    body = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as AnyObject
                } catch {
                    Log.error(error)
                    if e == nil {
                        e = (error as NSError)
                    }
                }
                
                completion(httpResponse.statusCode, httpResponse, body, e)
            })
        })
    }
    
    fileprivate func execute(_ request: NSMutableURLRequest, completion: @escaping WebAPICompletion) {
        guard let url = request.url else {
            completion(0, nil, nil, WebAPIError.invalidURL.error)
            return
        }
        
        if let canned = injectedResponses[url.absoluteString] {
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(canned.timeout * NSEC_PER_SEC)) / Double(NSEC_PER_SEC), execute: { () -> Void in
                completion(canned.statusCode, canned.response, canned.responseObject, canned.error)
            })
            return
        }
        
        let urlRequest = request as URLRequest
        
        session.dataTask(with: urlRequest, completionHandler: { (responseData, response, error) -> Void in
            DispatchQueue.main.async(execute: { () -> Void in
                guard error == nil else {
                    completion(0, nil, nil, error as NSError?)
                    return
                }
                
                let httpResponse = response as! HTTPURLResponse
                
                guard let data = responseData else {
                    completion(httpResponse.statusCode, httpResponse, nil, error as NSError?)
                    return
                }
                
                guard data.count != 0 else {
                    completion(httpResponse.statusCode, httpResponse, nil, error as NSError?)
                    return
                }
                
                if let contentType = httpResponse.allHeaderFields[WebAPIHeaderKey.ContentType] as? String {
                    guard contentType.hasPrefix(WebAPIHeaderValue.ApplicationJson) else {
                        completion(httpResponse.statusCode, httpResponse, data as AnyObject?, error as NSError?)
                        return
                    }
                }
                
                var body: AnyObject?
                var e: NSError? = error as NSError?
                do {
                    body = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as AnyObject
                } catch {
                    Log.error(error)
                    if e == nil {
                        e = (error as NSError)
                    }
                }
                
                completion(httpResponse.statusCode, httpResponse, body, e)
            })
        }) .resume()
    }
}
