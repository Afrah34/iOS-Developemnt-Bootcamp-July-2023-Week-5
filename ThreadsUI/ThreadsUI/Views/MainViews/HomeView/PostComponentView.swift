//
//  PostComponentView.swift
//  ThreadsUI
//
//  Created by Afrah Faisal on 04/02/1445 AH.
//
import Foundation
import SwiftUI

struct PostComponentView: View {
    @EnvironmentObject var auth : AuthViewModel
    let user : UserModel
    let posts : PostModel
    var body: some View {
        ScrollView{
            HStack{
                VStack{
                    AsyncImage(url: user.image){ result in
                        if let image = result.image{
                            image.resizable()
                                .scaledToFill()
                                .clipShape(Circle())
                        } else{
                            ProgressView()
                        }
                    }
                    .frame(width:  60 , height: 60)
                    Spacer()
                    
                }
                .padding(4)
                VStack(alignment: .leading){
                    HStack{
                        Text(user.username)
                            .font(.footnote)
                            .fontWeight(.semibold)
                        Spacer()
                        Text(posts.date.description)
                            .foregroundColor(.gray)
                        Image(systemName: "ellipsis")
                    }
                    //                            .padding(1)
                    if let content = posts.content{
                        Text(content)
                    }
                    if posts.attachment.count>0{
                        
                    }
                    
                    //                        .padding(.leading)
                    ScrollView(.horizontal){
                        HStack{
                            ForEach(posts.attachment , id: \.self){ i in
                                AsyncImage(url: i){
                                    result in
                                    if let image = result.image{
                                        image.resizable()
                                            .scaledToFill()
                                            .cornerRadius(16)
                                    }else{
                                        
                                    }
                                }  .frame(width:  300 , height: 200)
                            }
                        }
                    }
                    
                    HStack{
                        //                        if posts.likes.contains(UUID(uuidString: auth.token)!){
                        //                            Image(systemName: "heart.fill")
                        //                        }else{
                        Image(systemName: "heart")
                        
                        
                        Image(systemName: "message")
                        Image(systemName: "arrow.triangle.2.circlepath")
                        Image(systemName: "paperplane")
                    }
                    //                        .padding()
                    HStack{
                        Text("\(posts.replay.count)replies. \(posts.likes.count)likes")
                            .foregroundColor(.gray)
                    }
                }
            }
        }
        //            Divider()
    }
}


//struct PostComponentView_Previews: PreviewProvider {
//    static var previews: some View {
//        PostComponentView(post: PostModel)
//
//    }
//}
