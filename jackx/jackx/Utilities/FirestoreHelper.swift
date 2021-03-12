//
//  FirestoreHelper.swift
//  jackx
//
//  Created by Mark Kyaw on 3/11/21.
//

import Foundation
import Firebase

class FirestoreHelper {
    
//    Singleton, no one else can initialize this class
    private init() {}
//    Can only acces functions in here through shared
    static let shared = FirestoreHelper()
//    Create reference to db
    private let db = Firestore.firestore()
    
/*
     Writing
     Function returns void immediatly but later returns optional error in completion block. Tells runtime don't kill immediately but there may be more work afterwards and have something to return
*/
    func onUserSignIn(completion: @escaping (Error?) -> Void) {
//        Synchronous, user isn't logged in if it returns nil
//        guard -> return immediately if it's nil also comes with nil unwrapping
        guard let user = Auth.auth().currentUser else { return }
        
//        Creates a user collectoin if it doesn't exist, create document id with userid, set data of current document
//        Closure only calls after db collection finishes. Problem: how to pass it back to the caller (sending error msg from backend to frontend). Need to do completion in function call
        db.collection("users").document(user.uid).setData(["email": user.email ?? "", "name": user.displayName ?? ""]) { (error) in
            completion(error)
        }
    }
    
//    Reading
//    [String: Any] is dictionary
    func getUserDetails(completion: @escaping ([String: Any]?, Error?) -> Void) {
        guard let user = Auth.auth().currentUser else { return }
        db.collection("users").document(user.uid).getDocument { (snapshot, error) in
            completion(snapshot?.data(), error)
        }
    }
}
