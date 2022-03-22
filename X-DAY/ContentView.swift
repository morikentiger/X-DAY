//
//  ContentView.swift
//  X-DAY
//
//  Created by 森田健太 on 2022/03/23.
//

import SwiftUI

struct ContentView: View {
    var toDate = Calendar.current.date(byAdding: .day, value: 993, to: Date())!
    
    var body: some View {
        TimerView(setDate: toDate)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TimerView : View {
    
    @State var nowDate: Date = Date()
    let setDate: Date
    var timer: Timer {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {_ in
            self.nowDate = Date()
        }
    }
    
    var body: some View {
        Text(TimerFunction(from: setDate))
            .onAppear(perform: {self.timer
            })
    }
    
    func TimerFunction(from date: Date) -> String {
        let calendar = Calendar(identifier: .japanese)
        let timeValue = calendar
            .dateComponents([.day, .hour, .minute, .second], from: nowDate, to: setDate)
        return String(format: "残り"+"%02d日:%02d時間:%02d分:%02d秒",
                      timeValue.day!,
                      timeValue.hour!,
                      timeValue.minute!,
                      timeValue.second!)
    }
    
}
