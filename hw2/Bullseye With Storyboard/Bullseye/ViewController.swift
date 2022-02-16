//
//  ViewController.swift
//  Storyboard Bullseye
//
//  Created by Tony Hong on 1/13/22.
//

import UIKit
import Foundation

var randomNumber = 0
var range = 100
var level = 1


class ViewController: UIViewController {
    override func viewDidLoad() {
            super.viewDidLoad()
            randomNumber = Int(arc4random_uniform(101))
            numLabel.text = String(randomNumber)
        
            rangeLabel.text = String(range)
            currentLevel.text = String(level)
    }
    // switch that switches on and off from exact mode
    @IBOutlet weak var exactSwitch: UISwitch!
    
    // displays whether user hit bullseye
    @IBOutlet weak var resultLabel: UILabel!
    
    // displays the number user must hit to win
    @IBOutlet weak var numLabel: UILabel!
    
    // displays the current level the user is on
    @IBOutlet weak var currentLevel: UILabel!
    
    // displays high score of user
    @IBOutlet weak var highScore: UILabel!
    
    // slider user can slide to match random number given
    @IBOutlet weak var numSlider: UISlider!
    
    // IBOutlet for play again button
    @IBOutlet weak var playAgainButton: UIButton!
    
    // displays the max value of slider
    @IBOutlet weak var rangeLabel: UILabel!
    
    @IBAction func checkValue(_ sender: Any) {
        if(exactSwitch.isOn == false) {
            if((randomNumber - 3 <= Int(numSlider.value)) && (randomNumber + 3 >= Int(numSlider.value)) ) {
                resultLabel.text = "Bullseye!"
                toNextLevel()
            } else {
                    resultLabel.text = "Missed!"
            }
        } else {
            if(randomNumber == Int(numSlider.value) ) {
                resultLabel.text = "You were right on point! Bullseye!"
                toNextLevel()
            } else {
                resultLabel.text = "Missed!"
            }
        }
        resultLabel.isHidden = false //we'll come back to this
        playAgainButton.isHidden = false
    }
    
    @IBAction func playAgain(_ sender: Any) {
        numSlider.setValue(50.0, animated: false)
        randomNumber = Int(arc4random_uniform(101))
        numLabel.text = String(randomNumber)
        resultLabel.isHidden = true //must reappear next time it is checked ^
        
        playAgainButton.isHidden = true
        range = 100
        rangeLabel.text = String(range)
        numSlider.maximumValue = Float(range)
                
        level = 1
        currentLevel.text = String(level)
        
    }
    
    @IBAction func sliderValueChanged(_ sender: Any) {
        
    }
    func toNextLevel(){
    range += 50
              
      /*
       * Since range is an int we would need to type cast it into a String
       * to be able to assign it to rangeLabel.text
       */
      rangeLabel.text = String(range)
      
      /*
       * To have the correct implementation we would also need to update the max
       * value of the slider as we are increasing range
       *
       * Since range is an int we would need to type cast it into a Float
       * to be able to assign it to numSlider.maximumValue
       */
      numSlider.maximumValue = Float(range)
      
      /*
       * When the user hits a bullseye we want to increment the level the user is currently on
       *
       * We can simply increment the level variable and assign it to currentLevel.text
       * like we did for range!
       */
      level += 1
      currentLevel.text = String(level)
        
        
        if(level >= Int(highScore.text!)!){
            highScore.text = String(level)
      }
      /*
       * Similar to how we implemented the playAgain() function, we should reset
       * the slider and generate a new random number for the user.
       *
       * Unlike playAgain() however, we won't be able to use constant values and will instead
       * have to rely on range.
       *
       * We can use range and divide it by 2 to determine a new value for the slider to be set to
       * We can also use range to generate a new random number within the new range
       *
       * Note the type casting used below and how we added 1 to range when generating a new number
       * because arc4random_uniform() returns a random number in between 0 and the input - 1
       */
      numSlider.setValue(Float(range / 2), animated: false)
      randomNumber = Int(arc4random_uniform(UInt32(range + 1)))
      numLabel.text = String(randomNumber)
      // We should hide resultLabel since it's a new round!
      resultLabel.isHidden = true
    }
    

}

