//
//  CoreData.swift
//  pass
//
//  Created by User on 17.08.2021.
//

import UIKit
import CoreData
final class CoreData{
    
    
    var appdelegate = UIApplication.shared.delegate as! AppDelegate
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func save (name: String){
        let entity = CDEntity(context: context)
        entity.names = name
        do {
            try context.save()
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    func getInfo(complession: @escaping([String])->()) {
        var array = [String]()
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "CDEntity")
        do{
        let info = try context.fetch(request)
            
            for data in info as! [NSManagedObject]{
                let object = data.value(forKeyPath: "names") as! String
                array.append(object)
                complession(array)
            }

        }
        catch {
            print(error.localizedDescription)
        }
    }
}
