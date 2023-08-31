//
//  ViewController.swift
//  ArithGame
//
//  Created by CHEBIHI FAYCAL on 30/8/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nbr2Label: UILabel!
    @IBOutlet weak var nbr1Label: UILabel!
    
    @IBOutlet weak var resp3Button: UIButton!
    @IBOutlet weak var resp2Button: UIButton!
    @IBOutlet weak var resp1Button: UIButton!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    var score : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startGame()
    }

    @IBAction func resp1Click(_ sender: Any) {
        startGame()
        let value = Int(resp1Button.currentTitle!)
        let nbr1 = Int(nbr1Label.text!)
        let nbr2 = Int(nbr2Label.text!)
        if value == nbr1! + nbr2! {
            score+=1
        }
        else {
            score-=1
        }
    }
    
    @IBAction func resp2Click(_ sender: Any) {
        startGame()
    }
    
    @IBAction func resp3Click(_ sender: Any) {
        startGame()
    }
    
    func startGame(){
        
        let n1 = Int.random(in: 1..<201)
        let n2 = Int.random(in: 1..<201)
        
        let resp = n1 + n2
        
        nbr1Label.text = String(n1)
        nbr2Label.text = String(n2)
        
        let resp1 = Int.random(in: 2..<401)
        let resp2 = Int.random(in: 2..<401)
        let resp3 = Int.random(in: 2..<401)
        
        let i = Int.random(in: 1..<4)
        
        if i == 1 {
            resp1Button.setTitle(String(resp), for: .normal)
            resp2Button.setTitle(String(resp2), for: .normal)
            resp3Button.setTitle(String(resp3), for: .normal)
        }else if i == 2
        {
            resp1Button.setTitle(String(resp1), for: .normal)
            resp2Button.setTitle(String(resp), for: .normal)
            resp3Button.setTitle(String(resp3), for: .normal)
        }else {
            resp1Button.setTitle(String(resp1), for: .normal)
            resp2Button.setTitle(String(resp2), for: .normal)
            resp3Button.setTitle(String(resp), for: .normal)
        }
        
        
    }
}

