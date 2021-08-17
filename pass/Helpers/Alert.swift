//
//  Alert.swift
//  pass
//
//  Created by User on 17.08.2021.
//
struct NewContact {
    var id: String
    var pass: String
}

import UIKit
class Alert {
    func getAlert(complession: @escaping (NewContact)->())-> UIAlertController {
        let alarm = UIAlertController(title: "Add Info", message: "ВВЕДИТЕ ДАННЫЕ", preferredStyle: .alert)
        alarm.addTextField { (idTF) in
            idTF.placeholder = "Имя"
        }
        alarm.addTextField { (passTF) in
            passTF.placeholder = "Телефон"
        }
        let action = UIAlertAction(title: "OK", style: .default) { _ in
            let firstTextField = alarm.textFields![0] as UITextField
            let secondTextField = alarm.textFields![1] as UITextField
            let contact = NewContact(id: firstTextField.text!, pass: secondTextField.text!)
            complession(contact)
        }
        let cancel = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        alarm.addAction(action)
        alarm.addAction(cancel)
        return alarm
    }
}
