//
//  DetailViewController.swift
//  EmployeeDataAPI
//
//  Created by Karan Gajjar on 11/22/20.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var txt_name: UILabel!
    
    @IBOutlet var txt_email: UILabel!
    
    @IBOutlet var txt_phone: UILabel!
    
    @IBOutlet var txt_username: UILabel!
    
    @IBOutlet var txt_address: UILabel!
        
    @IBOutlet var txt_company: UILabel!
    @IBOutlet var txt_website: UILabel!
    
    var employeeModel : EmployeeModelElement?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        fillData(model: employeeModel!)
    }
    
    func fillData(model : EmployeeModelElement) {
      
        txt_name?.text = model.name
        txt_email?.text = model.email
        txt_phone?.text = model.phone
        txt_username?.text = model.username
        
        let txtaddress = "\(model.address.suite) \(model.address.street) \(model.address.city) \(model.address.zipcode)"
        
        txt_address?.text = txtaddress
        
        
        
        txt_company.text = "\(model.company.name)\n\(model.company.catchPhrase)"
        
        txt_website.text = "\(model.website)"
        
        
        
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
