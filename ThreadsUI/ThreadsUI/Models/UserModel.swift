//
//  UserModel.swift
//  ThreadsUI
//
//  Created by Afrah Faisal on 08/02/1445 AH.
//

import Foundation

struct UserModel : Codable, Identifiable {
    typealias ID = UUID
    let id : ID = .init()
    var username : String
    var fullname : Optional<String>
    var bio : Optional<String>
    var image : Optional<URL>
    var followers : Array<UserModel.ID>
    var following : Array<UserModel.ID>
    var posts : Array<PostModel.ID>
}
