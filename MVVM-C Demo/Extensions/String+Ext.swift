//
//  String+Ext.swift
//  MVVM-C Demo
//
//  Created by Najam Us Saqib on 23/11/2023.
//

import UIKit

extension String {
    func attributedStringWithColor(strings: [String], color: UIColor, font:UIFont, characterSpacing: UInt? = nil) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: self)
        
        for string in strings {
            let range = (self as NSString).range(of: string)
            attributedString.addAttributes([NSAttributedString.Key.font: font, NSAttributedString.Key.foregroundColor: color], range: range)
        }
        
        guard let characterSpacing = characterSpacing else {return attributedString}
        
        attributedString.addAttribute(NSAttributedString.Key.kern, value: characterSpacing, range: NSRange(location: 0, length: attributedString.length))
        
        return attributedString
    }
}
