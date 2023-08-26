//
//  UserDataViewModel.swift
//  ThreadsUI
//
//  Created by Afrah Faisal on 06/02/1445 AH.
//

import Foundation
import SwiftUI

class UserDataViewModel : ObservableObject{
    @Published var posts : Array<PostModel> = []
    @Published var users : Array<UserModel> = []
    
    init(){
        let maxnumberofusers = 10
        for _ in 0..<maxnumberofusers{
            let firstAndlastname = makeRandomfullname()
            let username = "\(firstAndlastname[0])\(firstAndlastname[1])".lowercased()
            let fullname = "\(firstAndlastname[0])\(firstAndlastname[1])".lowercased()
            let user = UserModel(
                username: username,
                fullname: fullname,
                bio: "Food is any substance consumed by an organism for nutritional support.",
                image:  URL(string:  "https://source.unsplash.com/200x200/?[user]")!,
                followers: [],
                following: [],
                posts: []
            )
            users.append(user)
        }
        
        let maxnumberofposts = maxnumberofusers * 5
        for _ in 0..<maxnumberofposts{
            let userid = users.randomElement()!.id
            let post = PostModel(
                createdby: userid ,
                content: makeRandomcontent(),
                attachment: makeRandomattachment(),
                likes: [],
                replay: [] ,
                date: makeRandomData()
            )
            posts.append(post)
            let index = users.firstIndex(where: {user in user.id == userid})
            
            if let index = index {
                users[index].posts.append(post.id)
            }
            
        }
        
        for _ in 0..<(maxnumberofusers * 4){
            let user1Index = users.indices.randomElement()!
            let user2Index = users.indices.randomElement()!
            if user1Index != user2Index{
                let isNotFollowing = users[user1Index].following.contains(users[user2Index].id) == false
                if isNotFollowing{
                    users[user1Index].following.append(users[user2Index].id)
                    
                    users[user2Index].followers.append(users[user1Index].id)
                }
               
            }
        }
        
        for _ in 0..<(maxnumberofposts * 4){
            let userIndex = users.indices.randomElement()!
            let postIndex = posts.indices.randomElement()!
            let isNotLiking = posts[postIndex].likes.contains(users[userIndex].id) == false
         
                if isNotLiking{
                    posts[postIndex].likes.append(users[userIndex].id)
                    
                }
               
            }

    }
    func fetchPostbyid(_ postid: PostModel.ID) -> Optional<PostModel> {
        let index = posts.firstIndex(where: {post in post.id == postid})
        if let index = index {
            return posts[index]
        } else{
            return nil
        }
    }
    
    func fetchUserbyid(_ userid: UserModel.ID)-> Optional<UserModel>{
        let index = users.firstIndex(where: {user in user.id == userid})
        if let index = index {
            return users[index]
        } else{
            return nil
        }
    }
    
}
    
