//
//  ViewController.swift
//  pass
//
//  Created by User on 17.08.2021.
//
import UIKit
import LocalAuthentication

class ViewController: UIViewController{
    
    // MARK: - Public Propt
    var alert = Alert()
    var coreData = CoreData()
    var model = Model()
    var arrayOfPass = [String]()
    var arrayOfnames = [String]()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButton: UIButton!
    
    @IBAction func addInfoButton(_ sender: Any) {
        let alarm =  alert.getAlert { [weak self] (data) in
            self?.model.save(adress: data.id, pass: data.pass)
            self?.model.getInfo { (arrayOfNames) in
                self?.arrayOfnames = arrayOfNames
            }
            self?.tableView.reloadData()
        }
        present(alarm, animated: true, completion: nil)
        print(arrayOfPass)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: TableViewCell.cellId)
        model.getInfo { (arrayOfNames) in
            self.arrayOfnames = arrayOfNames
        }
        addButton.layer.cornerRadius = addButton.frame.width / 2
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrayOfnames.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.cellId, for: indexPath) as! TableViewCell
        if let receivedData = KeyChain.load(key: arrayOfnames[indexPath.row]) {
            let result = receivedData.to(type: String.self)
            arrayOfPass.append(result)
        }
        cell.firstLabel.text = arrayOfnames[indexPath.row]
        self.arrayOfPass = arrayOfPass.uniqued()
        cell.secondLabel.text = arrayOfPass[indexPath.row]
        return cell
    }
}
