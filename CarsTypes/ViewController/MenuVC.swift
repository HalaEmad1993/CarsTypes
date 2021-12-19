//
//  MenueCellVc.swift
//  CarsTypes
//
//  Created by Hla Alhelou on 15/12/2021.
//

import UIKit

class MenuVC: UIViewController {

    @IBOutlet weak var RegisterCell: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        RegisterCell.delegate = self
        RegisterCell.dataSource = self

    }
    func cellRegistration() {
        let cell = UINib(nibName: "MenuCell", bundle: nil)
        RegisterCell.register(cell, forCellReuseIdentifier: "MenuCell")
    }

}

extension MenuVc : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : MenuCell = RegisterCell.dequeueReusableCell(withIdentifier: "MenuCell") as! MenuCell
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
}
