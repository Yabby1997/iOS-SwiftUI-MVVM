//
//  APIService.swift
//  SwiftUI-MVVM
//
//  Created by Seunghun Yang on 2021/07/08.
//

import Foundation

class APIService {
    func getUsers(completion : @escaping (([User]) -> ())) {
        completion([
            User(id: 1, name: "승훈"),
            User(id: 2, name: "승준"),
            User(id: 3, name: "성원")
        ])
    }
}
