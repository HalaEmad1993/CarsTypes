//
//  CarDetailsVC.swift
//  CarsTypes
//
//  Created by Hla Alhelou on 19/12/2021.
//

import UIKit
import DropDown
import YPImagePicker
class SellCarVC: UIViewController {
    let dropDown = DropDown()
    var SellerCar:CarData?
    var addFeature:[String]=[]

    private var imagesArray:[UIImage]=[]
    
    @IBOutlet weak var loc: UITextField!
    var countryName:[String]=[]
    var countryId:[Int]=[]
    
    var imgurl:[String]=[]
    var imgName:[String]=[]
    
    var engine:[String]=[]
    var engineId:[Int]=[]
    
    var saloon:[String]=[]
    var saloonId:[Int]=[]
    
    var carType:[String]=[]
    var carTypeId:[Int]=[]
    
    var fuel:[String]=[]
    var fuelId:[Int]=[]
    
            var countryids=0
            var fuelIds=0
            var carTypeIds=0
            var saloonIds=0
            var engineIds=0
            var servicehistorysIds=0
    
    var servicehistorys:[String]=[]
    var servicehistorysId:[Int]=[]
    
    @IBOutlet weak var carNameText: UITextField!
    @IBOutlet weak var priceText: UITextField!
    
    @IBOutlet weak var payment: UISegmentedControl!
    @IBOutlet weak var carUsed: UISegmentedControl!
    
    @IBOutlet weak var milageText: UITextField!
    @IBOutlet weak var doors: UITextField!
    @IBOutlet weak var fuelType: UITextField!
    @IBOutlet weak var serviceType: UITextField!
    @IBOutlet weak var postedIn: UITextField!
    @IBOutlet weak var makeText: UITextField!
    
    @IBOutlet weak var modelText: UITextField!
    @IBOutlet weak var yearText: UITextField!
    @IBOutlet weak var colorText: UITextField!
    
    @IBOutlet weak var serviceHistory: UITextField!
    
    @IBOutlet weak var descriptionTextView: UITextView!
    
    @IBOutlet weak var feachers: UITextField!
    
    
    @IBOutlet weak var milegeAction: UIButton!
    
    @IBOutlet weak var saloonAction: UIButton!
    
    @IBOutlet weak var fuelTypeAction: UIButton!
    
    @IBOutlet weak var serviceTypeAction: UIButton!
    
    @IBOutlet weak var makeAction: UIButton!
    @IBOutlet var locAction: UIButton!

    @IBOutlet weak var features: UITextField!
    @IBOutlet weak var serviceAction: UIButton!
    private let sectionInsets = UIEdgeInsets(
        top: 20.0,
        left: 10.0,
        bottom: 20.0,
        right: 10.0)
    private let itemsPerRow: CGFloat = 3
    
    @IBOutlet weak var carImageCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setting()
        setting()

