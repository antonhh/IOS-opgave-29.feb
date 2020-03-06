//
//  ViewController.swift
//  FireBaseHelloWorld
//
//  Created by Anton Haastrup on 28/02/2020.
//  Copyright © 2020 Anton Haastrup. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    
    var theText = "";
    var headline = "";
    
    var currentRowToEdit = -1;
    
    
    @IBOutlet weak var headView: UITextView!
    @IBOutlet weak var noteImage: UIImageView!
    @IBOutlet weak var bodyView: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var tableView: UITableView!
    
  
    
    
    
    override func viewDidLoad() {
        
        
           super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        
           CloudStorage.startListener(tableView: tableView)
            
        
        
       }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        
        CloudStorage.getSize()
        
        
       
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        currentRowToEdit = indexPath.row
        cell?.textLabel?.text = CloudStorage.list[indexPath.row].head
        return cell!
    }
    
    //Vælg row
   func tableView( _ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
              
              tableView.deselectRow(at: indexPath, animated: true)
              currentRowToEdit = indexPath.row
    headView.text = CloudStorage.list[currentRowToEdit].head
    bodyView.text = CloudStorage.list[currentRowToEdit].body
   
    let image = CloudStorage.list[currentRowToEdit].image
    CloudStorage.downloadImage(name: image, vc: self)
    
    }
    


    @IBAction func btnClicked(_ sender: Any) {
        CloudStorage.updateNote(index: 0, head: "new Headline", body: "new body")
    }
    @IBAction func btnAddNote(_ sender: Any) {
        CloudStorage.newNote(head: "new head", body: "new body")
        
    }
    @IBOutlet weak var NoteList: UITableView!

    @IBAction func Downloadimage(_ sender: Any) {
        //CloudStorage.downloadImage(name: images.randomElement()!, vc:self)
    }
}

