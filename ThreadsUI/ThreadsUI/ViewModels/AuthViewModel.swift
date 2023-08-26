//
//  AuthViewModel.swift
//  ThreadsUI
//
//  Created by Afrah Faisal on 04/02/1445 AH.
//

import Foundation
import SwiftUI

class AuthViewModel: ObservableObject {
    @AppStorage ("token") var token : String = ""
    
    func signIn(_ id : UserModel.ID)->Bool {
        token = id.uuidString
        return true
    }
    
    func signOut() {
        token = ""
     
    }
    
    func reset(){
        token = ""
    }
}
