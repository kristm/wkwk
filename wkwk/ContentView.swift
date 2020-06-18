//
//  ContentView.swift
//  wkwk
//
//  Created by Krist Menina on 2/17/20.
//  Copyright © 2020 Hello Wala Studios. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var ac: Config
    let timer = Timer.publish(every: 60, on: .current, in: .common).autoconnect()
    @State var isViewDisplayed = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            ZStack(alignment: .top) {
                Image("spongerainbow").resizable().frame(width: 300, height: 300)
                
                Text(ac.lapsedTime)
                .font(.system(size: 32))
                .foregroundColor(.white)
                .shadow(radius: 1)
                .padding(40)
                
            }.onReceive(timer, perform: { time in
                print("receive\(time)")

                if self.isViewDisplayed {
                    self.ac.getTime()
                }
            })
            Button(action: {
                smile(env: self.ac)
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
        .onAppear{
            self.isViewDisplayed = true
        }
        .onDisappear{
            self.isViewDisplayed = false
        }
        
        
    }
}

private func smile(env: Config) {
    
    let appDelegate = NSApplication.shared.delegate as! AppDelegate
    let date = Date()
    let calendar = Calendar.current
    
    let hour = calendar.component(.hour, from: date)
    
    let status = hour <= 11 ? 0 : 1
    
    NSPasteboard.general.clearContents()
    NSPasteboard.general.setString(env.requests[status], forType: .string)

    env.setTime(time: date)
    
    if status == 1 {
        print(">> \(env.getTime())")
        // myConfig.resetTime()
    }
    
    appDelegate.window.close()
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(Config())
    }
}
