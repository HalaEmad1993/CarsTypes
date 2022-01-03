//
//  HomePageVC.swift
//  CarsTypes
//
//  Created by Hla Alhelou on 15/12/2021.
//

import UIKit

class HomePageVC: UIViewController {
    var cars:[Datas]=[]
    @IBOutlet weak var displayHomeTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Home()
        CellRegistration()
        displayHomeTable.delegate =  self
        displayHomeTable.dataSource = self
        
        
    }
    
    func CellRegistration() {
        let cell = UINib(nibName: "homePage", bundle: nil)
        displayHomeTable.register(cell, forCellReuseIdentifier: "homePage")

    }
   
}

extension HomePageVC : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cars.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:homePage = displayHomeTable.dequeueReusableCell(withIdentifier: "homePage") as! homePage
        cell.configure(cardata: self.cars[indexPath.row])
        return cell
    }
    
    
    
}

extension HomePageVC {
    func Home () {
            
        UserApiController.HomeData { Status, carsData in
            self.cars=carsData ?? []
            self.displayHomeTable.reloadData()
        }
    }
}
