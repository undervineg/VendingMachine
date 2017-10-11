//
//  HistoryFormat.swift
//  VendingMachinePackageDescription
//
//  Created by 심 승민 on 2017. 10. 11..
//

import Foundation


/// 날짜별 판매한 자재명, 수량, 단가, 금액, 지급액, 잔액
struct History {
    let salesDate: Date
    let productName: String
    let quantity: Int
    let productPrice: Int
    let sumAmount: Int
    let payAmount: Int
    let balance: Int
    
    var historyText: String {
        return "Sales Date: \(salesDate) | Product Name: \(productName) | Quantity: \(quantity) | Produce Price: \(producePrice) | Sum Amount: \(sumAmount) | Pay Amount: \(payAmount) | Balance: \(balance)"
    }
}
