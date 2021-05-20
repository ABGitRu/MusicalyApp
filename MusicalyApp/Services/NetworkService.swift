//
//  NetworkService.swift
//  MusicalyApp
//
//  Created by Mac on 19.05.2021.
//

import UIKit
import Alamofire

class NetworkService {
    
    func fetchTracks(searchText: String, completion: @escaping(SearchResponce?) -> Void) {
        let url = "https://itunes.apple.com/search"
        let parameters = ["term":"\(searchText)",
                          "limit":"20",
                          "media":"music"]
        AF.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseData { (dataResponse) in
            if let error = dataResponse.error {
                print("Error received: \(error.localizedDescription)")
                completion(nil)
                return
            }
            guard let data = dataResponse.data else { return }
            let decoder = JSONDecoder()
            do{
                let objects = try decoder.decode(SearchResponce.self, from: data)
                completion(objects)
            } catch let jsonError {
                print("Failed to decode: \(jsonError)")
                completion(nil)
                
            }

        }
    }
}
