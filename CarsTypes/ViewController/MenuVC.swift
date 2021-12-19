//
//  MenueCellVc.swift
//  CarsTypes
//
//  Created by Hla Alhelou on 15/12/2021.
//

import UIKit

class MenuVC: UIViewController {
    var item:[MenuItems.MenuItemData]=[]
    
    @IBOutlet weak var RegisterCell: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        cellRegistration()
        setupMenuData()

        RegisterCell.delegate = self
        RegisterCell.dataSource = self
        print("hgjhkhklkl")
        print("hgjhkhklkl")
        print("hgjhkhklkl")
        print("hgjhkhklkl")


    }
    func cellRegistration() {
        let cell = UINib(nibName: "MenuCell", bundle: nil)
        RegisterCell.register(cell, forCellReuseIdentifier: "MenuCell")
    }
    func setupMenuData(){
        item.append(MenuItems.MenuItemData.Home)
        item.append(MenuItems.MenuItemData.Favourite)
        item.append(MenuItems.MenuItemData.sellYourCar)
        item.append(MenuItems.MenuItemData.AboutUS)
        item.append(MenuItems.MenuItemData.ContactUs)
        item.append(MenuItems.MenuItemData.PrivacyPolicy)
        item.append(MenuItems.MenuItemData.Arabic)
        item.append(MenuItems.MenuItemData.Logout)

        
        
    }

}

extension MenuVC : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return item.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : MenuCell = RegisterCell.dequeueReusableCell(withIdentifier: "MenuCell") as! MenuCell
        cell.ConfigureMenuCell(item: item[indexPath.row])
        
        return cell
    }
    
    
  
}
