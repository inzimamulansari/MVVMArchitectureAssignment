
//
//  HomeViewController.swift
//  MVVMArchitectureAssignment
//
//  Created by Apple on 17/02/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    let loader = DataLoader()
    @Published var userData = [UserData]()
    
    
    @IBOutlet var tab : UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loader.loadFromInternet{
            (data,error)  in
            self.userData = (data)!
            DispatchQueue.main.async {
                self.tab.reloadData()
            }
        }
    }

}


extension HomeViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = userData[indexPath.row].timezone
        return cell
    }
    
    
}
