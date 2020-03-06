//
//  ViewControllerAddNote.swift
//  FireBaseHelloWorld
//
//  Created by Anton Haastrup on 06/03/2020.
//  Copyright © 2020 Anton Haastrup. All rights reserved.
//

import UIKit

class ViewControllerAddNote: UIViewController {

    @IBOutlet weak var headAdd: UITextField!
    @IBOutlet weak var bodyAdd: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func addNote(_ sender: Any) {
        CloudStorage.newNote(head: headAdd.text!, body: bodyAdd.text!)
        headAdd.text = ""
        bodyAdd.text = ""
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
