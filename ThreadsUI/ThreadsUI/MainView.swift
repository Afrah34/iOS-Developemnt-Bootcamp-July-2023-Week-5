//
//  MainView.swift
//  ThreadsUI
//
//  Created by Afrah Faisal on 04/02/1445 AH.
//

import SwiftUI

struct MainView: View {
    enum Screen: String, CaseIterable{
        case homeView
        case searchView
        case newPostView
        case activityView
        case profileView
        
        var title : String{
            switch self{
            case.homeView : return "Home"
            case.searchView : return "Search"
            case.newPostView : return "NewPost"
            case.activityView : return "Activity"
            case.profileView : return "Profile"
            }
        };
        var body: AnyView {
            switch self{
            case.homeView : return AnyView(HomeView())
            case.searchView : return AnyView(SearchView())
            case.newPostView : return AnyView(NewPostView())
            case.activityView : return AnyView(ActivityView())
            case.profileView : return AnyView(ProfileView( 
                                                ))
            }
        };
        var userImage : String{
            switch self{
            case.homeView : return "house"
            case.searchView : return "magnifyingglass"
            case.newPostView : return "plus"
            case.activityView : return "heart"
            case.profileView : return "person"
            }
        }
        
    }
   @State var currenttitle : String = "Home"
    var body: some View {

            TabView{
                ForEach(Screen.allCases, id: \.self) { screen in
                        screen.body
                            .tabItem {
                                Label(
                                    screen.title,
                                    systemImage: screen.userImage
                                            )
                                        }
                        .onAppear {
                            currenttitle = screen.title
                                        }
                                }
               
                }
            .navigationTitle(currenttitle)
            .navigationBarBackButtonHidden(true)
            }

    }

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
