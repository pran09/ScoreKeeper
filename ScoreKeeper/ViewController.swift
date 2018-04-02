//
//  ViewController.swift
//  ScoreKeeper
//
//  Created by CSSE Department on 3/11/18.
//  Copyright © 2018 Praneet CSSE484. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var roundNumber = 1
    var playerScores = [0, 0, 0, 0]
    var scoreTextFields = [UITextField]()
    var scoresListTextViews = [UITextView]()
    
    @IBOutlet weak var roundLabel: UITextView!
    
    @IBAction func pressedNewGame(_ sender: Any) {
        resetGame()
    }
    @IBAction func pressedEnterRound(_ sender: Any) {
        enterScores()
    }

    @IBOutlet weak var player1ScoreTextField: UITextField!
    @IBOutlet weak var player2ScoreTextField: UITextField!
    @IBOutlet weak var player3ScoreTextField: UITextField!
    @IBOutlet weak var player4ScoreTextField: UITextField!
    
    @IBOutlet weak var player1ScoresTextView: UITextView!
    @IBOutlet weak var player2ScoresTextView: UITextView!
    @IBOutlet weak var player3ScoresTextView: UITextView!
    @IBOutlet weak var player4ScoresTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreTextFields = [player1ScoreTextField, player2ScoreTextField, player3ScoreTextField, player4ScoreTextField]
        scoresListTextViews = [player1ScoresTextView, player2ScoresTextView, player3ScoresTextView, player4ScoresTextView]
        resetGame()
    }
    
    func resetGame(){
        roundNumber = 1
        roundLabel.text = "Round \(roundNumber)"
        for i in 0..<4 {
            playerScores[i] = 0
            scoreTextFields[i].text = ""
            scoresListTextViews[i].text = ""
        }
    }
    
    func enterScores() {
        for i in 0..<4 {
            if let score = Int(scoreTextFields[i].text!) {
                playerScores[i] += score
            }
            scoresListTextViews[i].text = scoresListTextViews[i].text == "" ? "\(playerScores[i])" : "\(scoresListTextViews[i].text!)\n\(playerScores[i])"
            scoresListTextViews[i].textAlignment = .center
            scoreTextFields[i].text = ""
        }
        roundNumber += 1
        roundLabel.text = "Round \(roundNumber)"
        self.view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

