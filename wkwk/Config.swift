//
//  Store.swift
//  wkwk
//
//  Created by Krist Menina on 2/18/20.
//  Copyright © 2020 Hello Wala Studios. All rights reserved.
//

import Foundation
//import Combine

class Config: ObservableObject {
    //static let sharedInstance = Config()
    var nsDictionary: NSDictionary?
    @Published var requests: [String]
    @Published var timeIn: Date? = nil
    @Published var lapsedTime: String = "00:00"
//    let objectWillChange = ObservableObjectPublisher()
    
    init() {
        let dict = NSDictionary(contentsOfFile: Bundle.main.path(forResource: "wkwk", ofType: "plist")!)
        requests = dict?.object(forKey: "requests") as! [String]
    }
    
    func setTime(time: Date) {
        print("check time \(String(describing: self.timeIn))")
        if self.timeIn == nil {
            self.timeIn = time
        }
    }
    
    func resetTime() {
        self.timeIn = nil
    }


    func getTime() -> String {
        
        
        print("GET TIME\(self.lapsedTime)")
        let date = Date()
        print("timein \(String(describing: self.timeIn))")

        let interval = date.timeIntervalSince(self.timeIn ?? Date())
        let ti = Int(interval)
        let minutes = (ti / 60) % 60
        let hours = (ti / 3600)

        self.lapsedTime = String(format: "%0.2d:%0.2d", hours, minutes)
        return self.lapsedTime
    }
}

