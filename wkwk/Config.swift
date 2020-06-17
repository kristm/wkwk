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
    var timeIn: Date? = nil
    
    init() {
        let dict = NSDictionary(contentsOfFile: Bundle.main.path(forResource: "wkwk", ofType: "plist")!)
        requests = dict?.object(forKey: "requests") as! [String]
    }
    
    func setTime(time: Date) {
        if self.timeIn == nil {
            self.timeIn = time
        }
    }
    
    func resetTime() {
        self.timeIn = nil
    }


    func getTime() -> String {
        let date = Date()
        print("timein \(String(describing: self.timeIn))")

        let interval = date.timeIntervalSince(self.timeIn ?? Date())
        let ti = Int(interval)
        let minutes = (ti / 60) % 60
        let hours = (ti / 3600)

        return String(format: "%0.2d:%0.2d", hours, minutes)
    }
}

