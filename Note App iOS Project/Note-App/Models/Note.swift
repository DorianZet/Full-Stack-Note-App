//
//  Note.swift
//  Note-App
//
//  Created by Mateusz Zacharski on 24/12/2020.
//

import Foundation

struct Note: Decodable {
    var title: String
    var date: String
    var _id: String
    var note: String
}
