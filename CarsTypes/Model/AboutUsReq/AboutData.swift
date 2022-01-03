//
//  AboutData.swift
//  Sayarat
//
//  Created by macbook on 8/25/21.
//

import Foundation

import Foundation
import ObjectMapper

struct AboutData : Mappable {
    var status : Bool?
    var code : Int?
    var message : String?
    var page : AboutUs?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        status <- map["status"]
        code <- map["code"]
        message <- map["message"]
        page <- map["page"]
    }

}
