//
//  CarImageCell.swift
//  CarsTypes
//
//  Created by Hla Alhelou on 19/12/2021.
//

import UIKit

class CarImageCell: UICollectionViewCell {

    @IBOutlet weak var carPhoto: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configureCarPhoto(item:UIImage) {
        carPhoto.image=item
    }

}
