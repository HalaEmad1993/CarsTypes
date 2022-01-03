//
//  UserApiController.swift
//  CarsTypes
//
//  Created by Hla Alhelou on 26/12/2021.
//
import Foundation
import ObjectMapper
import Alamofire


typealias Callback = ( _ status: Bool ,_ message:String) -> Void

struct UserApiController{
    
 
static func LoginRequest(email: String,password:String, callback: @escaping (Userlogin?,Bool) ->Void) {

            let parameters: Parameters = ["email":email,
                                          "password":password]

    AF.request(Api_Key.login.Url, method: .post , parameters:parameters,headers:["Accept-Language": "en"]).validate().responseJSON { [self] (response) in
           if let data  = response.data,let str : String = String(data: data, encoding: .utf8){
         print(str)
               print(data)
                    if let parsedMapperString : Login = Mapper<Login>().map(JSONString:str){
                        if parsedMapperString.status == true{
                            //token,name
                            callback(parsedMapperString.user!, true)
                        }else{
                            callback( nil , false)

                            print("user Not found")
                        }

              }
                    }
                }
        }

    
    static func register(user: UserData, callback: @escaping Callback){
     
                    let imgData = user.profileImg.jpegData(compressionQuality: 0.2)!
           
                    let parameters: Parameters = ["name":user.name,
                                                  "email":user.email,
                                                  "mobile":user.mobile,
                                                  "address":user.address,
                                                  "password":user.password,
                                                  "confirm_password":user.confirmPassword,
                                                  "device_type":"ios"
                    ]

                    AF.upload(multipartFormData: { multipartFormData in
                        multipartFormData.append(imgData, withName: "fileset", mimeType: "image/jpg")
                        
                        for (key, value) in parameters {
                            multipartFormData.append("\(value)".data(using: String.Encoding.utf8)!, withName: key as String)                } //Optional for extra parameters
                        
                    },
                              to:Api_Key.signUpUsers.Url, method: .post,headers: ["Accept-Language": "en"]).validate().responseJSON { [self] (response) in
                   if let data  = response.data,let str : String = String(data: data, encoding: .utf8){
                 print(str)
                       print(data)
                       // signup
                            if let parsedMapperString : SignUp = Mapper<SignUp>().map(JSONString:str){
                                if parsedMapperString.status == true{
                                    
                                    callback(true, parsedMapperString.message!)
                                }else{
                                    callback(false, parsedMapperString.message!)

                                    print("user Not found")
                                }
                                
                      }
                            }
                        }
                }
    
    static func HomeData( callback: @escaping (Bool,[Datas]?) ->Void){


        AF.request(Api_Key.homeScreen.Url, method: .get , parameters:nil,headers:["Accept-Language": "en"]).validate().responseJSON { [self] (response) in
               if let data  = response.data,let str : String = String(data: data, encoding: .utf8){
             print(str)
                   print(data)
                        if let parsedMapperString : HomeData = Mapper<HomeData>().map(JSONString:str){
                            if parsedMapperString.status == true{
                                callback(true,parsedMapperString.cars?.data)
                            }else{
                                callback(false,nil)

                                print("user Not found")
                            }
                            
                  }
                        }
                    }
            }
    
    
    static func logout( callback: @escaping Callback){
     

            let parameters: Parameters? = nil
                    

        AF.request(Api_Key.logout.Url, method: .get , parameters:parameters,headers:["Accept-Language": "en","Authorization":"\(UserDefaults.standard.value(forKey: "Token") ?? "")"]).validate().responseJSON { [self] (response) in
               if let data  = response.data,let str : String = String(data: data, encoding: .utf8){
             print(str)
                   print(data)
                        if let parsedMapperString : Response = Mapper<Response>().map(JSONString:str){
                            if parsedMapperString.status == true{
                                callback(true, parsedMapperString.message!)
                            }else{
                                callback(false,  parsedMapperString.message!)

                                print("user Not found")
                            }
                            
                  }
                        }
                    }
                }
    
