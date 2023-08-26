//
//  SearchView.swift
//  ThreadsUI
//
//  Created by Afrah Faisal on 04/02/1445 AH.
//

import SwiftUI

struct SearchView: View {
    @State var search : String = ""
    var body: some View {
        VStack{
             
                    HStack{
                        Image(systemName: "magnifyingglass")
                        TextField("Search" , text : $search)
                    }
                    .padding(6)
                    .background(RoundedRectangle(cornerRadius: 12.5)
                    .fill(.gray.opacity(0.25))
                    )
                    .padding(.horizontal)
            
                    ScrollView{
                        ForEach(0..<10, id: \.self){
                            _ in
                            PeopleToFollowComponentView()
                            Divider()
                        }
                    }
                    .padding(.top)
                }
            }
        }


struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
