//
//  ViewController.swift
//  TextField Game
//
//  Created by Glenn Posadas on 2/12/17.
//  Copyright © 2017 PrettyITGirl. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var label_Question: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var button_Enter: UIButton!
    
    var x = 0
    var y = 0

    var upperBound = 10
    
    // MARK: - Functions
    
    func validateAnswer(text: String) -> Bool {

        return text == "\(self.x * self.y)"
    }
    
    // MARK: IBAction
    
    @IBAction func enter(_ sender: Any) {
        
        let alert = UIAlertController(title: "GOOD JOB!",
                                      message: "You may now enter the next level!",
                                      preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) {
            (action) in
            
            self.upperBound = self.upperBound * 2
            self.textField.text = ""
            self.restart(self)
        }
        
        alert.addAction(okAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func restart(_ sender: Any) {
        
        self.button_Enter.isEnabled = false
        self.button_Enter.backgroundColor = .gray
        
        self.x = Int(arc4random_uniform(UInt32(self.upperBound)))
        self.y = Int(arc4random_uniform(UInt32(self.upperBound)))
        self.label_Question.text = "\(x)×\(y)"
    }
    
    @IBAction func textFieldDidChange(_ sender: Any) {
        
        let answerIsCorrect = self.validateAnswer(text: self.textField.text!)
        
        self.button_Enter.isEnabled = answerIsCorrect
        self.button_Enter.backgroundColor = answerIsCorrect ? .orange : .gray
    }
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.restart(self)
    }
}

