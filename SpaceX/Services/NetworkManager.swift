//
//  NetworkManager.swift
//  SpaceX
//
//  Created by ovr on 19.05.2021.
//

import Alamofire
import Foundation

class NetworkManager {
    
    private let backendServer = "https://api.spacexdata.com"
    
    // TODO: add completion
    func getDragon(id: String) {
        let request = AF.request("\(backendServer)/v4/dragons/\(id)")
        request.validate()
            .responseDecodable(of: Dragon.self) { response in
                guard let dragon = response.value else { return }
                debugPrint(dragon)
            }
    }
    
    func getDragonList(completion: @escaping ([Dragon]) -> ()) {
        let request = AF.request("\(backendServer)/v4/dragons/")
        request.responseJSON { response in
            guard let dragonsData = response.data else {
                return
            }
            guard let dragons = try? JSONDecoder().decode([Dragon].self, from: dragonsData) else {
                return
            }
            completion(dragons)
            print(dragons)
        }
    }
}

