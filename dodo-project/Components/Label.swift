//
//  Label.swift
//  dodo-project
//
//  Created by Artur Igberdin on 22.12.2023.
//

import UIKit

class Label: UILabel {
    
    enum LabelStyle {
        case name
        case description
    }
    
    init(style: LabelStyle) {
        super.init(frame: .zero)
        
        switch style {
            
        case .name:
           makeNameLabel()
        case .description:
           makeDescriptionLabel()
        }
    }
    
    func makeNameLabel() {
        text = "Сырная"
        font = UIFont.boldSystemFont(ofSize: 20)
    }
    
    func makeDescriptionLabel() {
        text = "Моцарелла, сыры чеддер и пармезан, фирменный соус альфредо"
        numberOfLines = 0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
