//
//  ContentView.swift
//  wkwk
//
//  Created by Krist Menina on 2/17/20.
//  Copyright © 2020 Hello Wala Studios. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Image("spongerainbow").resizable().frame(width: 300, height: 300)
            Button(action: {
                smile()
            })
            {
                Text("Imagination")
                    .font(.caption)
                    .fontWeight(.semibold)
            }
            .padding(.trailing, 10.0)
            .frame(width: 360.0, alignment: .top)
        }
        .padding(0)
        .frame(width: 360.0, height: 360.0, alignment: .top)
    }
}

private func smile() {
    let appDelegate = NSApplication.shared.delegate as! AppDelegate
    let date = Date()
    let calendar = Calendar.current
    let hour = calendar.component(.hour, from: date)
    let status = hour <= 11 ? 0 : 1
    let myConfig: Config = Config.sharedInstance
    
    NSPasteboard.general.clearContents()
    NSPasteboard.general.setString(myConfig.requests[status], forType: .string)
    
    appDelegate.window.close()
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
