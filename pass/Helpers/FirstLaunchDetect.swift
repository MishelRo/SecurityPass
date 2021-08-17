//
//  UserDefaults.swift
//  pass
//
//  Created by User on 17.08.2021.
//

import Foundation
class FirstLaunchDetect{
    func firstLaunch (complession: @escaping ([String: String])->()?){
        if UserDefaults.standard.bool(forKey: "first"){
            if let receivedData = KeyChain.load(key: "first") {
                let result = receivedData.to(type: [String: String].self)
                print(result)
                complession(result)
            }
        }else{
            UserDefaults.standard.set(true, forKey: "first")
            let array = [String: String]()
            let data = Data(from: array)
            _ = KeyChain.save(key: "first", data: data)
        }
    }
}
