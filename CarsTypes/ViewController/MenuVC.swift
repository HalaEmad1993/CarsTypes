//
//  MenueCellVc.swift
//  CarsTypes
//
//  Created by Hla Alhelou on 15/12/2021.
//

import UIKit

class MenuVC: UIViewController {
    var item:[MenuItemData]=[]
    
    @IBOutlet weak var RegisterCell: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        cellRegistration()
        setupMenuData()

        RegisterCell.delegate = self
        RegisterCell.dataSource = self
       


    }
    func cellRegistration() {
        let cell = UINib(nibName: "MenuCell", bundle: nil)
        RegisterCell.register(cell, forCellReuseIdentifier: "MenuCell")
    }
    func setupMenuData(){
        item=MenuItemData.All
        
    }

}

extension MenuVC : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return item.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : MenuCell = RegisterCell.dequeueReusableCell(withIdentifier: "MenuCell") as! MenuCell
//        cell.ConfigureMenuCell(item: item[indexPath.row])
        
        return cell
    }
    
    
  
}
