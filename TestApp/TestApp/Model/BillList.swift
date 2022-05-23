//
//  BillList.swift
//  TestApp
//
//  Created by javad on 28.04.22.
//

import Foundation

struct BillList: Codable {
    let createdAt, name: String
    let avatar: String
    let thisMonth, lastMonth: [Month]
    let id: String
}

struct Month: Codable {
    let friends: [Friend]
    let title, totalPayment, percent: String
}

struct Friend: Codable {
    let avatarURL: String
}
