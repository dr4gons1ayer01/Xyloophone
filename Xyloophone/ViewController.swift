//
//  ViewController.swift
//  Xyloophone
//
//  Created by Иван Семенов on 12.02.2024.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    let mainView = MainView()
    var player: AVAudioPlayer!
    let soundNames = ["C","D","E","F","G","A","B"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        setButtons()
    }
    func setButtons() {
        let buttons = [mainView.cKey, mainView.dKey, mainView.eKey, mainView.fKey, mainView.gKey, mainView.aKey, mainView.bKey]
        
        for (index, button) in buttons.enumerated() {
            let soundName = soundNames[index]
            addButtonActions(for: button, soundName: soundName)
        }
    }
    func addButtonActions(for button: UIButton, soundName: String) {
        let tap = UIAction { _ in
            self.playSound(soundFileName: soundName)
            button.layer.opacity = 0.5
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                button.layer.opacity = 1
            }
        }
        button.addAction(tap, for: .touchUpInside)
    }
    func playSound(soundFileName: String) {
        guard let url = Bundle.main.url(forResource: soundFileName, withExtension: "wav") else { return }
        player = try? AVAudioPlayer(contentsOf: url)
        player.play()
    }
}


