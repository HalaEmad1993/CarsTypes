//
//  BasicInfoVCViewController.swift
//  CarsTypes
//
//  Created by Hla Alhelou on 16/12/2021.
//

import UIKit

class BasicInfoVCViewController: UIViewController {

    @IBOutlet weak var BasicInfoCell: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cellRegistration()
        BasicInfoCell.dataSource = self
        BasicInfoCell.delegate = self
    }
    

    func cellRegistration() {
        let cell = UINib(nibName: "BasicInfoCellTableViewCell", bundle: nil)
        BasicInfoCell.register(cell, forCellReuseIdentifier: "BasicInfoCellTableViewCell")
  
    }}
    extension BasicInfoVCViewController : UITableViewDelegate , UITableViewDataSource {
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell : BasicInfoCellTableViewCell = BasicInfoCell.dequeueReusableCell(withIdentifier: "BasicInfoCellTableViewCell") as! BasicInfoCellTableViewCell
            return cell
        }
        
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 10
        }
    }
