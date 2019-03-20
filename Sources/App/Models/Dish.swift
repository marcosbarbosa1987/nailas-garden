//
//  Dish.swift
//  App
//
//  Created by Marcos Barbosa on 18/03/19.
//

import Foundation
import Vapor
import FluentPostgreSQL

final class Dish: Content {
    
    var id: Int?
    var name: String
    var course: String
    var price: Double
    var imageURL: String
    var description: String
    
    init(name: String, course: String, price: Double, imageURL: String, description: String) {
        self.name = name
        self.course = course
        self.price = price
        self.imageURL = imageURL
        self.description = description
    }
    
}

extension Dish: PostgreSQLModel {
    static var entity: String = "Dishes"
}
extension Dish: Parameter {}
extension Dish: Migration {}
