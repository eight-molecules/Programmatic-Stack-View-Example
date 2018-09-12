//
//  ViewController.swift
//  Programmatic Stack View Example
//
//  Created by Grant Elliott on 9/12/18.
//  Copyright © 2018 Grant Elliott. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let colorDict: [String : UIColor] = [
        "Red": UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0),
        "Green": UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0),
        "Blue": UIColor(red: 0.0, green: 0.0, blue: 1.0, alpha: 1.0)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayButtons()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    public func colorButton(withColor color: UIColor, title: String) -> UIButton {
        let button = UIButton(type: .system)
        
        button.backgroundColor = color
        button.setTitle(title, for: .normal)
        button.setTitleColor(.white, for: .normal)
        
        return button
    }
    
    public func displayButtons() {
        let buttonArray: [UIButton] = buildButtonArray()
        
        let stackView = StackView(frame: self.view.frame)
        stackView.addArrangedSubviews(buttonArray)
        
        self.view.addSubview(stackView)
        self.addStackViewConstraints(stackView)
    }
    
    private func buildButtonArray() -> [UIButton] {
        let buttonArray: [UIButton] = self.colorDict.reduce([]) { (acc, colorTuple) in
            let button = colorButton(withColor: colorTuple.value, title: colorTuple.key)
            let result = [button] + acc
            
            return result
        }
        
        return buttonArray
    }
    
    private func addStackViewConstraints(_ stackView: StackView) {
        let margins = self.view.safeAreaLayoutGuide
        stackView.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
    }
}

