//
//  homePage.swift
//  CarsTypes
//
//  Created by Hla Alhelou on 15/12/2021.
//

import UIKit
import SDWebImage
class homePage: UITableViewCell {

    @IBOutlet weak var nameCarLabel: UILabel!
    @IBOutlet weak var locationCar: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var doorsLabel: UILabel!
    @IBOutlet weak var petrolLabel: UILabel!
    @IBOutlet weak var AutomaticLabel: UILabel!
    @IBOutlet weak var personLabel: UILabel!
    @IBOutlet weak var carImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(cardata:Datas){
        nameCarLabel.text=cardata.car_model ?? ""
        locationCar.text=cardata.owner?.address ?? ""
        speedLabel.text=cardata.mileage ?? ""
        doorsLabel.text = "\(cardata.saloon_id ?? 0)"
        petrolLabel.text=cardata.fuel?.name
        AutomaticLabel.text=cardata.engine?.name ?? ""
        carImage.sd_setImage(with: URL(string: cardata.photos?[0] ?? ""))
    }
    
}
