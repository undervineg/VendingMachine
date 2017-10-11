//
//  VendingMachine.swift
//  VendingMachinePackageDescription
//
//  Created by 심 승민 on 2017. 10. 11..
//

import Foundation

struct VendingMachine{
    private let menu: Menu
    private var balance: Int
    private var stocks: [Beverage] = []{
        // stocks가 추가되면 inventory 리스트를 업데이트함
        didSet{
            // stock에 더해졌다면
            if oldValue.count < stocks.count{
                if let addedItem = oldValue.last{
                    for inventory in inventoryList{
                        if let count = inventory[addedItem.name]{
                            inventoryList.append( [addedItem.name : count+1] )
                        }
                    }
                }
            }
        }
        willSet{
            // stock에서 판매되었다면
            if newValue.count < stocks.count{
                if let soldItem = stocks.last{
                    for inventory in inventoryList{
                        if let count = inventory[soldItem.name]{
                            inventoryList.append( [soldItem.name : count-1] )
                            let history = "\(Date(timeIntervalSinceNow: 0.0))에 \(soldItem.name)이 판매되었습니다."
                            histories.append(history)
                        }
                    }
                }
            }
        }
    }
    private var inventoryList: [[String:Int]]
    private var histories: [String]
    
    
    // 사용자 지급액 추가
    mutating func insertMoney(amountOf amount: Int){
        balance += amount
    }
    
    // 재고 추가
    mutating func add(_ item: Menu, amountOf amount: Int){
        // 여러 개의 음료 생성
        for _ in 0..<amount{
            stocks.append( produce(item) )
        }
    }
    
    private func produce(_ item: Menu) -> Beverage{
        switch item {
        case .Coke(size: .Small):
            return Beverage(brand: "코카콜라 컴퍼니", weight: 250, price: menu.price, name: menu.name)
        case .Coke(size: .Medium):
            return Beverage(brand: "코카콜라 컴퍼니", weight: 250, price: menu.price, name: menu.name)
        case .Vita500:
            return Beverage(brand: "광동제약", weight: 100, price: menu.price, name: menu.name)
        case .OronaminC:
            return Beverage(brand: "동아오츠카", weight: 120, price: menu.price, name: menu.name)
        case .Perrier:
            return Beverage(brand: "네슬레", weight: 350, price: menu.price, name: menu.name)
        case .Evian:
            return Beverage(brand: "다논", weight: 500, price: menu.price, name: menu.name)
        }
    }
    
    
    // balance 안에서 살 수 있는 음료 리스트 리턴. 음료자판기 버튼 빨갛게 표시하기 위함
    func getAffordableItemList() -> [String]{
        var affordableBeverages: [String] = []
        
        for item in menu.getMenuList(){
            if isPriceAffordable(item){
                affordableBeverages.append(item.name)
            }
        }
        return affordableBeverages
    }
    
    
    // 사용자가 원하는 음료 이름을 받아 조건을 만족하면 음료 반환
    // 특정 음료의 가격이 사용자가 넣은 금액보다 같거나 작고, 특정음료가 품절이 아니면 구매 가능
    // 구매 시 재고에서 차감(-1), History 추가
    mutating func buy(_ item: Menu) -> Beverage?{
        if isPriceAffordable(item) && hasStocks(of: item){
            for (index,beverage) in stocks.enumerated(){
                if item.name == beverage.name{
                    return stocks.remove(at: index)
                }
            }
        }
        return nil
    }
    
    private func isPriceAffordable(_ item: Menu) -> Bool{
        return (item.price >= balance) ? true : false
    }
    
    private func hasStocks(of item: Menu) -> Bool{
        for inventory in inventoryList{
            if let inventory = inventory[item.name] {
                return (inventory > 0) ? true : false
            }
        }
        return false
    }
    
    
    // 사용자가 입력한 금액에서 구매한 금액을 뺀 나머지 리턴
    func checkBalance(item: Beverage) -> Int{
        return balance - item.price
    }
    
    // 현재 남아있는 음료의 재고 리스트(음료명:재고수) 리턴. 품절 표시하기 위함.
    func getInventoryList() -> [[String:Int]]{
        return inventoryList
    }
    
    // 이제까지 쌓아온 History 배열 반환
    func getPurchaseHistory() -> [String]{
        return histories
    }
}














