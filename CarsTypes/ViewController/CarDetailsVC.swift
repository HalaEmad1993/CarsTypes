//
//  CarDetailsVC.swift
//  CarsTypes
//
//  Created by Hla Alhelou on 19/12/2021.
//

import UIKit

class CarDetailsVC: UIViewController {
    
    private let sectionInsets = UIEdgeInsets(
      top: 20.0,
      left: 10.0,
      bottom: 20.0,
      right: 10.0)
    private let itemsPerRow: CGFloat = 3

    @IBOutlet weak var carImageCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CellRedistration()
        carImageCollection.delegate=self
        carImageCollection.dataSource=self
    }
    
    func CellRedistration(){
     let nib=UINib(nibName: "CarImageCell", bundle: nil)
        carImageCollection.register(nib, forCellWithReuseIdentifier: "CarImageCell")
    }
    

    

}
extension CarDetailsVC:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = carImageCollection.dequeueReusableCell(withReuseIdentifier: "CarImageCell", for: indexPath)
        return cell
    }
            
    }

extension CarDetailsVC:UICollectionViewDelegateFlowLayout{
    func collectionView(
      _ collectionView: UICollectionView,
      layout collectionViewLayout: UICollectionViewLayout,
      sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
      // 2
      let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
      let availableWidth = view.frame.width - paddingSpace
      let widthPerItem = availableWidth / itemsPerRow
      
      return CGSize(width: widthPerItem, height: 80)
    }
}
