//
//  VendingMachine.swift
//  VendingMachinePackageDescription
//
//  Created by 심 승민 on 2017. 10. 11..
//

import Foundation

struct VendingMachine{
    var balance: Int
    var products: [Beverage]
    var histories: [History]
    
    // 사용자의 금액을 입력받아 저장 및 전광판에 보여줌
    func insertMoney(amountOf amount: Int){ }
    
    // 음료 객체를 만들어서 amount 개수만큼 자판기를 채움
    func add(_ item: BeverageMenu, amountOf amount: Int){ }
    
    // 현재 raiseMoney로 찍은 금액 안에서 살 수 있는 음료 리스트 리턴. 음료자판기 버튼 빨갛게 표시하기 위함
    func getAffordableItemList() -> [String]{ }
    
    // 사용자가 원하는 음료 이름을 받아 조건을 만족하면 음료 반환
    // 특정 음료의 가격이 사용자가 넣은 금액보다 같거나 작고, 특정음료가 품절이 아니면 구매 가능
    // 구매 시 재고에서 차감(-1), History 추가
    func buy(_ itemName: BeverageMenu) -> Beverage{ }
    
    // 사용자가 입력한 금액에서 구매한 금액을 뺀 나머지 리턴
    func checkBalance() -> Int{ }
    
    // 현재 남아있는 음료의 재고 리스트(음료명:재고수) 리턴. 품절 표시하기 위함.
    func getInventoryList() -> [String:Int]{ }
    
    // 이제까지 쌓아온 History 배열 반환
    func getSalesHistory() -> [History]{ }
}
