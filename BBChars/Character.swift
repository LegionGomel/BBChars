//
//  Character.swift
//  BBChars
//
//  Created by Yuri Ershov on 22.01.22.
//

import Foundation


struct Character: Decodable {
    let char_id: Int
    let name: String
    let birthday: String
    let occupation: [String]
    let img: String
    let nickname: String
    let portrayed: String
}
