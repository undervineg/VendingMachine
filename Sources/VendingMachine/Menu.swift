//
//  Menu.swift
//  VendingMachinePackageDescription
//
//  Created by 심 승민 on 2017. 10. 11..
//

import Foundation

enum Menu {
    enum Size{
        case Small, Medium
    }
    case Coke(size: Size)
    case Vita500
    case OronaminC
    case Perrier
    case Evian
    
    
    var price: Int{
        switch self {
        case .Coke(size: Size.Small): return 700
        case .Coke(size: Size.Medium): return 1500
        case .Vita500: return 500
        case .OronaminC: return 1000
        case .Perrier: return 3000
        case .Evian: return 1500
        }
    }
    
    var name: String{
        switch self {
        case .Coke(size: Size.Small): return "코카콜라 250ml"
        case .Coke(size: Size.Medium): return "코카콜라 500ml"
        case .Vita500: return "비타500"
        case .OronaminC: return "오로나민씨"
        case .Perrier: return "페리에"
        case .Evian: return "에비앙"
        }
    }
    
    
    func getMenuList() ->[Menu]{
        var menus: [Menu] = []
        switch self {
        case .Coke(size: Size.Small): menus.append(self); fallthrough
        case .Coke(size: Size.Medium): menus.append(self); fallthrough
        case .Vita500: menus.append(self); fallthrough
        case .OronaminC: menus.append(self); fallthrough
        case .Perrier: menus.append(self); fallthrough
        case .Evian: menus.append(self)
        }
        return menus
    }
    
}


