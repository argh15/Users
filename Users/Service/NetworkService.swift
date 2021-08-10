//
//  NetworkService.swift
//  Users
//
//  Created by Arghadeep Chakraborty on 10/08/21.
//

import Foundation

class NetworkService: NSObject {
    
    static let sharedInstance = NetworkService()
    
    private override init() {
        super.init()
    }

    func post(withBaseURL: String,
              body: Dictionary<String, String>? = nil,
              completion: @escaping (_ result:AnyObject?,_ error:ServerError?) -> Void) {
        
        if let url = URLComponents(string: withBaseURL)?.url {
            var request  = URLRequest(url: url)
            request.httpMethod = "POST"
            
            if let body = body {
                guard let httpBody = try? JSONSerialization.data(withJSONObject: body, options: []) else {
                    return
                }
                request.httpBody = httpBody
            }
            
            request.setValue("\(String(describing: body?.count))", forHTTPHeaderField: "Content-Length")
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let task = URLSession.shared.dataTask(with: request) { (data, _, error) in
                DispatchQueue.main.async {
                    if error == nil {
                        if let responseData = data, let utf8Text = String(data: responseData, encoding: .utf8) {
                            do {
                                if !utf8Text.isEmpty {
                                    if let j = try JSONSerialization.jsonObject(with: responseData, options: [.allowFragments]) as? [String: Any] {
                                        completion(j as AnyObject, nil)
                                    } else {
                                        completion(responseData as AnyObject, nil)
                                    }
                                } else {
                                    completion(nil, nil)
                                }
                            } catch let error as NSError {
                                let error = ServerError(err: error)
                                completion(nil, error)
                            }
                        }
                    } else {
                        if let err = error as NSError? {
                            let error = ServerError(err: err)
                            completion(nil, error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
    
}
