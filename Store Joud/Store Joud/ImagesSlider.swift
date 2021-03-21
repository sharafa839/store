//
//  ImagesSlider.swift
//  Store Joud
//
//  Created by ahmed on 3/20/21.
//

import Foundation
struct ImageSlider:Decodable {
    
    let payload : [payload]
}

struct payload:Decodable {
    let id :String
    let url :String
    let media_links:[String]
}
