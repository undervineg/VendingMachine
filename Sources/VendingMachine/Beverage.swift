//
//  Beverage.swift
//  VendingMachinePackageDescription
//
//  Created by 심 승민 on 2017. 10. 11..
//

import Foundation

class Beverage: Equatable {
    let brand: String?
    let weight: Int?
    let price: Int?
    let name: String?
    let manufacturedDate: Date?
    
    
    init(brand: String, weight: Int, price: Int, name: String){
        self.brand = brand
        self.weight = weight
        self.price = price
        self.name = name
        self.manufacturedDate = Date(timeIntervalSinceNow: 0.0)
    }
    
    public static func ==(lhs: Beverage, rhs: Beverage) -> Bool{
        return  lhs.brand == rhs.brand &&
                lhs.name == rhs.name
    }
}
