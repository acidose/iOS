//
//  Petition.swift
//  P7 WhiteHouse Petitions
//
//  Created by Peter Romachov on 19/6/20.
//  Copyright © 2020 Peter Romachov. All rights reserved.
//

import Foundation

struct Petition: Codable {
    var title: String
    var body: String
    var signatureCount: Int
}
