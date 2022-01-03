//
//  Response.swift
//  Sayarat
//
//  Created by macbook on 8/24/21.
//


import Foundation
import ObjectMapper

struct Response : Mappable {
    var status : Bool?
    var code : Int?
    var message : String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        status <- map["status"]
        code <- map["code"]
        message <- map["message"]
    }

}