//    func makeRandomposts() -> Array<PostModel>{
//        let numberofpost = Int.random(in: 0...10)
//        var _post : Array<PostModel> = []
//        for _ in 0...numberofpost{
//            let arraypost = PostModel(
//                  username: makeRandomusername(),
//                  imagename: URL(string:  "https://source.unsplash.com/200x200/?[user]")!,
//                  content: makeRandomcontent(),
//                attachment: makeRandomattachment(),
//                  likes: 0,
//                  replay: makeRandomreplies() ,
//                date: makeRandomData())
//
//            _post.append(arraypost)
//        }
//        return _post
//    }
    
    func makeRandomfullname() -> Array<String>{
        let username = """
                 Emery Haley
                 Quintin Valenzuela
                 Joaquin Myers
                 Conner Cowan
                 Asa Rodgers
                 Albert Vance
                 Derick Beck
                 Rashad Smith
                 Kale Ryan
                 Rowan Foster
                 Braylen Dudley
                 Rhys Bentley
                 Dixie Mccarthy
                 Moses Garrett
                 Marvin Rodgers
                 Leo Wade
                 Alexzander Huerta
                 Rafael Fisher
                 Autumn Garrett
                 Darren Huang
                 Haven Moreno
                 June Buckley
                 Aydin Stanley
                 Jaden Olson
                 Kaelyn Sandoval
                 Desmond Walsh
                 Janiah Gross
                 Miles Dickerson
                 Ally Hayes
                 Mary Cardenas
                 Jaslene Zavala
                 Demetrius Fowler
                 Sanaa Gilbert
                 Jaliyah Rangel
                 Damaris Rollins
                 Talia Martin
                 Kinley Salazar
                 Isaiah Nicholson
                 Kymani Lambert
                 Jewel Wolf
                 Quinton Phelps
                 Ariella Hood
                 Kade Becker
                 Jovan Donaldson
                 Tess Norman
                 Kadin Frye
                 Alberto Weeks
                 Travis Kline
                 Amirah Montgomery
                 Kailyn Newton
                 Sam Schneider
                 Kyson Osborn
                 Dominique Fisher
                 Alonso Flynn
                 Jasmine Clayton
                 Alice Miles
                 Sullivan Spears
                 Tripp Baxter
                 Jillian Carlson
                 Nathaniel Turner
                 John Peterson
                 Yael Vargas
                 Trystan Mann
                 Riley Stark
                 River Murphy
                 Kael Mahoney
                 Christopher Wong
                 Jasmin Hardy
                 Valerie Proctor
                 Alessandra Gallegos
                 Estrella Estes
                 Oscar Travis
                 Brian Serrano
                 Julio Horn
                 Katelynn Rojas
                 Luka Wilcox
                 Jeremiah Duke
                 Allisson Mccarty
                 Elliott Elliott
                 Tatum Reeves
                 Makenzie Gross
                 Emmy Guerra
                 Cruz Holland
                 Jimena Ballard
                 Drake Reeves
                 Paris Morgan
                 Adeline Huynh
                 Madelyn Gross
                 Elena Cervantes
                 Patience Goodwin
                 Orion Warren
                 Cherish Branch
                 Isabela Barnes
                 Azul Finley
                 Aaden Cain
                 Immanuel Larson
                 Daniel Goodman
                 George Washington
                 Gemma Travis
                 Neil Robbins

"""
            .components(separatedBy: "")
        return username.randomElement()!.components(separatedBy: " ")
    }


    func makeRandomcontent() -> Optional<String> {
        let shouldcontaincontent = Bool.random()
        if shouldcontaincontent{
            return "Food is any substance consumed by an organism for nutritional support. Food is usually of plant, animal, or fungal origin and contains essential nutrients such as carbohydrates, fats, proteins, vitamins, or minerals. The substance is ingested by an organism and assimilated by the organism's cells to provide energy, maintain life, or stimulate growth. Different species of animals have different feeding behaviours that satisfy the needs of their metabolisms and have evolved to fill a specific ecological niche within specific geographical contexts."
        } else{
            return ""
        }
    }

    func makeRandomattachment() -> Array<URL>{
        let numberofimage = Int.random(in: 0...5)
        var arrayofURL = Array<URL>()
        for _ in 0...numberofimage{
            arrayofURL.append(URL(string: "https://source.unsplash.com/600x400")!)
        }
        return arrayofURL
    }
    
    func makeRandomData() -> Date{
        return Date()
    }

//    func makeRandomreplies() -> Array<PostModel> {
//        let numberofpost = Int.random(in: 0...10)
//        var arrayofpost = Array<PostModel>()
//        for _ in 0...numberofpost{
//            let arraypost = PostModel(
//                username: makeRandomusername(),
//                imagename: URL(string:  "https://source.unsplash.com/200x200/?[user]")! ,content: makeRandomcontent(),
//                attachment: makeRandomattachment(),
//                likes: 0,
//                replay: [] ,
//                date:  makeRandomData())
//        }
//        return arrayofpost
//    }
//

