//
//  Country.swift
//  TableCollectionProgrammatic
//
//  Created by Atil Samancioglu on 12.10.2023.
//

import Foundation

struct Country : Decodable {
    let name : String
    let capital : String
    let region : String
    let flag : String
    let language : String
    let currency : String
}
