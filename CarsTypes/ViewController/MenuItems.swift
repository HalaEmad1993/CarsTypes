//
//  MenuItems.swift
//  CarsTypes
//
//  Created by Hla Alhelou on 16/12/2021.
//

import Foundation
import UIKit


enum MenuItemData{
 static  let All=[Home,Favourite,sellYourCar,AboutUS,ContactUs,PrivacyPolicy,Arabic,Logout]

    case Home
    case Favourite
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
            break
        case .Favourite:
            return UIImage(named: "favourites")
            break
        case .sellYourCar:
            return UIImage(named: "plus-circle")
            break
        case .AboutUS:
            return UIImage(named: "aboutUs")
            break
        case .ContactUs:
            return UIImage(named: "Combined Shape")
            break
        case .PrivacyPolicy:
            return UIImage(named: "file-minus")
            break
        case .Arabic:
            return UIImage(named: "globe")
            break
        case .Logout:
            return UIImage(named: "power")

        }
    }
        var menueName:String?{
            switch self{
                
            case .Home:
                return "Home"
                break
            case .Favourite:
                return "Favourite"
                break
            case .sellYourCar:
                return "sell Your Car"
                break
            case .AboutUS:
                return "About US"
                break
            case .ContactUs:
                return "Contact Us"
                break
            case .PrivacyPolicy:
                return "Privacy Policy"
                break
            case .Arabic:
                return "Arabic"
                break
            case .Logout:
                return "Logout"

            }
        
        
        
    }
    
    
    
    
    
    
    
    
    
}

