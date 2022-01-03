//
//  UserSetting.swift
//  Sayarat
//
//  Created by macbook on 8/26/21.
//

import Foundation

import Foundation
import ObjectMapper

struct UserSetting : Mappable {
    var status : Bool?
    var code : Int?
    var message : String?
    var settings : Settings?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        status <- map["status"]
        code <- map["code"]
        message <- map["message"]
        settings <- map["settings"]
    }

}
