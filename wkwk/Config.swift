//
//  Store.swift
//  wkwk
//
//  Created by Krist Menina on 2/18/20.
//  Copyright © 2020 Hello Wala Studios. All rights reserved.
//

import Foundation

class Config: ObservableObject {
    static let sharedInstance = Config()
    var nsDictionary: NSDictionary?
    @Published var requests: [String]

    init() {
        let dict = NSDictionary(contentsOfFile: Bundle.main.path(forResource: "wkwk", ofType: "plist")!)
        requests = dict?.object(forKey: "requests") as! [String]
    }
}
