//
//  ViewController.swift
//  QuickMath
//
//  Created by Machintosh on 7/21/19.
//  Copyright © 2019 Machintosh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var timer: Timer = Timer()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.controlTime), userInfo: nil, repeats: true)
        generateOperator()
        
    }

    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var problemLabel: UILabel!
    @IBOutlet weak var userAnswerLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var sept: UIButton!
    @IBOutlet weak var huit: UIButton!
    @IBOutlet weak var neuf: UIButton!
    @IBOutlet weak var quatre: UIButton!
    @IBOutlet weak var cinq: UIButton!
    @IBOutlet weak var six: UIButton!
    @IBOutlet weak var un: UIButton!
    @IBOutlet weak var deux: UIButton!
    @IBOutlet weak var trois: UIButton!
    @IBOutlet weak var clearButtonObj: UIButton!
    @IBOutlet weak var zeroButtonObj: UIButton!
    @IBOutlet weak var negativeButtonObj: UIButton!
    @IBOutlet weak var submitButtonObj: UIButton!
    
    
    var one: Int = 0
    var two: Int = 0
    var time: Int = 60
    var answer: Int = 0
    var numRight: Int = 0
    var gameIsOver: Bool = false
    
    
    
    @objc func fire()
    {
        if (time <= 0)
        {
            initiateGameOver()
        }
        else
        {
            time = time - 1
            timerLabel.text = String(time)
        }
    }
    func generateOperator()
    {
        let oNum = Int.random(in: 1...4)
        
        generateNumbers(oNum: oNum)
    }
    
    func generateNumbers(oNum: Int)
    {
        one = Int.random(in: 0...9)
        two = Int.random(in: 0...9)
        if (oNum == 1)
        {
            setNumbers(o: one, t: two, s:"+")
            answer = one + two
        }
        else if (oNum == 2)
        {
            setNumbers(o: one, t: two, s:"-")
            answer = one - two
        }
        
        else if (oNum == 3)
        {
            setNumbers(o: one, t: two, s:"x")
            answer = one * two
        }
        
        else
        {
            two = Int.random(in: 1...9)
            one = two * Int.random(in: 0...10)
            setNumbers(o: one, t: two, s:"/")
            answer = one / two
        }
    }
    
    func setNumbers(o: Int, t: Int, s: String)
    {
        problemLabel.text = String(o) + " " + s + " " + String(t)
    }
    
    func checkGameOver() -> Bool
    {
        let userAnswer:Int? = Int(userAnswerLabel.text!)
        if (userAnswer == answer)
        {
            numRight = numRight + 1
        }
        else
        {
            gameIsOver = true
        }
        return gameIsOver
    }
    
    func initiateGameOver()
    {
        timer.invalidate()
        un.isEnabled = false
        un.isHidden = true
        deux.isEnabled = false
        deux.isHidden = true
        trois.isEnabled = false
        trois.isHidden = true
        quatre.isEnabled = false
        quatre.isHidden = true
        cinq.isEnabled = false
        cinq.isHidden = true
        six.isEnabled = false
        six.isHidden = true
        sept.isEnabled = false
        sept.isHidden = true
        huit.isEnabled = false
        huit.isHidden = true
        neuf.isEnabled = false
        neuf.isHidden = true
        clearButtonObj.isEnabled = false
        clearButtonObj.isHidden = true
        zeroButtonObj.isEnabled = false
        zeroButtonObj.isHidden = true
        negativeButtonObj.isEnabled = false
        negativeButtonObj.isHidden = true
        submitButtonObj.setTitle("Play Again", for: .normal)
        submitButtonObj.setTitleColor(UIColor(red: 255/255, green: 99/255, blue:71/255, alpha: 1.0), for: .normal)
        problemLabel.text = "Game Over"
        self.view.backgroundColor = UIColor(red: 255/255, green: 99/255, blue:71/255, alpha: 1.0)
        userAnswerLabel.text = "You got " + String(numRight) + " right"
    }
    
    func initiateGameStart()
    {
        
        un.isEnabled = true
        un.isHidden = false
        deux.isEnabled = true
        deux.isHidden = false
        trois.isEnabled = true
        trois.isHidden = false
        quatre.isEnabled = true
        quatre.isHidden = false
        cinq.isEnabled = true
        cinq.isHidden = false
        six.isEnabled = true
        six.isHidden = false
        sept.isEnabled = true
        sept.isHidden = false
        huit.isEnabled = true
        huit.isHidden = false
        neuf.isEnabled = true
        neuf.isHidden = false
        clearButtonObj.isEnabled = true
        clearButtonObj.isHidden = false
        zeroButtonObj.isEnabled = true
        zeroButtonObj.isHidden = false
        negativeButtonObj.isEnabled = true
        negativeButtonObj.isHidden = false
        submitButtonObj.setTitle("Submit", for: .normal)
        submitButtonObj.setTitleColor(UIColor(red: 76/255, green: 217/255, blue:100/255, alpha: 1.0), for: .normal)
        problemLabel.text = ""
        self.view.backgroundColor = UIColor(red: 76/255, green: 217/255, blue:100/255, alpha: 1.0)
        userAnswerLabel.text = ""
        numRight = 0
        gameIsOver = false
        time = 60
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.controlTime), userInfo: nil, repeats: true)
        generateOperator()
    }
    
    @objc func controlTime()
    {
        time -= 1
        timerLabel.text = String(time)
        
        if (time == 0)
        {
            timer.invalidate()
            initiateGameOver()
        }
    }
    
    @IBAction func buttonSeven(_ sender: Any) {
        userAnswerLabel.text = userAnswerLabel.text! + String(7)
    }
    @IBAction func buttonEight(_ sender: Any) {
        userAnswerLabel.text = userAnswerLabel.text! + String(8)
    }
    @IBAction func buttonNine(_ sender: Any) {
        userAnswerLabel.text = userAnswerLabel.text! + String(9)
    }
    @IBAction func buttonFour(_ sender: Any) {
        userAnswerLabel.text = userAnswerLabel.text! + String(4)
    }
    @IBAction func buttonFive(_ sender: Any) {
        userAnswerLabel.text = userAnswerLabel.text! + String(5)
    }
    @IBAction func buttonSix(_ sender: Any) {
        userAnswerLabel.text = userAnswerLabel.text! + String(6)
    }
    @IBAction func buttonOne(_ sender: Any) {
        userAnswerLabel.text = userAnswerLabel.text! + String(1)
    }
    @IBAction func buttonTwo(_ sender: Any) {
        userAnswerLabel.text = userAnswerLabel.text! + String(2)
    }
    @IBAction func buttonThree(_ sender: Any) {
        userAnswerLabel.text = userAnswerLabel.text! + String(3)
    }
    @IBAction func buttonClear(_ sender: Any) {
        userAnswerLabel.text = ""
    }
    @IBAction func buttonZero(_ sender: Any) {
        userAnswerLabel.text = userAnswerLabel.text! + String(0) 
    }
    @IBAction func buttonNegative(_ sender: Any) {
        userAnswerLabel.text = "-"
    }
    @IBAction func buttonSubmit(_ sender: Any) {
        
        
        if(gameIsOver)
        {
         initiateGameStart()
        }
        else if(checkGameOver())
        {
            initiateGameOver()
        }
        else
        {
            buttonClear(self)
            generateOperator()
        }
        
    }
}

