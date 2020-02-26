//
//  API.swift
//  restroom_map
//
//  Created by raiu on 2020/02/24.
//  Copyright © 2020 Ryu Ishibashi. All rights reserved.
//

import Foundation


class API {
    let server_url = "http://zihankimap.work/"
    
    let encoder = JSONEncoder()
    let decoder = JSONDecoder()
    
    func sayHello() {
        print("hello")
    }
    
    func get_restroom_list() {
        let semaphore = DispatchSemaphore(value: 0)
        let destination = server_url + "datalist?table_id=2"
        let url = URL(string: destination)!
        
        let session = URLSession.shared
        let request = URLRequest(url: url)
        
        
        session.dataTask(with: request) {
            (data, response, error) in if error == nil, let data = data, let _ = response as? HTTPURLResponse {
                
                do {
//                    let jsonString = String(data: data, encoding: String.Encoding.utf8) ?? ""
//                    print(jsonString)
                    print(data)
                    let recv_obj: [Restroom_data] = try! self.decoder.decode([Restroom_data].self, from: data)
                    print(recv_obj)

                    semaphore.signal()
                } catch {
                    print("Error:\(error)")
                }
                    
                }
            }.resume()
        semaphore.wait()
    }
}



struct Restroom_data : Codable {
    var id:String
    var latitude:String
    var longitude:String
    var updated:String
    var memo:String
}