        CellRedistration()
        carImageCollection.delegate=self
        carImageCollection.dataSource=self
    }
    
    @IBAction func addMoreButton(_ sender: Any) {
        
        if (features.text?.isEmpty == false){
                    addFeature.append(features.text!)
                    features.text=""
                    showAlertMessage(title: "Sucess", message: "the feature added")
                    
                }
        
    }
    
    @IBAction func saveButton(_ sender: Any) {
        
        
        
        
    }
    
    @IBAction func locActionBtn(_ sender: Any) {
            
            self.dropDown.anchorView = self.locAction
            self.dropDown.dataSource = self.countryName
            self.dropDown.cellNib = UINib(nibName: "DropDownView", bundle: nil)
            
            self.dropDown.customCellConfiguration = { (index: Index, item: String, cell: DropDownCell) -> Void in
            }
            self.dropDown.selectionAction = { [self] (index: Int, item: String) in
                print("Selected item: \(item) at index: \(index)")
                countryids = countryId[index]
                self.loc.textColor = UIColor.black
                self.loc.text = item
            }
            self.dropDown.width = self.loc.frame.size.width
            self.dropDown.bottomOffset = CGPoint(x: 0, y:(self.dropDown.anchorView?.plainView.bounds.height)!)
            self.dropDown.show()
            
        }
    // كود مكتبه الكولكشن عشان يضيف المستخدم صور متعدده
        @IBAction func upload(_ sender: Any) {
                self.imagesArray=[]
                imgurl=[]
    
                var config = YPImagePickerConfiguration()
                config.library.maxNumberOfItems = 20
                let picker = YPImagePicker(configuration: config)
                picker.didFinishPicking { [self, unowned picker] items, cancelled in
                    for item in items {
                        switch item {
                        case .photo(let photo):
    
                            self.imgName.append(photo.asset?.localIdentifier.description ?? "")
                            imagesArray.append(photo.originalImage)
                            carImageCollection.reloadData()
                            print("PHOTO", photo.originalImage,  imagesArray.count)
    
                        case .video(let video):
                            print(video)
                        }
    
                    }
                    carImageCollection.reloadData()
    
                    //              self.setUsersPhotoURL(Image: self.imagesArray, FileName:self.imgName)
    
                    picker.dismiss(animated: true, completion: nil)
                }
                present(picker, animated: true, completion: nil)
    
            }
     
    
    
    
    func CellRedistration(){
        let nib=UINib(nibName: "CarImageCell", bundle: nil)
        carImageCollection.register(nib, forCellWithReuseIdentifier: "CarImageCell")
    }
    
    
    
    
    @IBAction func fuelTY(_ sender: Any) {
        
        
            self.dropDown.anchorView = self.fuelTypeAction
            self.dropDown.dataSource = self.fuel
            self.dropDown.cellNib = UINib(nibName: "DropDownView", bundle: nil)
            
            self.dropDown.customCellConfiguration = { (index: Index, item: String, cell: DropDownCell) -> Void in
            }
            self.dropDown.selectionAction = { [self] (index: Int, item: String) in
                print("Selected item: \(item) at index: \(index)")
                self.fuelType.textColor = UIColor.black
                self.fuelType.text = item
                fuelIds = fuelId[index]

            }
            self.dropDown.width = self.fuelType.frame.size.width
            self.dropDown.bottomOffset = CGPoint(x: 0, y:(self.dropDown.anchorView?.plainView.bounds.height)!)
            
            self.dropDown.show()
        }
    

    @IBAction func service(_ sender: Any) {
            
            self.dropDown.anchorView = self.serviceHistory
            self.dropDown.dataSource = self.servicehistorys
            self.dropDown.cellNib = UINib(nibName: "DropDownView", bundle: nil)
            
            self.dropDown.customCellConfiguration = { (index: Index, item: String, cell: DropDownCell) -> Void in
            }
            self.dropDown.selectionAction = { [self] (index: Int, item: String) in
                print("Selected item: \(item) at index: \(index)")
                self.serviceHistory.textColor = UIColor.black
                self.serviceHistory.text = item
                servicehistorysIds = servicehistorysId[index]

            }
            self.dropDown.width = self.serviceHistory.frame.size.width
            self.dropDown.bottomOffset = CGPoint(x: 0, y:(self.dropDown.anchorView?.plainView.bounds.height)!)
            self.dropDown.show()
        }
    
    @IBAction func makeAction(_ sender: Any) {
            self.dropDown.anchorView = self.makeText
            self.dropDown.dataSource = self.carType
            self.dropDown.cellNib = UINib(nibName: "DropDownView", bundle: nil)
            
            self.dropDown.customCellConfiguration = { (index: Index, item: String, cell: DropDownCell) -> Void in
            }
            self.dropDown.selectionAction = { [self] (index: Int, item: String) in
                print("Selected item: \(item) at index: \(index)")
                self.makeText.textColor = UIColor.black
                self.makeText.text = item
                carTypeIds = carTypeId[index]

                
            }
            self.dropDown.width = self.makeText.frame.size.width
            self.dropDown.bottomOffset = CGPoint(x: 0, y:(self.dropDown.anchorView?.plainView.bounds.height)!)
            self.dropDown.show()
        }
    
    
        @IBAction func bodyTY(_ sender: Any) {
            self.dropDown.anchorView = self.saloonAction
            self.dropDown.dataSource = self.saloon
            self.dropDown.cellNib = UINib(nibName: "DropDownView", bundle: nil)
            
            self.dropDown.customCellConfiguration = { (index: Index, item: String, cell: DropDownCell) -> Void in
            }
            self.dropDown.selectionAction = { [self] (index: Int, item: String) in
                print("Selected item: \(item) at index: \(index)")
                self.doors.textColor = UIColor.black
                self.doors.text = item
                saloonIds = saloonId[index]

                
            }
            self.dropDown.width = self.doors.frame.size.width
            self.dropDown.bottomOffset = CGPoint(x: 0, y:(self.dropDown.anchorView?.plainView.bounds.height)!)
            self.dropDown.show()
        }
    
    
    @IBAction func gearboxx(_ sender: Any) {
            self.dropDown.anchorView = self.serviceTypeAction
            self.dropDown.dataSource = self.engine
            self.dropDown.cellNib = UINib(nibName: "DropDownView", bundle: nil)
            
            self.dropDown.customCellConfiguration = { (index: Index, item: String, cell: DropDownCell) -> Void in
            }
            self.dropDown.selectionAction = { [self] (index: Int, item: String) in
                print("Selected item: \(item) at index: \(index)")
                self.serviceType.textColor = UIColor.black
                self.serviceType.text = item
                engineIds = engineId[index]

                
            }
            self.dropDown.width = self.serviceType.frame.size.width
            self.dropDown.bottomOffset = CGPoint(x: 0, y:(self.dropDown.anchorView?.plainView.bounds.height)!)
            
            self.dropDown.show()
        }
    
    

    
}
extension SellCarVC:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesArray.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:CarImageCell = carImageCollection.dequeueReusableCell(withReuseIdentifier: "CarImageCell", for: indexPath) as! CarImageCell
        cell.configureCarPhoto(item: imagesArray[indexPath.row])
        return cell
    }
    
}

