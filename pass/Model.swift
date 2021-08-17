//
//  Model.swift
//  pass
//
//  Created by User on 17.08.2021.
//

import Foundation
class Model{
    // MARK: - Public Prop
    var coreData = CoreData()
    
    func getInfo(complession: @escaping ([String])->()) {
        coreData.getInfo { (arrayOfInfo) in
            complession (arrayOfInfo)
        }
    }
    
    func save(adress: String, pass: String){
        coreData.save(name: adress)
        let data = Data(from: pass)
        _ = KeyChain.save(key: adress, data: data)
    }
}

