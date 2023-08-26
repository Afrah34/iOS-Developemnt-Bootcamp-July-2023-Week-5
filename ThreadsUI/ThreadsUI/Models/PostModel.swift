//
//  PostModel.swift
//  ThreadsUI
//
//  Created by Afrah Faisal on 04/02/1445 AH.
//

import Foundation
import SwiftUI

struct PostModel : Codable, Identifiable {
    typealias ID = UUID
    let id : ID = .init()
    let createdby : UserModel.ID
    let content : Optional<String>
    let attachment : Array<URL>
    var likes : Array<UserModel.ID>
    var replay : Array<PostModel.ID>
    let date : Date
}