extension SellCarVC:UICollectionViewDelegateFlowLayout{
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
extension SellCarVC{
    
    func checkData () -> Bool {
        if   !carNameText.text!.isEmpty{
            if !priceText.text!.isEmpty && !milageText.text!.isEmpty && !doors.text!.isEmpty && !fuelType.text!.isEmpty && !serviceType.text!.isEmpty && !postedIn.text!.isEmpty && !makeText.text!.isEmpty && !modelText.text!.isEmpty && !yearText.text!.isEmpty && !colorText.text!.isEmpty && !serviceHistory.text!.isEmpty &&
                !descriptionTextView.text!.isEmpty && !feachers.text!.isEmpty {
                return true
            }
            
        }else{
            
            self.showAlertMessage(title: "Notice", message: "car Name required")
            return false
        }
        return false
    }
    
}


extension SellCarVC{
    func setting () {
 
        UserApiController.Setting { status, country, engine, saloon, carType, fuel, serviceType in
            guard let  _country = country else {return}
            guard let _engine=engine else {return}
            guard let _saloon=saloon else {return}
            guard let _carType=carType else {return}
            guard let _fuels=fuel else {return}
            guard let _servicehistory=serviceType else {return}
            
            for index in 0..._country.count-1 {
                
                self.countryName.append(_country[index].name ?? "")
                self.countryId.append(_country[index].id ?? 0)
            }
            
            for index in 0..._engine.count-1 {
                
                self.engine.append(_engine[index].name ?? "")
                self.engineId.append(_engine[index].id ?? 0)
            }
            
            
            for index in 0 ... _saloon.count-1{
                self.saloon.append(_saloon[index].name ?? "")
                self.saloonId.append(_saloon[index].id ?? 0)
                
                
            }
            for index in 0 ... _carType.count-1{
                self.carType.append(_carType[index].name ?? "")
                self.carTypeId.append(_carType[index].id ?? 0)
                
                
            }
            
            for index in 0 ... _fuels.count-1{
                self.fuel.append(_fuels[index].name ?? "")
                self.fuelId.append(_fuels[index].id ?? 0)
                
                
            }
            for index in 0 ... _servicehistory.count-1{
                self.servicehistorys.append(_servicehistory[index].name ?? "")
                self.servicehistorysId.append(_servicehistory[index].id ?? 0)
                
                
            }
        }
        
       
    }
}
extension SellCarVC{

    func sellCar(){
        SellerCar = CarData.init(price: Int(priceText.text!) ?? 0, payment_method: self.payment.titleForSegment(at: self.payment.selectedSegmentIndex)!, car_status: self.carUsed.titleForSegment(at: self.carUsed.selectedSegmentIndex)!, mileage: Int(milageText.text!) ?? 0, saloon_id: saloonIds, fuel_id: fuelIds, engine_id: engineIds, car_type_id: carTypeIds, car_model: modelText.text!, year: Int(yearText.text!) ?? 0, color: colorText.text!, service_history_id:servicehistorysIds, country_id: countryids, latitude:24.535 , longitude: 24.535, mobile: 059888888, name_en: carNameText.text!, details_en: descriptionTextView.text!)
        
        guard let sellCar = SellerCar else {return}
            UserApiController.AddCar(images: imagesArray, car: sellCar, param:  self.makeParmaeter()) { status, message in
                
            }

        }
        
        
        
  


func makeParmaeter() -> [String:Any]{
    
        
        var newArry : [[String:Any]] = []

    
    for index in 0...addFeature.count-1{
           
            newArry.append(["features[\(index)]": "\(addFeature[index])"])
            
        }
        
        for indexx in 0...imagesArray.count-1{
           
            newArry.append(["images[\(indexx)]" : "\(imagesArray[indexx])"])
            
        }
        
        let result = newArry.compactMap { $0 }.reduce([:]) { $0.merging($1) { (current, _) in current } }
        print(result)
        return result
    }
}
//self.SellerCar = CarData(price: Int(self.price.text!) ?? 0, payment_method: self.payment.titleForSegment(at: self.payment.selectedSegmentIndex)!, car_status: self.used.titleForSegment(at: self.used.selectedSegmentIndex)!, mileage: Int(self.millege.text!) ?? 0, saloon_id: self.saloonIds, fuel_id: self.fuelIds, engine_id: self.engineIds, car_type_id: self.carTypeIds, car_model: self.model.text!, year: Int(self.year.text!) ?? 0, color: self.color.text!, service_history_id:  self.servicehistorysIds , country_id: self.countryids, latitude: self.lat, longitude: self.longt, mobile: Int(self.allNumber) ?? 0, name_en: self.carName.text!, details_en: self.descriptionText.text!)
//                guard let car = self.SellerCar else {return}
//                self.showLoading()
//                CarApiController.AddCar( images:self.imagesArray, car: car, param: self.makeParmaeter()) { (status, message) in
//                    self.hideLoading()
//                    self.showAlertMessage(title: "Sayarat", message: message)
//
//                }
//
//
