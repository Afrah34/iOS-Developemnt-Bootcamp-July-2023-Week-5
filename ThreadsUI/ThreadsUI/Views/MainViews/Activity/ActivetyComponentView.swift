//
//  ActivetyComponentView.swift
//  ThreadsUI
//
//  Created by Afrah Faisal on 07/02/1445 AH.
//
//import Foundation
import SwiftUI

struct ActivetyComponentView: View {
    
    var body: some View {

                VStack{
                    HStack(alignment: .top){
                        AsyncImage(url: URL(string:"https://source.unsplash.com/200x200/?[user]")!){
                            result in
                            if let image = result.image {
                                image
                                    .resizable()
                                    .scaledToFill()
                            } else {
                                ProgressView()
                            }
                        }
                  
                            .frame(width:  50 , height: 50)
                            .clipShape(Circle())
//                            .padding(.leading)
                        VStack(alignment: .leading){
                            HStack{
                                Text("username")
                                    .fontWeight(.medium)
                                Text("12s")
                                    .foregroundColor(.gray)
                            }
                            Text("Follow")
                                .foregroundColor(.gray)
                        }
                        .frame(maxWidth: .infinity , alignment : .leading)
                     Spacer()
                        Button(action: {
                            
                        }, label: {
                            Text("Follow")
                                .padding(.horizontal,16)
                                .padding(.vertical,8)
                                .background(RoundedRectangle(cornerRadius: 12)
                                    .stroke(.gray.opacity(0.25))
                                )
                        })
                        .buttonStyle(.plain)
                    }
                    .padding(.horizontal)
                }
            }
        }


struct ActivetyComponentView_Previews: PreviewProvider {
    static var previews: some View {
        ActivetyComponentView()
    }
}
