//
//  OnboardingView.swift
//  ThreadsUI
//
//  Created by Afrah Faisal on 04/02/1445 AH.
//

import SwiftUI

struct OnboardingView: View {
    enum presented {
            case authentication
            case mainView
        }
        @State var R : presented = .authentication
        @ObservedObject var auth = AuthViewModel()
        @ObservedObject var userdata = UserDataViewModel()
    var body: some View {
        switch R {
                case .mainView:
                    MainView()
                case .authentication:
        VStack{
                Image("tee")
                    .resizable()
                    .scaledToFit()
         
                    Button {
                        let x = auth.signIn(userdata.users.randomElement()!.id)
                        R = x ? .mainView : .authentication
                    } label: {
                        
                        Text("Log in with Instagram")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(.bar)
                            .cornerRadius(12)
                            .padding()
                            .foregroundColor(.black)
                            .bold()
                        
                  
                    }
                }
        .onAppear(){
            if auth.token.isEmpty == false{
                R = .mainView
            }
        }
            }

    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
