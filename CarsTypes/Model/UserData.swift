//
//  UserData.swift
//  Sayarat
//
//  Created by macbook on 8/23/21.
//

import Foundation
import UIKit
struct UserData {
    var name:String
    var mobile:String
    var profileImg:UIImage
    var address:String
    var password:String
    var confirmPassword:String
    var email:String
    
}
struct Profile {
    var name:String
    var mobile:String
    var profileImg:UIImage
    var address:String
    var email:String

}



struct SocialLog {
    var name:String
    var email:String
    var profileImg:String
    var provider:String
    var social_token:String

}

struct CarData{
    
    var price:Int
    var payment_method:String
    var car_status:String
    var mileage:Int
    var saloon_id:Int
    var fuel_id:Int
    var engine_id:Int
    var car_type_id:Int
    var car_model:String
    var year:Int
    var color:String
    var service_history_id:Int
    var country_id:Int
    var latitude:Double
    var longitude:Double
    var mobile:Int
    var name_en:String
    var details_en:String


 
    
}
struct FilterData{
    
    var car_type_id:Int
    var payment_method:String
    var country_id:Int
    var price_from:Int
    var price_to:Int

    
}
