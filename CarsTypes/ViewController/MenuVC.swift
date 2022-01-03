//
//  MenueCellVc.swift
//  CarsTypes
//
//  Created by Hla Alhelou on 15/12/2021.
//

import UIKit
import SDWebImage
class MenuVC: UIViewController {
    var item:[MenuItemData]=[]
    
    @IBOutlet weak var RegisterCell: UITableView!
    @IBOutlet weak var nameMenu: UILabel!
    @IBOutlet weak var locationMenu: UILabel!
    @IBOutlet weak var editMenu: UIButton!
    
    @IBOutlet weak var imageMenu: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
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
    
    @IBAction func editButton(_ sender: UIButton) {
        let vc = UIStoryboard.mainStoryBoard.instantiateViewController(withIdentifier: "EditProfileViewController")
        navigationController?.pushViewController(vc, animated: true)
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    switch indexPath.row {
            case 0:
        let vc = UIStoryboard.mainStoryBoard.instantiateViewController(withIdentifier: "ChangePasswordVC")
        navigationController?.pushViewController(vc, animated: true)

            case 1:
               
        let vc = UIStoryboard.mainStoryBoard.instantiateViewController(withIdentifier: "")

            case 2:
        let vc = UIStoryboard.mainStoryBoard.instantiateViewController(withIdentifier: "AboutUsVC")
        navigationController?.pushViewController(vc, animated: true)

            case 3:
        let vc = UIStoryboard.mainStoryBoard.instantiateViewController(withIdentifier: "ContactUsVC")
        navigationController?.pushViewController(vc, animated: true)

    
    default:
       print("")
    }
  
}
}
extension MenuVC{
    func getData(){
        UserApiController.GetProfile { (status, user) in
            if status{
               
            self.imageMenu.sd_setImage(with: URL(string: user?.image_profile ?? ""))
            self.nameMenu.text = user?.name
            self.locationMenu.text = user?.address
        }
        }
    }
}
