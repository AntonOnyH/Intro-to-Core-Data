//
//  UIButtonExt.swift
//  Goals
//
//  Created by Anton Huisamen on 2018/10/24.
//  Copyright © 2018 antonsolo. All rights reserved.
//

import UIKit

extension UIButton {
    
    func setSelectedColor(){
        self.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
    }
    
    func deselectedColor(){
        self.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
    }
}
