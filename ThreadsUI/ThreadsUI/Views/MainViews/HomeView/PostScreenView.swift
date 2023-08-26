//
//  PostScreenView.swift
//  ThreadsUI
//
//  Created by Afrah Faisal on 07/02/1445 AH.
//

import SwiftUI

struct PostScreenView: View {
    let user : UserModel
    let post : PostModel
  
    @EnvironmentObject var userdata : UserDataViewModel
    
    var body: some View {
        ScrollView(showsIndicators: false){
           PostComponentView(user: user, posts: post)
            Divider()
            ForEach(post.replay , id: \.self){ postid in
                if let post = userdata.fetchPostbyid(postid){
                    if let user = userdata.fetchUserbyid(post.createdby){
                        PostComponentView( user: user, posts:post )
                    }
                    
//                    Divider()
                }
            }
            
        }
        .navigationBarTitleDisplayMode(.inline)
        
    }
   
}

//
//struct PostScreenView_Previews: PreviewProvider {
//    static var previews: some View {
//        PostScreenView()
//    }
//}
