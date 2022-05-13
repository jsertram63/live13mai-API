//
//  todoModel.swift
//  live13mai-API
//
//  Created by Lunack on 13/05/2022.
//

import Foundation
struct Todo: Hashable, Codable {
    let userId:Int
    let id:Int
    let title:String
    let completed:Bool
    
}
