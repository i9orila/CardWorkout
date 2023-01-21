//
//  CardSelectionVC.swift
//  CardWorkout
//
//  Created by I9orila on 19.01.2023.
//

import UIKit


class CardSelectionVC: UIViewController {
    
    let cardImagwView = UIImageView()
    let stopButton    = CWButton(backgroundColor: .systemRed, title: "Stop!")
    let resetButton   = CWButton(backgroundColor: .systemGreen, title: "Reset")
    let rulesButton   = CWButton(backgroundColor: .systemBlue, title: "Rules")
    var cards         = CardDeck.allValues
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        startTimer()
        configureUI()
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(showRandomCard), userInfo: nil, repeats: true)
    }
    
    @objc  func showRandomCard() {
        cardImagwView.image = cards.randomElement()
    }
    
    @objc func stopTimer() {
        timer.invalidate()
    }
    
    @objc func resetTimer() {
        timer.invalidate()
        startTimer()
    }
    
    
    func configureUI() {
        configureCardImageView()
        configureStopButton()
        configureResetButton()
        configureRulesButton()
    }
    
    
    func configureCardImageView() {
        view.addSubview(cardImagwView)
        cardImagwView.translatesAutoresizingMaskIntoConstraints = false
        cardImagwView.image = UIImage(named: "AS")
        
        NSLayoutConstraint.activate([
            cardImagwView.widthAnchor.constraint(equalToConstant: 320),
            cardImagwView.heightAnchor.constraint(equalToConstant: 420),
            cardImagwView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardImagwView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -75)
        ])
        
    }
    
    func configureStopButton() {
        view.addSubview(stopButton)
        stopButton.addTarget(self, action: #selector(stopTimer), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            stopButton.widthAnchor.constraint(equalToConstant: 300),
            stopButton.heightAnchor.constraint(equalToConstant: 50),
            stopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stopButton.topAnchor.constraint(equalTo: cardImagwView.bottomAnchor, constant: 30)
        ])
    }
    
    func configureResetButton() {
        view.addSubview(resetButton)
        resetButton.addTarget(self, action: #selector(resetTimer), for: .touchUpInside)
        
        
        NSLayoutConstraint.activate([
            resetButton.widthAnchor.constraint(equalToConstant: 140),
            resetButton.heightAnchor.constraint(equalToConstant: 50),
            resetButton.leadingAnchor.constraint(equalTo: stopButton.leadingAnchor),
            resetButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 20)
        ])
    }
    
    func configureRulesButton() {
        view.addSubview(rulesButton)
        rulesButton.addTarget(self, action: #selector(presentRulesVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            rulesButton.widthAnchor.constraint(equalToConstant: 140),
            rulesButton.heightAnchor.constraint(equalToConstant: 50),
            rulesButton.trailingAnchor.constraint(equalTo: stopButton.trailingAnchor),
            rulesButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 20)
        ])
    }
    @objc func presentRulesVC() {
        present(RulesVC(), animated: true)
    }
}
