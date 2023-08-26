//
//  ActivityView.swift
//  ThreadsUI
//
//  Created by Afrah Faisal on 04/02/1445 AH.
//

import SwiftUI

struct ActivityView: View {
    enum ActivityCategory : String, CaseIterable{
        case all
        case replies
        case mentioned
        case verified
        
        var title : String{
            switch self{
            case.all : return "All"
            case.replies : return "Replies"
            case.mentioned: return "Mentioned"
            case.verified : return "Verified"
           
            }
        }
    }
    @State var currentSelectedCategory : ActivityCategory = .all
    var body: some View {
        VStack{
            ScrollView(.horizontal , showsIndicators: false){
                HStack{
                    ForEach(ActivityCategory.allCases, id: \.self){
                        category in
                        Button(action: {
                            currentSelectedCategory = category
                                            },
                               label: {
                            if currentSelectedCategory == category{
                                Text(category.title)
                                    .frame(width: 84)
                                    .padding(.horizontal,16)
                                    .padding(.vertical,8)
                                    .foregroundColor(.white)
                                    .background(RoundedRectangle(cornerRadius: 12)
                                        .fill(.black)
                                    )
                            } else {
                                Text(category.title)
                                    .frame(width: 84)
                                    .padding(.horizontal,16)
                                    .padding(.vertical,8)
                                    .background(RoundedRectangle(cornerRadius: 12)
                                        .stroke(.gray.opacity(0.25))
                                    )
                            }
                          
                                }
                        )
                        .buttonStyle(.plain)
                    }
                }
                .padding(.horizontal)
            }
            
            ScrollView{
                ForEach(0..<10 , id: \.self){_ in 
                    ActivetyComponentView()
                    Divider()
                }
            }
            .padding(.top)
        }
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView()
    }
}
