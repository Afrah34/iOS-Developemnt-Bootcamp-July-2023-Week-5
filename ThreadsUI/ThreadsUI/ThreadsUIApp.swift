//
//  ThreadsUIApp.swift
//  ThreadsUI
//
//  Created by Afrah Faisal on 04/02/1445 AH.
//

import SwiftUI

@main
struct ThreadsUIApp: App {
    @ObservedObject var  userpreferences = UserPreferencesViewModel()
    @ObservedObject var auth = AuthViewModel()
    @ObservedObject var userdata = UserDataViewModel()
    init(){
        auth.reset()
    }
    var body: some Scene {
        WindowGroup {
            NavigationView{
                RootView()
                    .environmentObject(userpreferences).environmentObject(auth).environmentObject(userdata)
        }
        }
    }
}
