//
//  Store.swift
//  wkwk
//
//  Created by Krist Menina on 2/18/20.
//  Copyright © 2020 Hello Wala Studios. All rights reserved.
//

import Foundation

class Store: ObservableObject {
    static let sharedInstance = Store()
    @Published var requests: [String] = [
        "redacted-url",
        "redacted-url"
    ]
}
