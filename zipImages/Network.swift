//
//  Network.swift
//  zipImages
//
//  Created by Andrew Tsukuda on 1/17/18.
//  Copyright © 2018 Andrew Tsukuda. All rights reserved.
//

import Foundation


class Network {
    
    func downloadZip() {
        let session = URLSession.shared
        
        session.downloadTask(with: <#T##URL#>) { (<#URL?#>, <#URLResponse?#>, <#Error?#>) in
            <#code#>
        }
    }
}
