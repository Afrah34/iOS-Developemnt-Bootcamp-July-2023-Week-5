//
//  ProfileComponentView.swift
//  ThreadsUI
//
//  Created by Afrah Faisal on 07/02/1445 AH.
//

import SwiftUI

struct ProfileComponentView: View {
    var body: some View {
        NavigationStack{
            VStack{
                HStack{
                    Image(systemName: "lock")
                    Image(systemName: "house")
                    Image(systemName: "line.3.horizontal")
                }
//                Spacer()
                HStack{
                    VStack{
                        Text("dd")
                        Text("dd")
                        Text("0 followers")
                    }
                    .padding(.leading)
                    Image(systemName: "person.circle")
                }
                .padding()
                HStack{
                    Button(action: {
                        
                    }, label: {
                        Text("Edit profile")
                    })
                    Button(action: {
                        
                    }, label: {
                        Text("Share profile")
                    })
                } .padding(12)
                HStack{
                    Text("Threads")
                    Text("Replies")
                    Text("Reposts")
                }
               
            }
        }
    }
}
struct ProfileComponentView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileComponentView()
    }
}
