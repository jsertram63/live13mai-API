//
//  phoroModel.swift
//  live13mai-API
//
//  Created by Lunack on 13/05/2022.
//

import Foundation


struct Photo:Hashable, Codable {
    let albumId:Int
    let id:Int
    let title:String
    let url:String    
}
