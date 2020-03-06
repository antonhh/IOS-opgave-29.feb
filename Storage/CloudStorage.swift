//
//  CloudStorage.swift
//  FireBaseHelloWorld
//
//  Created by Anton Haastrup on 05/03/2020.
//  Copyright © 2020 Anton Haastrup. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseStorage

class CloudStorage {

    static var list = [Note]()
    private static let db = Firestore.firestore()
    private static let notes = "notes"
    private static let storage = Storage.storage()
    
    static func downloadImage(name: String, vc:ViewController){
        
        let imgRef = storage.reference(withPath: name) //get file handler
        imgRef.getData(maxSize: 4000000){ (data, error) in
            if error == nil{
                print ("succes! Downloading image !")
                
                //Billede på VC
                let img = UIImage.init(data: data!)
                DispatchQueue.main.async {
                    //prevent background thread from interrupting main thread which handles user input
                    vc.imageView.image = img
                }
            }
                else {
                    print("error")
                }
            
            
            }
        
        
    }
    
    
    
    static func startListener(tableView: UITableView){
        
        print("starting listener")
        db.collection(notes).addSnapshotListener() { (snap, error) in
            if error == nil{
                self.list.removeAll() // CLears the list
                for note in snap!.documents {
                    let map = note.data()
                    let head = map["head"] as! String
                    let body = map["body"] as! String
                    let image = map["image"] as? String ?? "empty"
                   
                    let newNote = Note(id: note.documentID, head: head, body: body, image : image)
                    self.list.append(newNote)
                }
                DispatchQueue.main.async {
                    tableView.reloadData()
                }
            }
            
            
        }
    }
    
    static func getSize() -> Int{
        return list.count
    }
    
    static func deleteNote(id:String){
        let docRef = db.collection(notes).document(id)
        docRef.delete()
        
        }
    
    static func updateNote(index:Int, head:String, body:String){
        let note = list[index]
        let docRef = db.collection(notes).document(note.id)
        var map = [String:String]()
        map["head"] = head
        map["body"] = body
        docRef.setData(map)
    }
    
    static func newNote(head:String, body:String){
        let ref = db.collection(notes).document()
        var map = [String:String]()
        map["head"] = head
        map["body"] = body
        ref.setData(map)
        
        
    }
    
 
    }
    
     
    

    
    
    

