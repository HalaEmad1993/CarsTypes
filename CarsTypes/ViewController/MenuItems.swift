//
//  MenuItems.swift
//  CarsTypes
//
//  Created by Hla Alhelou on 16/12/2021.
//

import Foundation
import UIKit


enum MenuItemData {
 static  let All=[Home,sellYourCar,AboutUS,ContactUs,PrivacyPolicy,Arabic,Logout]

    case Home
    case sellYourCar
    case AboutUS
    case ContactUs
    case PrivacyPolicy
    case Arabic
    case Logout

    var imgeMenu:UIImage?{
        switch self{
            
        case .Home:
            return UIImage(named: "home")
   
        case .sellYourCar:
            return UIImage(named: "plus-circle")
        case .AboutUS:
            return UIImage(named: "aboutUs")
        case .ContactUs:
            return UIImage(named: "Combined Shape")
        case .PrivacyPolicy:
            return UIImage(named: "file-minus")
        case .Arabic:
            return UIImage(named: "globe")
        case .Logout:
            return UIImage(named: "power")

        }
    }
        var menueName:String?{
            switch self{
                
            case .Home:
                return "Home"
     
            case .sellYourCar:
                return "sell Your Car"
                
            case .AboutUS:
                return "About US"
                
            case .ContactUs:
                return "Contact Us"
                
            case .PrivacyPolicy:
                return "Privacy Policy"
                
            case .Arabic:
                return "Arabic"
                
            case .Logout:
                return "Logout"

            }
        
        
        
    }
    
    
    
    
    
    
    
    
    
}

