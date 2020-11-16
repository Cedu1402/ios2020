//
//  Response.swift
//  ComAndCon
//
//  Created by cedric blaser on 13.11.20.
//

import UIKit

struct Response: Codable {
    let images: [ImageInfo]
    let lastUpdate: Date
    let info: String
}
