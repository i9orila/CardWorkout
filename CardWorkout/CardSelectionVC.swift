//
//  CardSelectionVC.swift
//  CardWorkout
//
//  Created by I9orila on 18.01.2023.
//

import UIKit

class CardSelectionVC: UIViewController {
    
    @IBOutlet var cardImageView: UIImageView!
    
    var cards: [UIImage] = Card.allValues
    var timer: Timer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startTimer()
            }
    
    override func viewWillDisappear(_ animated: Bool) {
        viewWillDisappear(animated)
        timer.invalidate()
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.15, target: self, selector: #selector(showRandomImage) , userInfo: nil, repeats: true)
    }
    @objc func showRandomImage() {
        cardImageView.image = cards.randomElement() ?? UIImage(named: "AS")
        print("Timer fired off")
    }
    
    
    
    @IBAction func stopButtonTapped(_ sender: UIButton) {
        timer.invalidate()
    }
    
    
    @IBAction func restartButtonTapped(_ sender: UIButton) {
        timer.invalidate()
        startTimer()
    }
}
