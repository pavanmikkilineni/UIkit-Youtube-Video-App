//
//  NetworkManager.swift
//  UIkit-Youtube-Video-App
//
//  Created by Pavan Mikkilineni on 09/12/21.
//

import Foundation

class NetWorkManager{
    
    static let shared=NetWorkManager()
    private let session:URLSession!
    
    init(){
        let config=URLSessionConfiguration.default
        session=URLSession(configuration: config)
    }
    
    func getVideos(completionHandler: @escaping (Result<Response,NetworkError>)->Void){
        guard let url = URL(string:Constants.API_URL) else{
            completionHandler(.failure(.invalidURL))
            return
        }
        
        let task=session.dataTask(with: url){(data:Data?,response:URLResponse?,error:Error?) in
            
            if let error=error{
                completionHandler(.failure(.unableToFetch))
                return
            }
            
            guard let httpResponse=response as? HTTPURLResponse else{
                completionHandler(.failure(.unableToFetch))
                return
            }
            
            guard (200...299).contains(httpResponse.statusCode) else{
                completionHandler(.failure(.unableToFetch))
                return
            }
            
            guard let data=data else{
                completionHandler(.failure(.unableToFetch))
                return
            }
            
            do{
                let decoder=JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let response = try decoder.decode(Response.self, from: data)
                
                completionHandler(.success(response))
                
            }catch{
                completionHandler(.failure(.unableToFetch))
            }
            
            
        }
        task.resume()
    }
}
