//
//  Owner.swift
//  Sayarat
//
//  Created by macbook on 9/8/21.
//


import Foundation
import ObjectMapper

struct Owners : Mappable {
    var id : Int?
    var status : String?
    var created_at : String?
    var name : String?
    var email : String?
    var mobile : String?
    var address : String?
    var image_profile : String?
    var latitude : String?
    var longitude : String?
    var provider : String?
    var social_token : String?
    var remember_token : String?








    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        id <- map["id"]
        status <- map["status"]
        created_at <- map["created_at"]
        name <- map["name"]
        email <- map["email"]
        mobile <- map["mobile"]
        address <- map["address"]
        image_profile <- map["image_profile"]
        latitude <- map["latitude"]
        longitude <- map["longitude"]
        provider <- map["provider"]
        social_token <- map["social_token"]
        remember_token <- map["remember_token"]


    }

}
