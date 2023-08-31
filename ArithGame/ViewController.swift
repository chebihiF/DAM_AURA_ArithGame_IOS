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
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var score : Int = 0
    var gameRuning : Bool = false
    
    var timer = Timer()
    var isTimerRunning = false
    var limit = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func startClick(_ sender: Any) {
        if !gameRuning {
            scoreLabel.text = "Score : 0"
            scoreLabel.textColor = UIColor.label
            startGame()
            runTimer()
            gameRuning = true
        }
        
    }
    
    @IBAction func cancelClick(_ sender: Any) {
        timer.invalidate()
        limit = 5
        score = 0
        resp1Button.setTitle("0", for: .normal)
        resp2Button.setTitle("0", for: .normal)
        resp3Button.setTitle("0", for: .normal)
        nbr1Label.text = "0"
        nbr2Label.text = "0"
        timerLabel.text = "5"
        gameRuning = false
    }
    
    @IBAction func resp1Click(_ sender: Any) {
        onClickResponse(btn: resp1Button)
        startGame()
    }
    
    @IBAction func resp2Click(_ sender: Any) {
        onClickResponse(btn: resp2Button)
        startGame()
    }
    
    @IBAction func resp3Click(_ sender: Any) {
        onClickResponse(btn: resp3Button)
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
    
    func onClickResponse(btn: UIButton){
        
        let value = Int(btn.currentTitle!)
        let nbr1 = Int(nbr1Label.text!)
        let nbr2 = Int(nbr2Label.text!)
        if value == nbr1! + nbr2! {
            score+=1
        }
        else {
            score-=1
        }
        scoreLabel.text = "Score : \(score)"
        
        if score > 0 {
            scoreLabel.textColor = UIColor(red: 0.0863, green: 0.5176, blue: 0, alpha: 1)
        }else if score < 0 {
            scoreLabel.textColor = UIColor.red
        }else{
            scoreLabel.textColor = UIColor.label
        }
        limit = 5
        timerLabel.text = String(limit)
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc
    func updateTimer(){
        limit -= 1
        timerLabel.text = String(limit)
        if(limit == 0){
           // timer.invalidate()
            score -= 1
            scoreLabel.text = "Score : \(score)"
            
            if score > 0 {
                scoreLabel.textColor = UIColor(red: 0.0863, green: 0.5176, blue: 0, alpha: 1)
            }else if score < 0 {
                scoreLabel.textColor = UIColor.red
            }else{
                scoreLabel.textColor = UIColor.label
            }
            limit = 5
            startGame()
        }
    }
}

