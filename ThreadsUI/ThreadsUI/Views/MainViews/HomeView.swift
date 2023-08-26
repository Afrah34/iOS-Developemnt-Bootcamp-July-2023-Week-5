//
//  HomeView.swift
//  ThreadsUI
//
//  Created by Afrah Faisal on 04/02/1445 AH.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var userdata : UserDataViewModel
  
    var body: some View {
     
        ScrollView(showsIndicators: false){
            ForEach(userdata.posts){ post in
                if let user = userdata.fetchUserbyid(post.createdby){
                    NavigationLink(destination: {
                        PostScreenView(user: user, post: post)
                    }, label: {
                        PostComponentView(user: user, posts: post)
                    })
                    .buttonStyle(.plain)
                    Divider()
                }
            }
        }
    }
}
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
