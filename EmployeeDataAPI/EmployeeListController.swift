//
//  ViewController.swift
//  EmployeeDataAPI
//
//  Created by Karan Gajjar on 11/22/20.
//

import UIKit

class EmployeeListController :UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    let cellReuseIdentifier = "cell"
    
    var list : EmployeeModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        fetchEmployeeData()
        
    }
    
    func fetchEmployeeData(){
        let manager = JSONManager()
        manager.fetchJSONData{
            (employees) in
            DispatchQueue.main.async {
                self.list = employees
                //print("data in listcontroller : \(employees[0].name) ")
                self.tableView.reloadData()
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.list?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let name = "\(list?[indexPath.row].name ?? "")"
        let email = "\(list?[indexPath.row].email ?? "")"
        
        let cell : UITableViewCell = {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier)
            else {
                return UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: cellReuseIdentifier)
            }
            return cell
        }()
        cell.textLabel?.text = name
        cell.detailTextLabel?.text = email
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("you tapped : \(indexPath.row)")
        let detailViewController = storyboard?.instantiateViewController(identifier: "DetailViewController") as? DetailViewController
        
        detailViewController?.employeeModel = (list?[indexPath.row])
        
        self.navigationController?.pushViewController(detailViewController!, animated: true)
    }

}

