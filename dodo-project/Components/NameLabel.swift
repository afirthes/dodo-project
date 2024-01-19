//
//  NameLabel.swift
//  dodo-project
//
//  Created by Artur Igberdin on 22.12.2023.
//

import UIKit

class NameLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commonInit() {
        text = "Сырная"
        font = UIFont.boldSystemFont(ofSize: 20)
    }
}
