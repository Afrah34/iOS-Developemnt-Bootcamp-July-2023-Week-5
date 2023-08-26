//
//  ProfileView.swift
//  ThreadsUI
//
//  Created by Afrah Faisal on 04/02/1445 AH.
//

import SwiftUI
//import  Foundation
struct ProfileView: View {
    @EnvironmentObject var auth : AuthViewModel
    @EnvironmentObject var userdata : UserDataViewModel
    
    @State var currentUser :Optional <UserModel> = nil
    @State var currentUserPosts : Array<PostModel> = []
    
    var body: some View {
       
        VStack(alignment: .leading){
            if let currentUser = currentUser{
                VStack(alignment: .leading){
                    HStack{
                        Spacer()
                        Button(action: {
                            auth.signOut()
                        }, label: {
                           Text("LogOut")
                        })
                       
                    }
                    HStack{
                        VStack(alignment: .leading){
                            if let fullname = currentUser.fullname{
                                Text(fullname)
                                    .font(.title)
                            }
                            Text(currentUser.username)
                        }
                        .frame(maxWidth: .infinity , alignment: .leading)
                        AsyncImage(url: currentUser.image){ result in
                            if let image = result.image{
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .clipShape(Circle())
                            } else{
                                ProgressView()
                            }
                        }
                        .clipShape(Circle())
                        .frame(width:  75 , height: 75)
                    }
                    if let bio = currentUser.bio{
                        Text(bio)
                    }
            Text("\(currentUser.followers.count) followers")
                    
                    HStack{
                        Button(action: {
                            
                        }, label: {
                            Text("Edit profile")
                                .frame(maxWidth: .infinity )
                                .padding(.horizontal,16)
                                .padding(.vertical , 8)
                                .background(.black)
                                .foregroundColor(.white)
                                .cornerRadius(6.25)
                        })
                        
                        Button(action: {
                            
                        }, label: {
                            Text("Share profile")
                                .frame(maxWidth: .infinity )
                                .padding(.horizontal,16)
                                .padding(.vertical , 4)
                                .background(RoundedRectangle(cornerRadius: 6.25)
                                    .stroke(.gray.opacity(0.25))
                                )
                        }
                        )
                        .buttonStyle(.plain)
                        disabled(true)
                    }
                }
                .padding(.horizontal)
            } else{
                VStack(alignment: .leading){
                    HStack{
                        Spacer()
                        Button(action: {
                            auth.signOut()
                        },
                               label: {
                            Text("LogOut")
                        })
                    }
                    
                    HStack{
                        VStack(alignment: .leading){
                            Text(String(repeating: "*" , count: 16))
                                .font(.title)
                            Text(String(repeating: "*" , count: 24))
                        }
                        .frame(maxWidth: .infinity , alignment: .leading)
                        Circle()
                        .frame(width:  75 , height: 75)
                    }
                    
                    Text(String(repeating: "*" , count: 128))
                        .padding(.horizontal)
                    Text("0 followers")
                    
                    HStack{
                        Button(action: {
                            
                        }, label: {
                            Text("Edit profile")
                                .frame(maxWidth: .infinity )
                                .padding(.horizontal,16)
                                .padding(.vertical , 8)
                                .background(.black)
                                .foregroundColor(.white)
                                .cornerRadius(6.25)
                        })

                        Button(action: {
                            
                        }, label: {
                            Text("Share profile")
                                .frame(maxWidth: .infinity )
                                .padding(.horizontal,16)
                                .padding(.vertical , 4)
                                .background(RoundedRectangle(cornerRadius: 6.25)
                                    .stroke(.gray.opacity(0.25))
                                )
                        }
                        )
                        .buttonStyle(.plain)
                        .disabled(true)
                    }
                }
                .padding(.horizontal)
            }
            
            ScrollView(showsIndicators: false){
                ForEach(currentUserPosts){ post in
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
    .onAppear(){
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500) ){
            if let uuid = UUID(uuidString: auth.token){
                if let user = userdata.fetchUserbyid(uuid){
                    self.currentUser = user
                }
                self.currentUserPosts =  userdata.posts.filter{post in
                    return  post.createdby == uuid
                }
            }
        }
        }
    }
}
//
//struct ProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileView()
//    }
//}
