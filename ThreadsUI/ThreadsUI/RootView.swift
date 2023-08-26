//
//  RootView.swift
//  ThreadsUI
//
//  Created by Afrah Faisal on 04/02/1445 AH.
//

import SwiftUI

struct RootView: View {
    let timer = Timer
        .TimerPublisher(
          interval: 2,
          runLoop: .main,
          mode: .default
        )
        .autoconnect()

    
    @State var finishedLoadingSplashScreen : Bool = false
    var body: some View {
        if finishedLoadingSplashScreen{
            OnboardingView()
        } else{
            ZStack{
                Image("0")
                    .imageScale(.medium)
                    .foregroundColor(.accentColor)
                VStack{
                    Spacer()
                    HStack{
                        Text("from Meta")
                    }
                }
                .onReceive(timer){_ in
                    timer.upstream.connect().cancel()
                      finishedLoadingSplashScreen=true
                }
            }
        }

        }
    }


struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView().environmentObject(UserPreferencesViewModel())
    }
}