    static func GetProfile( callback: @escaping ( _ status:Bool,UserProfile?) -> Void){
//     print(UserDefaults.standard.value(forKey: "Token") ?? "")

            let parameters: Parameters? = nil
                
        AF.request(Api_Key.profile.Url, method: .get , parameters:parameters,headers:["Accept-Language": "en","Authorization":"\(UserDefaults.standard.value(forKey: "Token") ?? "")"]).validate().responseJSON { [self] (response) in
               if let data  = response.data,let str : String = String(data: data, encoding: .utf8){
             print(str)
                   print(data)
                        if let parsedMapperString : profilesData = Mapper<profilesData>().map(JSONString:str){
                            if parsedMapperString.status == true{
                                callback(true, parsedMapperString.user)
                            }else{
                                callback(false,nil)
                            }
                            
                  }
                
                        }
                    }
                }
    static func EditProfile(user: Profile, callback:@escaping Callback){
     
                    let imgData = user.profileImg.jpegData(compressionQuality: 0.2)!

                    let parameters: Parameters = ["name":user.name,
                                                  "email":user.email,
                                                  "mobile":user.mobile,
                                                  "address":user.address,
                                                  "device_type":"ios"]
                    

                    AF.upload(multipartFormData: { multipartFormData in
                        multipartFormData.append(imgData, withName: "fileset", mimeType: "image/jpg")
                        for (key, value) in parameters {
                            multipartFormData.append("\(value)".data(using: String.Encoding.utf8)!, withName: key as String)                } //Optional for extra parameters
                        
                    },
                              to:Api_Key.editProfile.Url, method: .post,headers: ["Accept-Language": "en","Authorization":"\(UserDefaults.standard.value(forKey: "Token") ?? "")"]).validate().responseJSON { [self] (response) in
                   if let data  = response.data,let str : String = String(data: data, encoding: .utf8){
                 print(str)
                       print(data)
                            if let parsedMapperString : profilesData = Mapper<profilesData>().map(JSONString:str){
                                if parsedMapperString.status == true{
                                    
                                    callback(true, parsedMapperString.message ?? "")
                                }else{
                                    callback(false,"Error")

                                }
                                
                      }
                            }
                        }
                }
    
    
    static func AboutUs( callback: @escaping Callback){
     

            let parameters: Parameters? = nil
                    

        AF.request(Api_Key.aboutUs.Url, method: .get , parameters:parameters,headers:["Accept-Language": "en"]).validate().responseJSON { [self] (response) in
               if let data  = response.data,let str : String = String(data: data, encoding: .utf8){
             print(str)
                   print(data)
                        if let parsedMapperString : AboutData = Mapper<AboutData>().map(JSONString:str){
                            if parsedMapperString.status == true{
                                callback(true, (parsedMapperString.page?.description!)!)
                            }else{
                                callback(false, "theres no data")
                            }
                            
                  }
                
                        }
                    }
                }
    
    static func ContactUs(title:String,message:String, callback: @escaping Callback){
     

            let parameters: Parameters? = ["title":title,
                                           "message":message
                                      
             ]
                
        AF.request(Api_Key.sendContactUsMsg.Url, method: .post , parameters:parameters,headers:["Accept-Language": "en","Authorization":"\(UserDefaults.standard.value(forKey: "Token") ?? "")"]).validate().responseJSON { [self] (response) in
               if let data  = response.data,let str : String = String(data: data, encoding: .utf8){
             print(str)
                   print(data)
                        if let parsedMapperString : Response = Mapper<Response>().map(JSONString:str){
                            if parsedMapperString.status == true{
                                callback(true, parsedMapperString.message ?? "")
                            }else{
                                callback(false, parsedMapperString.message ?? "")
                            }
                            
                  }
                
                        }
                    }
                }
    
    
    static func changePassword(oldPass: String,newPass:String,confirmPass:String, callback:@escaping Callback){
     

                    let parameters: Parameters = ["old_password":oldPass,
                                                  "password":newPass,
                                                  "confirm_password":confirmPass
                    ]
                    
        AF.request(Api_Key.changePassword.Url, method: .post,parameters: parameters,headers: ["Accept-Language": "en","Authorization":"\(UserDefaults.standard.value(forKey: "Token") ?? "")"]).validate().responseJSON { [self] (response) in
                   if let data  = response.data,let str : String = String(data: data, encoding: .utf8){
                 print(str)
                       print(data)
                            if let parsedMapperString : Response = Mapper<Response>().map(JSONString:str){
                                if parsedMapperString.status == true{
                                    
                                    callback(true, parsedMapperString.message ?? "")
                                }else{
                                    callback(true, parsedMapperString.message ?? "")

                                }
                                
                      }
                            }
                        }
                }
    static func sendEmail(email:String, callback:@escaping Callback){
     

                    let parameters: Parameters = ["email":email
                                                  
                    ]
                    
        AF.request(Api_Key.forgotPassword.Url, method: .post,parameters: parameters,headers: ["Accept-Language": "en"]).validate().responseJSON { [self] (response) in
                   if let data  = response.data,let str : String = String(data: data, encoding: .utf8){
                 print(str)
                       print(data)
                            if let parsedMapperString : Response = Mapper<Response>().map(JSONString:str){
                                if parsedMapperString.status == true{
                                    
                                    callback(true, parsedMapperString.message ?? "")
                                }else{
                                    callback(true, parsedMapperString.message ?? "")

                                }
                                
                      }
                            }
                        }
                }
       
