//
//  MenuCell.swift
//  CarsTypes
//
//  Created by Hla Alhelou on 15/12/2021.
//

import UIKit

class MenuCell: UITableViewCell {

    @IBOutlet weak var IconMenue: UIImageView!
    @IBOutlet weak var MenuItemLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    func ConfigureMenuCell(item:MenuItemData){
        MenuItemLabel.text = item.menueName
        IconMenue.image=item.imgeMenu
    }
    
}
