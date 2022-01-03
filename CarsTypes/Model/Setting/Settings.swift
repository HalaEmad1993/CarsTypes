/* 
Copyright (c) 2021 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
import ObjectMapper

struct Settings : Mappable {
	var id : Int?
	var url : String?
	var logo : String?
	var app_store_url : String?
	var play_store_url : String?
	var info_email : String?
	var mobile : String?
	var phone : String?
	var facebook : String?
	var twitter : String?
	var linked_in : String?
	var instagram : String?
	var whatsapp : String?
	var latitude : String?
	var longitude : String?
	var image : String?
    var privacy_policy_url : String?

	var countries : [Countries]?
	var fuels : [Fuels]?
	var engines : [Engine]?
	var cars_types : [Cars_types]?
	var saloons : [Saloons]?
	var services_histories : [Services_histories]?
	var about_us : About_us?
	var privacy : Privacy?
	var title : String?
	var address : String?
	var description : String?

	init?(map: Map) {

	}

	mutating func mapping(map: Map) {
        privacy_policy_url <- map["privacy_policy_url"]

		id <- map["id"]
		url <- map["url"]
		logo <- map["logo"]
		app_store_url <- map["app_store_url"]
		play_store_url <- map["play_store_url"]
		info_email <- map["info_email"]
		mobile <- map["mobile"]
		phone <- map["phone"]
		facebook <- map["facebook"]
		twitter <- map["twitter"]
		linked_in <- map["linked_in"]
		instagram <- map["instagram"]
		whatsapp <- map["whatsapp"]
		latitude <- map["latitude"]
		longitude <- map["longitude"]
		image <- map["image"]
		countries <- map["countries"]
		fuels <- map["fuels"]
		engines <- map["engines"]
		cars_types <- map["cars_types"]
		saloons <- map["saloons"]
		services_histories <- map["services_histories"]
		about_us <- map["about_us"]
		privacy <- map["privacy"]
		title <- map["title"]
		address <- map["address"]
		description <- map["description"]
	}

}
