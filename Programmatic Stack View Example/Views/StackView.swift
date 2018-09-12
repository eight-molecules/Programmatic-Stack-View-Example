//
//  StackView.swift
//  Programmatic Stack View Example
//
//  Created by Grant Elliott on 9/12/18.
//  Copyright © 2018 Grant Elliott. All rights reserved.
//

import UIKit

class StackView: UIStackView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.axis = .horizontal
        self.distribution = .fillEqually
        self.alignment = .fill
        self.spacing = 5
        
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public func addArrangedSubviews(_ views: [UIView]) {
        views.forEach { (view) in
            self.addArrangedSubview(view)
        }
    }
}
