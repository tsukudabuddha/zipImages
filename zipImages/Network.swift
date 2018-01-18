//
//  Network.swift
//  zipImages
//
//  Created by Andrew Tsukuda on 1/17/18.
//  Copyright © 2018 Andrew Tsukuda. All rights reserved.
//

import Foundation
import Alamofire
import Zip


class Network {
    
    func downloadZip() {
 
    }
    
    func getURLs(completion: @escaping ([ImageCollection]) -> Void) {
        let masterURL = URL(string: "https://s3-us-west-2.amazonaws.com/mob3/image_collection.json")!
        
        Alamofire.request(masterURL, method: .get).responseJSON { (response) in
            if let data = response.data {
                let collections = try? JSONDecoder().decode([ImageCollection].self, from: data)
                
                if let collections = collections {  
                    completion(collections)
                } else {
                    print("trip: \(data.description)")
                }
            }
        }
    }
}
