//
//  ApiEndPoint.swift
//  CarsTypes
//
//  Created by Hla Alhelou on 26/12/2021.
//

import Foundation

enum Api_Key:String{
    
    
    case BaseUrl = "http://sayarat.muthqaf.net/public/api/"
    
    
    case login = "loginForUsers"
    case Settings = "settings"
    case aboutUs = "aboutUs"
    case privacyPolicy = "privacyPolicy"
    case signUpUsers = "signUpUsers"
    case forgotPassword = "forgotPassword"
    case profile = "profile"
    case changePassword = "changePassword"
    case editProfile = "editProfile"
    case logout = "logout"
    case sendContactUsMsg = "sendContactUsMsg"
    case getCountries = "getCountries"
    case sellYourCar = "sellYourCar"
    case getMyCars = "getMyCars"
    case getCarDetails = "getCarDetails?id=10"
    case myFavoriteCars = "myFavoriteCars"
    case addToFavoriteCars = "addToFavoriteCars?car_id=10"
    case unFavoriteCar = "unFavoriteCar?car_id=10"
    case homeScreen = "homeScreen?txt=car"
    case deleteCar = "deleteCar?car_id=15"
    case editYourCar = "editYourCar"
    case loginBySocial = "loginBySocial"
    
    var Url : String {
        switch self {
        case .BaseUrl:
            return Api_Key.BaseUrl.rawValue
        default :
            return "\(Api_Key.BaseUrl.rawValue)\(self.rawValue)"
            
         
        }
    }
    
    
    
    
}
