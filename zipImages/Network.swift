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
    
    func getURLs(completion: @escaping ([ImageCollection]) -> Void) {
        let masterURL = URL(string: "https://s3-us-west-2.amazonaws.com/mob3/image_collection.json")!
        
        Alamofire.request(masterURL, method: .get).responseJSON { (response) in
            if let data = response.data {
                let collections = try? JSONDecoder().decode([ImageCollection].self, from: data)
                
                if var collections = collections {
                    
                    /* Download zips */
                    
                    for collection in collections {
                        if collection.unzippedImagesUrl == nil {
                           self.downloadZip(collection: collection)
                        }
                    }
                    
                    completion(collections)
                } else {
                    print("trip: \(data.description)")
                }
                }
            }
        }
    
    
        func downloadZip(collection: ImageCollection) -> URL {
            var location = URL(string: "asdf")
            
            /* Create Download destination */
            let destination: DownloadRequest.DownloadFileDestination = { _, _ in
                let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
                return (documentsURL, [.removePreviousFile, .createIntermediateDirectories])
            }
            
            /* Download Zips to documents */
            Alamofire.download(collection.zippedImagesUrl, to: destination).response(completionHandler: { (resp) in
                print("destination url: \(String(describing: resp.destinationURL))")
                
                /* After finishing dowload, unzip */
                do {
                    let filePath = resp.destinationURL!
                    print("absolute string: \(filePath.absoluteString)")
                    let fileList = try FileManager.default.contentsOfDirectory(atPath: filePath.absoluteString)
                    for file in fileList
                    {
                        print("FFS: \(file)")
                    }
                    
                    print("FP: \(filePath)")
                    let unzipDirectory = try Zip.quickUnzipFile(filePath) // Unzip
                    location = unzipDirectory
                    print("UZ at: \(unzipDirectory)")
                    
                }
                catch {
                    print("Something went wrong")
                }
                
            })
            return location!
    }
}
