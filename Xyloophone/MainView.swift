//
//  MainView.swift
//  Xyloophone
//
//  Created by Иван Семенов on 12.02.2024.
//

import UIKit

class MainView: UIView {
    let cKey = UIButton(title: "C", bg: .systemRed)
    let dKey = UIButton(title: "D", bg: .systemOrange)
    let eKey = UIButton(title: "E", bg: .systemYellow)
    let fKey = UIButton(title: "F", bg: .systemGreen)
    let gKey = UIButton(title: "G", bg: .systemBlue)
    let aKey = UIButton(title: "A", bg: .blue)
    let bKey = UIButton(title: "B", bg: .systemPurple)
    
    init() {
        super.init(frame: CGRect())
        setupUI()
    }
    func setupUI() {
        backgroundColor = .white
        let buttons = [cKey, dKey, eKey, fKey, gKey ,aKey, bKey]
        let stack = UIStackView(views: buttons)
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stack)

        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            stack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            stack.centerXAnchor.constraint(equalTo: centerXAnchor),
            stack.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
        ])
        addLeadingConstraints(for: buttons)
    }
    func addLeadingConstraints(for buttons: [UIButton]) {
        for (index, button) in buttons.dropFirst().enumerated() {
            button.leadingAnchor.constraint(equalTo: buttons[index].leadingAnchor, constant: 5).isActive = true
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension UIStackView {
    convenience init(views: [UIView], axis: NSLayoutConstraint.Axis = .vertical, spacing: CGFloat = 10, alignment: Alignment = .center) {
        self.init(arrangedSubviews: views)
        self.axis = axis
        self.spacing = spacing
        self.alignment = alignment
    }
}
extension UIButton {
    convenience init(title: String, bg: UIColor) {
        self.init(type: .system)
        setTitle(title, for: .normal)
        backgroundColor = bg
        layer.cornerRadius = 12
        tintColor = .white
        titleLabel?.font = .systemFont(ofSize: 26)
        heightAnchor.constraint(equalToConstant: 101).isActive = true
        widthAnchor.constraint(equalToConstant: 404).isActive = true
    }
}

import SwiftUI

struct MainViewProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().ignoresSafeArea()
    }
    struct ContainerView: UIViewRepresentable {
        let view = MainView()
        
        func makeUIView(context: Context) -> some UIView {
            return view
        }
        func updateUIView(_ uiView: UIViewType, context: Context) { }
    }
}
