//
//  EmployeeModel.swift
//  EmployeeDataAPI
//
//  Created by Karan Gajjar on 11/22/20.
//

import Foundation
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let employeeModel = try? newJSONDecoder().decode(EmployeeModel.self, from: jsonData)

import Foundation

// MARK: - EmployeeModelElement
struct EmployeeModelElement: Codable {
    let id: Int
    let name, username, email: String
    let address: Address
    let phone, website: String
    let company: Company
}

// MARK: - Address
struct Address: Codable {
    let street, suite, city, zipcode: String
    let geo: Geo
}

// MARK: - Geo
struct Geo: Codable {
    let lat, lng: String
}

// MARK: - Company
struct Company: Codable {
    let name, catchPhrase, bs: String
}

//typealias EmployeeModel = [EmployeeModelElement]
