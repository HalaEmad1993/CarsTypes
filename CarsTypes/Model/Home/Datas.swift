/* 
Copyright (c) 2021 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
import ObjectMapper

struct Datas : Mappable {
	var id : Int?
	var user_id : Int?
	var price : Int?
	var payment_method : String?
	var car_status : String?
	var mileage : String?
	var saloon_id : Int?
	var fuel_id : Int?
	var engine_id : Int?
	var car_type_id : Int?
	var car_model : String?
	var year : String?
	var color : String?
	var service_history_id : Int?
	var country_id : Int?
	var latitude : String?
	var longitude : String?
	var mobile : String?
	var status : String?
	var created_at : String?
	var is_favorite : Int?
	var date : String?
	var name : String?
	var details : String?
	var owner : Owner?
	var country : Countries?
	var fuel : Fuel?
	var engine : Engine?
	var car_type : Car_type?
	var saloon : Saloon?
	var service_history : Service_history?
    var photos : [String]?
	var features : [Featuress]?

	init?(map: Map) {

	}

	mutating func mapping(map: Map) {

		id <- map["id"]
		user_id <- map["user_id"]
		price <- map["price"]
		payment_method <- map["payment_method"]
		car_status <- map["car_status"]
		mileage <- map["mileage"]
		saloon_id <- map["saloon_id"]
		fuel_id <- map["fuel_id"]
		engine_id <- map["engine_id"]
		car_type_id <- map["car_type_id"]
		car_model <- map["car_model"]
		year <- map["year"]
		color <- map["color"]
		service_history_id <- map["service_history_id"]
		country_id <- map["country_id"]
		latitude <- map["latitude"]
		longitude <- map["longitude"]
		mobile <- map["mobile"]
		status <- map["status"]
		created_at <- map["created_at"]
		is_favorite <- map["is_favorite"]
		date <- map["date"]
		name <- map["name"]
		details <- map["details"]
		owner <- map["owner"]
		country <- map["country"]
		fuel <- map["fuel"]
		engine <- map["engine"]
		car_type <- map["car_type"]
		saloon <- map["saloon"]
		service_history <- map["service_history"]
		photos <- map["photos"]
		features <- map["features"]
	}

}