    static func AddCar(_ imagesKey:String = "images[]", images : [UIImage],car:CarData,param:[String: Any],callback:@escaping Callback ){
            var imgData:[Data]=[]

            var parameters=param
            parameters["payment_method"] = car.payment_method
            parameters["car_status"] = car.car_status
            parameters["mileage"] = car.mileage
            parameters["saloon_id"] = car.saloon_id
            parameters["fuel_id"] = car.fuel_id
            parameters["engine_id"] = car.engine_id
            parameters["car_type_id"] = car.car_type_id
            parameters["car_model"] = car.car_model
            parameters["year"] = car.year
            parameters["color"] = car.color
            parameters["price"] = car.price
            parameters["service_history_id"] = car.service_history_id
            parameters["country_id"] = car.country_id
            parameters["longitude"] = car.longitude
            parameters["latitude"] = car.latitude
            parameters["mobile"] = car.mobile
            parameters["name_en"] = car.name_en
            parameters["details_en"] = car.details_en


            AF.upload(multipartFormData: { (multipartFormData) in
                
                for img in images {
                    let data =  img.jpegData(compressionQuality:0.50)
                    
                    multipartFormData.append(data!, withName: imagesKey, fileName: "\(Date().timeIntervalSince1970).jpeg", mimeType: "image/jpeg")
                }
                
                for (key, value) in parameters {
                    multipartFormData.append(("\(value)".data(using: String.Encoding.utf8))!, withName: key)
                }
                
            } ,to:Api_Key.sellYourCar.Url, headers:  ["Accept-Language": "en","Authorization":"\(UserDefaults.standard.value(forKey: "Token") ?? "")"]).responseJSON { (response) in
                
                   if let data  = response.data,let str : String = String(data: data, encoding: .utf8){
                 print(str)
                       print(data)
                            if let parsedMapperString : SellReq = Mapper<SellReq>().map(JSONString:str){
                                if parsedMapperString.status == true{
                                    
                                    callback(true,parsedMapperString.message ?? "")
                                }else{
                                    callback(false, parsedMapperString.message ?? "")

                                }
                                
                      }
                            }
                        }
                }
    
    static func Setting(callback:@escaping (_ status:Bool,[Countries]?,[Engine]?,[Saloons]?,[Cars_types]?,[Fuels]?,[Services_histories]?) -> Void){

        AF.request(Api_Key.Settings.Url, method: .get ,headers: ["Accept-Language": "en"]).validate().responseJSON { [self] (response) in
                   if let data  = response.data,let str : String = String(data: data, encoding: .utf8){
                 print(str)
                       print(data)
                            if let parsedMapperString : UserSetting = Mapper<UserSetting>().map(JSONString:str){
                                if parsedMapperString.status == true{
                                    
                                    callback(true,parsedMapperString.settings?.countries,parsedMapperString.settings?.engines,parsedMapperString.settings?.saloons,parsedMapperString.settings?.cars_types,parsedMapperString.settings?.fuels,parsedMapperString.settings?.services_histories)
                                }else{
                                    callback(false, nil,nil,nil,nil,nil,nil)

                                }
                                
                      }
                            }
                        }
                }
    
    
}
