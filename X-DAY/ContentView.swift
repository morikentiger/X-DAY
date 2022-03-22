//
//  ContentView.swift
//  X-DAY
//
//  Created by 森田健太 on 2022/03/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var timerMode: TimerMode = .initial
    
    @State var selectedPickerIndex = 0
    
    let availableMinutes = Array(1...59)
    
    var body: some View {
        
        NavigationView{
            VStack{
                Text("60")
                    .font(.system(size: 80))
                    .padding(.top, 80)
                Image(systemName: timerMode == .running ? "pause.circle.fill" :"play.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .foregroundColor(.red)
                if timerMode == .paused {
                    Image(systemName: "gobackward")
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                        .padding(.top, 40)
                }
                if timerMode == .initial {
                    Picker(selection: $selectedPickerIndex, label:Text("")){
                        ForEach(0 ..< availableMinutes.count) {_ in 
                            Text("\(self.availableMinutes[0]) min")
                        }
                    }
                }
            }
            .navigationBarTitle("Timer")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
